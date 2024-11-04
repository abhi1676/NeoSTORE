import Foundation

enum HTTPMethod {
    case get
    case post
    var rawValue : String{
    switch self
    {
        case .get :
            return Constants.get
        case .post :
            return Constants.post
    }
}
}


enum DataError: Error {
    case invalidResponse
    case invalidDecoding
    case invalidURL
    case invalidData
    case network(String)
}

typealias Handler<T> = (Result<T, DataError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func manager<T: Codable, U: Codable>(
        modelType: T.Type,
        type: EndPointType,
        requestModel: U?,
        method: HTTPMethod,
        completion: @escaping Handler<T>
    ) {
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        // Setting Headers
        let headers = type.headers
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        // Post request
        if let requestModel = requestModel, method == .post {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(requestModel)
                urlRequest.setValue(Constants.applicationOrJson, forHTTPHeaderField: Constants.httpHeaderField)
            } catch {
                completion(.failure(.network(Constants.requestModelFailure)))
                return
            }
        }
        
       
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.network(error.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.invalidDecoding))
            }
        }
        
        task.resume()
    }
}
