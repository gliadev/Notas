//
//  CreateNoteUseCase.swift
//  Notas
//
//  Created by Adolfo on 20/7/24.
//

import Foundation

protocol CreateNoteProtocol {
    func createNoteWith(title: String, text: String) throws
}

struct CreateNoteUseCase: CreateNoteProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func createNoteWith(title: String, text: String) throws {
        let note: Note = .init(identifier: .init(), title: title, text: text, createdAt: .now)
        try notesDatabase.insert(note: note)
    }
}