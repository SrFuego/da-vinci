import Foundation

enum ApiError: Error {
    case invalidURL
    case noData
    case decodingError
    case networkError(Error)
}

class ApiService {
    static let shared = ApiService()
    private let baseURL = "https://srfuego.pythonanywhere.com/api/v1/"
    
    func getIndividualQuestion(completion: @escaping (Result<Question, ApiError>) -> Void) {
        guard let url = URL(string: "\(baseURL)pregunta_individual/") else {
            print("Invalid URL")
            completion(.failure(.invalidURL))
            return
        }
        
        print("Requesting: \(url)")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error)")
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(.failure(.noData))
                return
            }
            
            do {
                let question = try JSONDecoder().decode(Question.self, from: data)
                print("Received question: \(question)")
                completion(.success(question))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func submitAnswer(alternativaId: Int, completion: @escaping (Result<RespuestaData, ApiError>) -> Void) {
        guard let url = URL(string: "\(baseURL)pregunta_individual/") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody = ["alternativa_seleccionada_id": alternativaId]
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            completion(.failure(.decodingError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let respuesta = try JSONDecoder().decode(RespuestaData.self, from: data)
                completion(.success(respuesta))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}


struct Alternativa: Codable {
    let id: Int
    let valor: String
}

struct Question: Codable {
    let enunciado: String
    let alternativas: [Alternativa]
    let tema: Tema?
}

struct Tema: Codable {
    let nombre: String
    let slug: String
    let curso: Curso?
}

struct Curso: Codable {
    let nombre: String
    let slug: String
}

struct RespuestaData: Codable {
    let solucion: Solucion
    let alternativa_enviada: Alternativa
    let es_correcta: Bool
    let puntaje_obtenido: Double
}

struct Solucion: Codable {
    let teoria: String
    let resolucion: String
    let pregunta: Question
    let alternativa_correcta: Alternativa
}

