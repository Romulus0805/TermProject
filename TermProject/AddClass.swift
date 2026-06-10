//
//  AddClass.swift
//  TermProject
//
//  Created by Mobile on 3/26/26.
//

import SwiftUI
import SwiftData

struct AddClass: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var newClassName = ""
    @State private var newClassGrade = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Class Name", text: $newClassName)
                TextField("Grade", text: $newClassGrade)
            }
            .navigationTitle("Add Class")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newClass = Classes(name: newClassName, grade: newClassGrade)
                        context.insert(newClass)
                        try? context.save()
                        dismiss()
                    }
                    .disabled(newClassName.isEmpty || newClassGrade.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddClass()
        .modelContainer(SampleData.shared.modelContainer)
}
