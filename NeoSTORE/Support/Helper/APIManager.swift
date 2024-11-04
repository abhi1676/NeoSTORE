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
                let encoder = URLFormParameterEncoder()
                let parameterString = try encoder.encode(requestModel)
           
                if let httpBodyData = parameterString.data(using: .utf8) {
                           urlRequest.httpBody = httpBodyData
                       }
               // let jsonString =
               // let urlRequest.httpBody = requestModel.data(using: .utf8)
                urlRequest.setValue(Constants.applicationOrFormURLEndcoded, forHTTPHeaderField: Constants.httpHeaderField)
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


struct URLFormParameterEncoder {
    func encode<T: Encodable>(_ value: T) throws -> String {
        let mirror = Mirror(reflecting: value)
        var components: [String] = []
        
        for child in mirror.children {
            guard let label = child.label else { continue }
            if let value = child.value as? CustomStringConvertible {
                let encodedKey = label.urlEncoded() ?? ""
                let encodedValue = value.description.urlEncoded() ?? ""
                components.append("\(encodedKey)=\(encodedValue)")
            }
        }
        
        return components.joined(separator: "&")
    }
}

extension String {
    func urlEncoded() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
