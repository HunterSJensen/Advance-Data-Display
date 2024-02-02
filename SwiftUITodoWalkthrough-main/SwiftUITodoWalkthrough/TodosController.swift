//
//  TodosController.swift
//  SwiftUITodoWalkthrough
//
//  Created by Megan Schmoyer on 1/23/24.
//

import Foundation

class TodosController: ObservableObject {
    @Published var sections: [TodoSection]
    
    func addNewCategory(_ categoryTitle: String) {
            let newCategory = TodoSection(sectionTitle: categoryTitle, todos: [])
            sections.append(newCategory)
        }
    init() {
        sections = TodoSection.dummySections
    }
}
