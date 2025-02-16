//
//  TemasViewModel.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 15/02/25.
//

import Foundation

class TemasViewModel: ObservableObject {
    @Published var temas: [Tema] = []
    @Published var isLoading = false
    @Published var error: Error?

    func fetchTemas(cursoSlug: String) {
        isLoading = true
        ApiService.shared.getTemas(cursoSlug: cursoSlug) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                    case let .success(temas):
                        self?.temas = temas
                    case let .failure(error):
                        self?.error = error
                }
            }
        }
    }
}
