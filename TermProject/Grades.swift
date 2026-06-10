//
//  Grades.swift
//  TermProject
//
//  Created by Mobile on 3/19/26.
//
import SwiftUI
import SwiftData

struct Grades: View {
    
    @Query(sort: \Classes.name) private var classGrades: [Classes]
    @Environment(\.modelContext) private var context
    
    @State private var showingAddSheet = false
    
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        NavigationStack {
            Group{
                if !classGrades.isEmpty {
                    List {
                        ForEach(classGrades) { classItem in
                            HStack {
                                Text(classItem.name)
                                Spacer()
                                if editMode?.wrappedValue == .active {
                                    TextField("Grade", text: Binding(
                                        get: { classItem.grade },
                                        set: { classItem.grade = $0 }
                                    ))
                                    //.keyboardType(.decimalPad)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 80)
                                } else {
                                    Text(classItem.grade)
                                }
                            }
                        }
                        .onDelete(perform: deleteClasses)
                    }
                    .scrollContentBackground(.hidden)
               
                    
                } else {
                    ZStack {
                        Color.clear
                        VStack {
                            Text("On this page you will input your grades. This app will record them and show you your average on the other page.")
                            Text("So please add a class with your grade in it.")
                            
                        }
                }
                }
            }
            .background(
                LinearGradient(colors: [.blue, .red], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea())
            .navigationTitle("Class")
            .toolbar {
                ToolbarItem {
                    //Button("Add class", systemImage: "plus", action: addClass)
                    Button("Add class", systemImage: "plus") {
                        showingAddSheet = true
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            AddClass()
        }
    }
    private func deleteClasses(at offsets: IndexSet) {
        for index in offsets {
            context.delete(classGrades[index])
        }
    }
}

#Preview {
    Grades()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("No Data") {
    Grades()
//        .modelContainer(SampleData.shared.modelContainer)
}
