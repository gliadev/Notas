//
//  ViewModelIntegrationTests.swift
//  NotasTests
//
//  Adolfo on 15/08/2024
//

import XCTest
@testable import Notas

//@MainActor
// Esta clase contiene pruebas de integración para el ViewModel de la aplicación Notas.
final class ViewModelIntegrationTests: XCTestCase {
    // Variable que actúa como el sistema bajo prueba (System Under Test - SUT).
    var sut: ViewModel!
    
    // Configuración inicial antes de cada prueba.
    @MainActor
    override func setUpWithError() throws {
        // Se crea una base de datos en memoria para pruebas.
        let database = NotesDatabase.shared
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        // Se configuran los casos de uso con la base de datos en memoria.
        let createNoteUseCase = CreateNoteUseCase(notesDatabase: database)
        let fetchAllNotesUseCase = FetchAllNotesUseCase(notesDatabase: database)
        
        // Se inicializa el ViewModel con los casos de uso configurados.
        sut = ViewModel(createNoteUseCase: createNoteUseCase,
                        fetchAllNotesUseCase: fetchAllNotesUseCase)
    }
    
    @MainActor
    override func tearDownWithError() throws {
        // Se pueden añadir acciones de limpieza después de cada prueba si es necesario.
    }
    
    // Prueba de integración para verificar la creación de una nota.
    @MainActor
    func testCreateNote() {
        // Given: Se crea una nota con un título y un texto.
        sut.createNoteWith(title: "Hello 1", text: "text 1")
        
        // When: Se obtiene la primera nota de la lista.
        let note = sut.notes.first
        
        // Then: Se verifica que la nota se haya creado correctamente.
        XCTAssertNotNil(note)
        XCTAssertEqual(note?.title, "Hello 1")
        XCTAssertEqual(note?.text, "text 1")
        XCTAssertEqual(sut.notes.count, 1, "Debería haber una nota en la base de datos")
    }
    
    // Prueba de integración para verificar la creación de dos notas.
    @MainActor
    func testCreateTwoNotes() {
        // Given: Se crean dos notas con títulos y textos diferentes.
        sut.createNoteWith(title: "Hello 1", text: "text 1")
        sut.createNoteWith(title: "Hello 2", text: "text 2")
        
        // When: Se obtienen la primera y la última nota de la lista.
        let firstNote = sut.notes.first
        let lastNote = sut.notes.last
        
        // Then: Se verifica que ambas notas se hayan creado correctamente.
        XCTAssertNotNil(firstNote)
        XCTAssertNotNil(lastNote)
        XCTAssertEqual(firstNote?.title, "Hello 1")
        XCTAssertEqual(lastNote?.title, "Hello 2")
        XCTAssertEqual(sut.notes.count, 2, "Debería haber dos notas en la base de datos")
    }
}
