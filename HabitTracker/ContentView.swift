//
//  ContentView.swift
//  HabitTracker
//
//  Created by Zoltan Vegh on 18/04/2025.
//

import SwiftUI

struct Habit: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 1
}

@Observable
class StoredHabits {
    var habits = [Habit]() {
        didSet {
            save()
        }
    }
    
    private let saveKey = "Habits"
    
    init() {
        load()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func load() {
        if let savedData = UserDefaults.standard.data(forKey: saveKey),
            let decoded = try? JSONDecoder().decode([Habit].self, from: savedData) {
                habits = decoded
            }
        }
}

struct ContentView: View {
    @State private var storedHabits = StoredHabits()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($storedHabits.habits) { $habit in
                    NavigationLink {
                        HabitDetailView(habit: $habit, storedHabits: storedHabits)
                    } label: {
                        Text(habit.title)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddNewHabitView(storedHabits: storedHabits)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
// finished day 49
