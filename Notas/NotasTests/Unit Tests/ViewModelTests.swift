//
//  ViewModelTests.swift
//  NotasTests
//
//  Created Adolfo on 15/08/2024
//
import XCTest
@testable import Notas

// Esta clase contiene pruebas unitarias para la clase ViewModel en la aplicación Notas.
final class ViewModelTests: XCTestCase {
    // Variable para almacenar la instancia de ViewModel que se va a probar.
    var viewModel: ViewModel!

    // Configuración inicial antes de cada prueba.
    override func setUpWithError() throws {
        // Se crea una instancia de ViewModel, inyectando mocks de los casos de uso.
        viewModel = ViewModel(createNoteUseCase: CreateNoteUseCaseMock(),
                              fetchAllNotesUseCase: FetchAllNotesUseCaseMock(),
                              updateNoteUseCase: UpdateNoteUseCaseMock(),
                              removeNoteUseCase: RemoveNoteUseCaseMock())
    }

    // Limpieza después de cada prueba.
    override func tearDownWithError() throws {
        // Se limpia la base de datos mock después de cada prueba.
        mockDatabase = []
    }
    
    // Prueba unitaria para verificar la creación de una nota.
    func testCreateNote() {
        // Given: Se definen los valores de título y texto para la nueva nota.
        let title = "Test Title"
        let text = "Test Text"
        
        // When: Se crea una nueva nota usando el ViewModel.
        viewModel.createNoteWith(title: title, text: text)
        
        // Then: Se verifica que la nota se haya creado correctamente.
        XCTAssertEqual(viewModel.notes.count, 1) // Se espera que haya una nota en la lista.
        XCTAssertEqual(viewModel.notes.first?.title, title) // Se verifica que el título coincida.
        XCTAssertEqual(viewModel.notes.first?.text, text) // Se verifica que el texto coincida.
    }
    
    // Prueba unitaria para verificar la creación de tres notas.
    func testCreateThreeNote() {
        // Given: Se definen los títulos y textos para tres notas.
        let title1 = "Test Title 1"
        let text1 = "Test Text 1"
        
        let title2 = "Test Title 2"
        let text2 = "Test Text 2"
        
        let title3 = "Test Title 3"
        let text3 = "Test Text 3"
        
        // When: Se crean las tres notas usando el ViewModel.
        viewModel.createNoteWith(title: title1, text: text1)
        viewModel.createNoteWith(title: title2, text: text2)
        viewModel.createNoteWith(title: title3, text: text3)
        
        // Then: Se verifica que las tres notas se hayan creado correctamente.
        XCTAssertEqual(viewModel.notes.count, 3) // Se espera que haya tres notas en la lista.
        XCTAssertEqual(viewModel.notes[0].title, title1) // Se verifica que el título de la primera nota coincida.
        XCTAssertEqual(viewModel.notes[0].text, text1) // Se verifica que el texto de la primera nota coincida.
        XCTAssertEqual(viewModel.notes[1].title, title2) // Se verifica que el título de la segunda nota coincida.
        XCTAssertEqual(viewModel.notes[1].text, text2) // Se verifica que el texto de la segunda nota coincida.
        XCTAssertEqual(viewModel.notes[2].title, title3) // Se verifica que el título de la tercera nota coincida.
        XCTAssertEqual(viewModel.notes[2].text, text3) // Se verifica que el texto de la tercera nota coincida.
    }
}
