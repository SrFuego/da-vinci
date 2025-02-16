//
//  CursosViewModel.swift
//  daVinci
//
//  Created by Jesús De la Cruz on 15/02/25.
//

import Foundation

class CursosViewModel: ObservableObject {
    @Published var cursos: [Curso] = []
    @Published var isLoading = false
    @Published var error: Error?

    func fetchCursos() {
        isLoading = true
        ApiService.shared.getCursos { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                    case let .success(cursos):
                        self?.cursos = cursos
                    case let .failure(error):
                        self?.error = error
                }
            }
        }
    }
}
