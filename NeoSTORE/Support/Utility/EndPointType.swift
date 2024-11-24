//
//  EndPointType.swift
//  NeoSTORE
//
//  Created by Apple on 11/4/24.
//

import Foundation

typealias HTTPHeaders = [String: String]

protocol EndPointType{
    var baseURL: String { get }
    var path: String { get }
    var url : URL? { get }
    var headers: HTTPHeaders { get }
}




enum EndPointList{
    case login
    case register
    case products
    case productDetail
    case cart
    case getUserData
    case updateUserData
    case setRating
    case addToCart
    case editCart
    case deleteCart
    case order
    case orderList
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
        case .products : 
            return Constants.products
        case .productDetail :
            return Constants.productDeatil
        case .cart :
            return Constants.cart
        case .getUserData :
            return Constants.getuserData
        case .updateUserData :
            return Constants.updateData
        case .setRating:
            return Constants.setRating
        case .addToCart:
            return Constants.addToCart
        case .editCart:
            return Constants.editCart
        case .deleteCart:
           return Constants.deleteCart
        case .order :
            return Constants.order
        case .orderList:
            return Constants.orderList
        }
    }
  
    var headers: HTTPHeaders {
        switch self {
        case .getUserData, .updateUserData,.addToCart,.editCart,.deleteCart,.cart,.order,.orderList:
            var header = [String:String]()
            if let token = UserDefaults.standard.string(forKey: Constants.accessToken) {
                header["access_token"] = "\(token)"
            }
            //"access_token": UserDefaults.standard.string(forKey: Constants.accessToken)

            return header
        
            
        default:
            var headers = [
                Constants.accept: Constants.applicationOrJson
            ]
            
            if let token = UserDefaults.standard.string(forKey: Constants.accessToken) {
                headers[Constants.authorization] = "\(token)"
            }
            return headers
        }
    }
    
}
