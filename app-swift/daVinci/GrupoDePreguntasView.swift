import SwiftUI

struct GrupoDePreguntasView: View {
    @StateObject private var viewModel = QuestionViewModel()

    var body: some View {
        VStack {
            if let question = viewModel.currentQuestion {
                Text(question.enunciado)
                    .padding()
                    .font(.title3)

                ForEach(question.alternativas, id: \.valor) { alternativa in
                    Button(action: {
                        // Handle selection
                    }) {
                        Text(alternativa.valor)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Pregunta Individual")
        .onAppear {
            viewModel.fetchQuestion()
        }
    }
}
