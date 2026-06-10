//
//  TermProjectApp.swift
//  TermProject
//
//  Created by Mobile on 3/18/26.
//

import SwiftUI
import SwiftData

@main
struct TermProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Classes.self)
        }
    }
}
