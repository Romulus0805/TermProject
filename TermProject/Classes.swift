//
//  Classes.swift
//  TermProject
//
//  Created by Mobile on 3/20/26.
//
import Foundation
import SwiftData

@Model
class Classes {
    var name: String = ""
    var grade: String = ""
    
    init(name: String, grade: String) {
        self.name = name
        self.grade = grade
    }
    
    static let sampleData = [
        Classes(name: "Math", grade: "A"),
        Classes(name: "Science", grade: "B"),
        Classes(name: "History", grade: "C"),
    ]
}
