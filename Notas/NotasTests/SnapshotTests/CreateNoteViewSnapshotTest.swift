//
//  CreateNoteViewSnapshotTest.swift
//  NotasTests
//
//  Created Adolfo on 15/08/2024

import XCTest
import SnapshotTesting
@testable import Notas

final class CreateNoteViewSnapshotTest: XCTestCase {
    
    func testCreateNoteView() throws {
        let createNoteView = CreateNoteView(viewModel: .init())
        assertSnapshot(of: createNoteView, as: .image)
    }
    
    func testCreateNoteViewWithData() {
        let createNoteView = CreateNoteView(viewModel: .init(),
                                            title: "Suscríbete a SwiftBeta!",
                                            text: "Apoya al canal 🎉")
        assertSnapshot(of: createNoteView, as: .image)
    }
}
