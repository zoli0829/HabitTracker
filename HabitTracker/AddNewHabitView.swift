//
//  AddNewHabitView.swift
//  HabitTracker
//
//  Created by Zoltan Vegh on 18/04/2025.
//

import SwiftUI

struct AddNewHabitView: View {
    @Bindable var storedHabits: StoredHabits
    @State var title: String = ""
    @State var description: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Description", text: $description)
            
            Button("Save") {
                let newHabit = Habit(title: title, description: description)
                storedHabits.habits.append(newHabit)
                dismiss()
            }
        }
        .navigationTitle("New Habit")
    }
}

#Preview {
    AddNewHabitView(storedHabits: StoredHabits())
}
