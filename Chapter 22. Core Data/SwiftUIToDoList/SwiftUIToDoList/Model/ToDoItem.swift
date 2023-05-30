//
//  ToDoItem.swift
//  SwiftUIToDoList
//
//  Created by Maxim Brishten on 30.05.23.
//

import Foundation
import CoreData

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}

//class ToDoItem: ObservableObject, Identifiable {
//    var id = UUID()
//    @Published var name: String = ""
//    @Published var priority: Priority = .normal
//    @Published var isComplete: Bool = false
//
//    init(name: String, priority: Priority = .normal, isComplete: Bool = false) {
//        self.name = name
//        self.priority = priority
//        self.isComplete = isComplete
//    }
//}

public class ToDoItem: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var priorityNum: Int32
    @NSManaged public var isComplete: Bool
}

extension ToDoItem {

    var priority: Priority {
        get {
            return Priority(rawValue: Int(priorityNum)) ?? .normal
        }

        set {
            self.priorityNum = Int32(newValue.rawValue)
        }
    }
}
