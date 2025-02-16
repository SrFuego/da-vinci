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
    @State private var navigateToQuestion = false
    @State private var selectedTemaSlug: String?
    @State private var isRandomTema = false

    var body: some View {
        NavigationStack {
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
                            NavigationLink(
                                destination: PreguntaView(
                                    cursoSlug: curso
                                        .slug
                                )
                            ) {
                                Text("Tema Aleatorio")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal)

                            ForEach(viewModel.temas, id: \.slug) { tema in
                                NavigationLink(
                                    destination: PreguntaView(
                                        temaSlug: tema
                                            .slug
                                    )
                                ) {
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
}
