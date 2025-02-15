//
//  SorprendemeViewModel.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 14/02/25.
//


import Foundation

class SorprendemeViewModel: ObservableObject {
    @Published var currentQuestion: Question?
    @Published var isLoading = false
    @Published var error: Error?
    @Published var respuesta: RespuestaData?
    
    func fetchRandomQuestion() {
        respuesta = nil
        isLoading = true
        ApiService.shared.getIndividualQuestion { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let question):
                    self?.currentQuestion = question
                case .failure(let error):
                    self?.error = error
                }
            }
        }
    }
    
    func submitAnswer(alternativaId: Int) {
        isLoading = true
        ApiService.shared.submitAnswer(alternativaId: alternativaId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let respuesta):
                    self?.respuesta = respuesta
                case .failure(let error):
                    self?.error = error
                }
            }
        }
    }
}
