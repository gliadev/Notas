//
//  FetchAllNotesUseCase.swift
//  Notas
//
//  Created by Adolfo on 20/7/24.
//

import Foundation

protocol FetchAllNotesProtocol {
    func fetchAll() throws -> [Note]
}

struct FetchAllNotesUseCase: FetchAllNotesProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func fetchAll() throws -> [Note] {
        try notesDatabase.fetchAll()
    }
}
