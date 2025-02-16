//
//  RespuestaIndividualView.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 14/02/25.
//

import SwiftUI

struct RespuestaIndividualView: View {
    let respuesta: RespuestaData
    let onNextQuestion: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Puntaje obtenido: \(Int(respuesta.puntaje_obtenido))")
                    .font(.title2)
                    .padding()
                    .id("top")

                if let curso = respuesta.solucion.pregunta.tema?.curso?.nombre {
                    Text(curso)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                }

                if let tema = respuesta.solucion.pregunta.tema?.nombre {
                    Text(tema)
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }

                Text(respuesta.solucion.pregunta.enunciado)
                    .font(.title3)
                    .padding()
                    .multilineTextAlignment(.leading)

                ForEach(
                    respuesta.solucion.pregunta.alternativas,
                    id: \.id
                ) { alternativa in
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(
                                getAlternativaColor(alternativa: alternativa)
                            )

                        Text(alternativa.valor)
                            .foregroundColor(.primary)

                        Spacer()
                    }
                    .padding()
                    .background(
                        alternativa.id == respuesta.alternativa_enviada
                            .id ? Color.blue.opacity(0.1) : Color
                            .clear
                    )
                    .cornerRadius(8)
                    .padding(.horizontal)
                }

                Text("Resolución:")
                    .font(.title3)
                    .padding()

                Text(respuesta.solucion.resolucion)
                    .padding(.horizontal)

                Button(action: onNextQuestion) {
                    Text("Curso Aleatorio")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private func getAlternativaColor(alternativa: Alternativa) -> Color {
        if alternativa.id == respuesta.solucion.alternativa_correcta.id {
            return .green
        }
        if alternativa.id == respuesta.alternativa_enviada.id,
           !respuesta.es_correcta
        {
            return .red
        }
        return .gray
    }
}
