//
//  NotasTests.swift
//  NotasTests
//
//  Created by Adolfo on 15/08/2024

import XCTest
@testable import Notas


// Esta clase contiene pruebas unitarias para el modelo Note.
final class NoteTest: XCTestCase {

    // Prueba unitaria para verificar la inicialización de una nota.
    func testNoteInitialization() {
        // Given or Arrange: Se preparan los datos iniciales para crear una nota.
        let title = "Test Title"
        let text = "Test Text"
        let date = Date()
        
        // When or Act: Se crea una instancia de Note con los datos preparados.
        let note = Note(title: title, text: text, createdAt: date)
        
        // Then or Assert: Se verifica que las propiedades de la nota coincidan con los valores iniciales.
        XCTAssertEqual(note.title, title, "Title should be equal to Test Title")
        XCTAssertEqual(note.text, text)
        XCTAssertEqual(note.createdAt, date)
    }
    
    // Prueba unitaria para verificar el comportamiento cuando el texto de la nota está vacío.
    func testNoteEmptyText() {
        // Given: Se define un título y una fecha, pero no se proporciona texto.
        let title = "Test Title"
        let date = Date()
        
        // When: Se crea una nota sin texto (nil).
        let note = Note(title: title, text: nil, createdAt: date)
        
        // Then: Se verifica que el método getText devuelva un string vacío.
        XCTAssertEqual(note.getText, "")
    }
}
