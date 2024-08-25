//
//  Note.swift
//  Notas
//
//  Created by Adolfo on 19/7/24.
//

import Foundation
import SwiftData


// La clase Note representa una nota en la aplicación, que es identificable y compatible con Hashable.
@Model
class Note: Identifiable, Hashable {
    // Identificador único para cada nota.
    @Attribute(.unique) var identifier: UUID
    // Título de la nota.
    var title: String
    // Texto opcional de la nota.
    var text: String?
    // Fecha de creación de la nota.
    var createdAt: Date
    
    // Propiedad computada que devuelve el texto de la nota o una cadena vacía si el texto es nil.
    var getText: String {
        text ?? ""
    }
    
    // Inicializador que configura todas las propiedades de la nota.
    init(identifier: UUID = UUID(), title: String, text: String?, createdAt: Date) {
        self.identifier = identifier
        self.title = title
        self.text = text
        self.createdAt = createdAt
    }
}
