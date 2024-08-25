//
//  Mocks.swift
//  NotasTests
//
//  Created Adolfo on 15/08/2024
//

@testable import Notas
import Foundation

// Variable global para simular la base de datos en memoria durante las pruebas.
var mockDatabase: [Note] = []

// Mock para el caso de uso CreateNoteUseCase, que simula la creación de una nota.
struct CreateNoteUseCaseMock: CreateNoteProtocol {
    func createNoteWith(title: String, text: String) throws {
        // Se crea una nueva nota y se añade a la base de datos simulada.
        let note = Note(title: title, text: text, createdAt: .now)
        mockDatabase.append(note)
    }
}

// Mock para el caso de uso FetchAllNotesUseCase, que simula la obtención de todas las notas.
struct FetchAllNotesUseCaseMock: FetchAllNotesProtocol {
    func fetchAll() throws -> [Note] {
        // Se devuelve la base de datos simulada.
        return mockDatabase
    }
}

// Mock para el caso de uso UpdateNoteUseCase, que simula la actualización de una nota.
struct UpdateNoteUseCaseMock: UpdateNoteProtocol {
    func updateNoteWith(identifier: UUID, title: String, text: String?) throws {
        // Se busca la nota por su identificador y se actualiza si existe.
        if let index = mockDatabase.firstIndex(where: { $0.identifier == identifier }) {
            mockDatabase[index].title = title
            mockDatabase[index].text = text
        }
    }
}

// Mock para el caso de uso RemoveNoteUseCase, que simula la eliminación de una nota.
struct RemoveNoteUseCaseMock: RemoveNoteProtocol {
    func removeNoteWith(identifier: UUID) throws {
        // Se busca la nota por su identificador y se elimina si existe.
        if let index = mockDatabase.firstIndex(where: { $0.identifier == identifier }) {
            mockDatabase.remove(at: index)
        }
    }
}
