//
//  QuestionViewModel.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 14/02/25.
//

import Foundation

class QuestionViewModel: ObservableObject {
    @Published var currentQuestion: Question?
    @Published var isLoading = false
    @Published var error: Error?
    
    func fetchQuestion() {
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
}
