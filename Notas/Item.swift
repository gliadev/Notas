//
//  Item.swift
//  Notas
//
//  Created by Adolfo on 19/7/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
