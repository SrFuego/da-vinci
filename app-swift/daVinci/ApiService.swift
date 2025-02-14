import Foundation

class ApiService {
    static let shared = ApiService()
    
    func getIndividualQuestion(completion: @escaping (Result<Question, Error>) -> Void) {
        guard let url = URL(string: "https://api.example.com/api/v1/pregunta_individual/") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let question = try JSONDecoder().decode(Question.self, from: data)
                completion(.success(question))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct Question: Codable {
    let enunciado: String
    let alternativas: [Alternativa]
}

struct Alternativa: Codable {
    let valor: String
}