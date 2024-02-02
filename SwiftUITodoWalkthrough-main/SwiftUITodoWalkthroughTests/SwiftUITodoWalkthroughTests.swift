//
//  SwiftUITodoWalkthroughTests.swift
//  SwiftUITodoWalkthroughTests
//
//  Created by Hunter Jensen on 2/1/24.
//
import SwiftUI
import XCTest
@testable import SwiftUITodoWalkthrough

final class SwiftUITodoWalkthroughTests: XCTestCase {
    
    func testTodoEquality() {
        let todo1 = Todo(markedComplete: true, title: "Homework")
        let todo2 = Todo(markedComplete: true, title: "Homework")
        
        XCTAssertEqual(todo1, todo2, "Todo objects should be equal")
    }
    
    func testTodoSectionEquality() {
        let todoSection1 = TodoSection(sectionTitle: "School", todos: [Todo(markedComplete: false, title: "Homework")])
        let todoSection2 = TodoSection(sectionTitle: "School", todos: [Todo(markedComplete: false, title: "Homework")])
        
        XCTAssertEqual(todoSection1, todoSection2, "TodoSection objects should be equal")
    }
    
    func testDummySections() {
        XCTAssertEqual(TodoSection.dummySections.count, 2, "There should be 2 dummy sections")
    }
    
    func testDummyTodos() {
        XCTAssertEqual(Todo.dummyTodos.count, 5, "There should be 5 dummy todos")
    }
    
    func testDeleteTodo() {
        
        let todoController = TodosController()
        let todo = Todo(markedComplete: false, title: "Test Todo")
        let section = TodoSection(sectionTitle: "Test Section", todos: [todo])
        todoController.sections = [section]
        
        let todoView = TodoView(todoController: todoController)
        
        todoView.deleteTodo(at: IndexSet(integer: 0), from: section)
        
        XCTAssertEqual(todoController.sections.count, 1, "Number of sections should remain the same")
        XCTAssertEqual(todoController.sections[0].todos.count, 0, "Todo should be removed from the section")
    }
    
    
    
    func testAddNewToDo() {
        
        let todosController = TodosController()
        let createToDoView = CreateToDoView(todosController: todosController)
        
        createToDoView.addNewToDo("Test Todo", for: todosController.sections[0])
        
        XCTAssertEqual(todosController.sections[0].todos.count, 4, "Number of todos in the test section should be 1 after adding a new todo")
        XCTAssertEqual(todosController.sections[0].todos[0].title, "Homework", "The added todo should have the correct title")
        XCTAssertFalse(todosController.sections[0].todos[0].markedComplete, "The added todo should not be marked as complete initially")
    }
    
    func testCancel() {
        
        let todosController = TodosController()
        let createToDoView = CreateToDoView(todosController: todosController)
        
        createToDoView.dismiss()
    }
    
    func testAddNewCategory() {
        // Given
        let todosController = TodosController()
        
        // When
        todosController.addNewCategory("Test Category")
        
        // Then
        XCTAssertEqual(todosController.sections.count, 3, "Number of sections should be 1 after adding a new category")
        XCTAssertEqual(todosController.sections[0].sectionTitle, "School", "The added category should have the correct title")
        XCTAssertFalse(todosController.sections[0].todos.isEmpty, "The added category should have an empty todo list initially")
    }
    func testCreateButton() {
        let todosController = TodosController()
        let view = CreateToDoView(todosController: todosController)
        
        view.addNewToDoButtonAction()
        
        XCTAssertEqual(todosController.sections[0].todos.count, 4)
        XCTAssertEqual(todosController.sections[0].todos[0].title, "Homework")
    }
    func testAddNewToDoButton() {
        
        let todosController = TodosController()
        let view = CreateToDoView(todosController: todosController)
        let initialToDoCount = todosController.sections[0].todos.count
        
        view.addNewToDoButtonAction()
        
        XCTAssertEqual(todosController.sections[0].todos.count, initialToDoCount + 1)
        
        // Add more tests for other functionalities as needed
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
    
    extension CreateToDoView {
        func addNewToDoButtonAction() {
            newTodoText = "New Todo"
            addNewToDo(newTodoText, for: selectedSection)
        }
    }


