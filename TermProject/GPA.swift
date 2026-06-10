//
//  GPA.swift
//  TermProject
//
//  Created by Mobile on 3/19/26.
//
import SwiftUI
import SwiftData

struct GPA: View {
    @Query private var classGrades: [Classes]
    
    var gpa: Double {
        guard !classGrades.isEmpty else { return 0.0 }
        
        let total = classGrades.reduce(0.0) { sum, classItem in
            sum + gradeToPoints(classItem.grade)
        }
        return total / Double(classGrades.count)
    }
    
    private func gradeToPoints(_ grade: String) -> Double {
        let letter = grade.trimmingCharacters(in: .whitespaces)
                         .prefix(1)
                         .uppercased()
        switch letter {
        case "A": return 4.0
        case "B": return 3.0
        case "C": return 2.0
        case "D": return 1.0
        default: return 0.0
        }
    }
    
    var body: some View {
        ZStack {
                LinearGradient(colors: [.red, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            VStack(spacing: 20) {
                if classGrades.isEmpty {
                    Text("Add classes in the Courses tab to see your GPA.")
                } else {
                    Text("Your GPA")
                        .font(.title2)
                    Text(String(format: "%.2f", gpa))
                        .font(.system(size: 60, weight: .bold))
                    Text("Based on \(classGrades.count) class\(classGrades.count == 1 ? "" : "es")")
                        //.foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("GPA")
    }
}

#Preview {
    GPA()
        .modelContainer(SampleData.shared.modelContainer)
}
