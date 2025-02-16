//
//  PreguntaIndividualView.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 15/02/25.
//

import SwiftUI

struct PreguntaIndividualView: View {
    @StateObject private var viewModel = CursosViewModel()

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
                        ForEach(viewModel.cursos, id: \.slug) { curso in
                            NavigationLink(
                                destination: TemasView(curso: curso)
                            ) {
                                Text(curso.nombre)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue.opacity(0.1))
                                    .foregroundColor(.primary)
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationTitle("Lista de Cursos")
        .onAppear {
            viewModel.fetchCursos()
        }
    }
}
