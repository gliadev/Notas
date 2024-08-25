//
//  CreateNoteViewSnapshotTest.swift
//  NotasTests
//
//  Created Adolfo on 15/08/2024

import XCTest
import SnapshotTesting
@testable import Notas


// Esta clase contiene pruebas de snapshot para la vista CreateNoteView.
final class CreateNoteViewSnapshotTest: XCTestCase {
    
    // Prueba de snapshot para verificar la vista CreateNoteView sin datos.
    func testCreateNoteView() throws {
        // Se crea una instancia de CreateNoteView con un ViewModel vacío.
        let createNoteView = CreateNoteView(viewModel: .init())
        // Se captura un snapshot de la vista y se compara con la referencia guardada.
        assertSnapshot(of: createNoteView, as: .image)
    }
    
    // Prueba de snapshot para verificar la vista CreateNoteView con datos predefinidos.
    func testCreateNoteViewWithData() {
        // Se crea una instancia de CreateNoteView con datos específicos.
        let createNoteView = CreateNoteView(viewModel: .init(),
                                            title: "Suscríbete a SwiftBeta!",
                                            text: "Apoya al canal 🎉")
        // Se captura un snapshot de la vista con los datos y se compara con la referencia guardada.
        assertSnapshot(of: createNoteView, as: .image)
    }
}
