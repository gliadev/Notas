//
//  viewModel.swift
//  Notas
//
//  Created by Adolfo on 19/7/24.
//

import Foundation


class ViewModel: ObservableObject {
    
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
}
