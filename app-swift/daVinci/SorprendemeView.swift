//
//  SorprendemeView.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 14/02/25.
//

import SwiftUI

struct SorprendemeView: View {
    @StateObject private var viewModel = SorprendemeViewModel()
    @State private var selectedAlternative: Alternativa?

    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if let respuesta = viewModel.respuesta {
                        RespuestaIndividualView(
                            respuesta: respuesta,
                            onNextQuestion: {
                                viewModel.fetchRandomQuestion()
                                withAnimation {
                                    scrollProxy.scrollTo("top", anchor: .top)
                                }
                            }
                        )
                    } else if let question = viewModel.currentQuestion {
                        if let curso = question.tema?.curso?.nombre {
                            Text(curso)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .id("top")
                        }

                        if let tema = question.tema?.nombre {
                            Text(tema)
                                .font(.title2)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }

                        Text(question.enunciado)
                            .font(.title3)
                            .padding()
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)

                        ForEach(
                            question.alternativas,
                            id: \.id
                        ) { alternativa in
                            Button(action: {
                                selectedAlternative = alternativa
                            }) {
                                HStack {
                                    Image(
                                        systemName: selectedAlternative?
                                            .id == alternativa
                                            .id ? "circle.fill" : "circle"
                                    )
                                    .foregroundColor(.blue)

                                    Text(alternativa.valor)
                                        .foregroundColor(.primary)

                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal)
                        }

                        Spacer(minLength: 20)

                        HStack {
                            Button(action: {
                                selectedAlternative = nil
                                viewModel.currentQuestion = nil
                                viewModel.isLoading = true

                                DispatchQueue.main.async {
                                    viewModel.fetchRandomQuestion()
                                }
                            }) {
                                Text("Saltar")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue.opacity(0.1))
                                    .foregroundColor(.blue)
                                    .cornerRadius(8)
                            }

                            Button(action: {
                                if let alternativa = selectedAlternative {
                                    viewModel
                                        .submitAnswer(
                                            alternativaId: alternativa
                                                .id
                                        )
                                }
                            }) {
                                Text("Enviar")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        selectedAlternative != nil ?
                                            Color.blue : Color.gray
                                    )
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .disabled(selectedAlternative == nil)
                        }
                        .padding()
                    } else if viewModel.isLoading {
                        ScrollView {
                            Color.clear
                                .frame(
                                    height: UIScreen.main.bounds
                                        .height / 2.5
                                )
                            ProgressView()
                                .scaleEffect(2.5)
                                .frame(maxWidth: .infinity)
                            Color.clear
                                .frame(
                                    height: UIScreen.main.bounds
                                        .height / 2.5
                                )
                        }
                    } else if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchRandomQuestion()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
