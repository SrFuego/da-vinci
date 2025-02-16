//
//  TemasView.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 15/02/25.
//

import SwiftUI

struct TemasView: View {
    let curso: Curso
    @StateObject private var viewModel = TemasViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2.5)
                    .frame(maxWidth: .infinity)
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
                    .foregroundColor(.red)
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        Button(action: {
                            // TODO: Implementar tema aleatorio
                        }) {
                            Text("Tema Aleatorio")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)

                        ForEach(viewModel.temas, id: \.slug) { tema in
                            Button(action: {
                                // TODO: Implementar selección de tema
                            }) {
                                Text(tema.nombre)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationTitle(curso.nombre)
        .onAppear {
            viewModel.fetchTemas(cursoSlug: curso.slug)
        }
    }
}
