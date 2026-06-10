//
//  ContentView.swift
//  TermProject
//
//  Created by Mobile on 3/18/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                    Home()
                }
            }
            Tab("Courses", systemImage: "doc") {
                NavigationStack {
                    Grades()
                }
            }
            Tab("GPA", systemImage: "barcode") {
                NavigationStack {
                    GPA()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
//welcom to the N.H.K.
