//
//  NotasTests.swift
//  NotasTests
//
//  Created by Adolfo on 15/08/2024

import XCTest
@testable import Notas

final class NoteTest: XCTestCase {

    func testNoteInitialization() {
        // Given or Arrange
        let title = "Test Title"
        let text = "Test Text"
        let date = Date()
        
        // When or Act
        let note = Note(title: title, text: text, createdAt: date)
        
        // Then or Assert
        XCTAssertEqual(note.title, title, "Title should be equal to Test Title")
        XCTAssertEqual(note.text, text)
        XCTAssertEqual(note.createdAt, date)
    }
    
    func testNoteEmptyText() {
        // Given
        let title = "Test Title"
        let date = Date()
        
        // When
        let note = Note(title: title, text: nil, createdAt: date)
        
        // Then
        XCTAssertEqual(note.getText, "")
    }
}
