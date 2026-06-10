//
//  Home.swift
//  TermProject
//
//  Created by Mobile on 3/19/26.
//
import SwiftUI

struct Home: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Hello, this is an app to record your grades")
                Text("You can add, delete, and edit them")
                Text("You can do that on the other pages")
                Image(systemName: "note.text")
            }
            .padding()
        }
    }
}

#Preview {
    Home()
}
