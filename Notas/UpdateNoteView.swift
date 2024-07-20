//
//  UpdateNoteView.swift
//  Notas
//
//  Created by Adolfo on 19/7/24.
//

import SwiftUI

struct UpdateNoteView: View {
    @ObservedObject var viewModel: ViewModel
    let id: UUID
    @State var title: String
    @State var text: String

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("*Título", text: $title)
                    TextField("Texto", text: $text)
                }
            }
            .navigationTitle("Modificar Nota")
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.updateNoteWith(id: id, newTitle: title, newText: text)
                        dismiss()
                    } label: { Text("Guardar").bold() }
                }
            }
            Button(action: {
                viewModel.removeNoteWith(id: id)
                dismiss()
            }, label: {
                Text("Eliminar Nota")
                    .foregroundStyle(.gray)
                    .underline()
            })
            .buttonStyle(BorderlessButtonStyle())
            Spacer()
        }
    }
}
