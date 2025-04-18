//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Zoltan Vegh on 18/04/2025.
//

import SwiftUI

struct HabitDetailView: View {
    @Binding var habit: Habit
    var storedHabits: StoredHabits
    
    var body: some View {
        Form {
            Text(habit.title)
                .font(.title)
            Text(habit.description)
                .font(.body)
            
            // Current completion count
            Text("Completion count: \(habit.completionCount)")
                .font(.headline)
            
            // Increment button
            Button("", systemImage: "plus") {
                habit.completionCount += 1
                storedHabits.save()
            }
        }
        .navigationTitle("Habit Detail")
    }
}
