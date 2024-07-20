//
//  CreateNoteView.swift
//  Notas
//
//  Created by Adolfo on 19/7/24.
//

import SwiftUI

struct CreateNoteView: View {
    @ObservedObject var viewModel: ViewModel
        @State var title: String = ""
        @State var text: String = ""

        @Environment(\.dismiss) private var dismiss

        var body: some View {
            NavigationStack {
                Form {
                    Section {
                        TextField("*Título", text: $title)
                        TextField("Texto", text: $text)
                    } footer: {
                        Text("*El título es obligatorio")
                    }
                }
                .navigationTitle("Nueva Nota")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button { dismiss() } label: { Text("Cerrar") }
                    }
                    ToolbarItem {
                        Button {
                            viewModel.createNoteWith(title: title, text: text)
                            dismiss()
                        } label: { Text("Crear Nota").bold() }
                    }
                }
            }
        }
    }
