//
//  EndPointType.swift
//  NeoSTORE
//
//  Created by Apple on 11/4/24.
//

import Foundation

typealias HTTPHeaders = [String: String]

protocol EndPointType:Codable {
    var baseURL: String { get }
    var path: String { get }
    var url : URL? { get }
    var headers: HTTPHeaders { get }
}




enum EndPointList{
    case login
    case register
}

extension EndPointList:EndPointType{
    
    var baseURL: String {
        return Constants.baseURL
    }
    
    
    var url: URL? {
        return URL(string: "\(Constants.baseURL)\(path)")
    }
    
    var path: String {
        switch self{
        case .login :
            return Constants.login
        case .register:
           return Constants.register
        }
    }
  
    var headers: HTTPHeaders {
           var headers = [
               "Accept": "application/json"
           ]
           
           if let token = UserDefaults.standard.string(forKey: "accessToken") {
               headers["Authorization"] = "Bearer \(token)"
           }
           
           return headers
       }
    
}