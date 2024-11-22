//
//  CartViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/21/24.
//

import Foundation

class CartViewModel {
  
    var eventHandler: ((_ event: Event) -> Void)?
    
    // MARK: - Add to Cart
    func addToCart(productId: Int, quantity: Int) {
        let request = CartRequest(product_id: productId, quantity: quantity)
        eventHandler?(.loading)
        
        APIManager.shared.manager(
            modelType: CartModel.self,
            type: EndPointList.addToCart,
            requestModel: request,
            method: .post
        ) { [weak self] result in
            switch result {
            case .success(let response):
                print(result)
                if response.status == 200 {
                    self?.eventHandler?(.dataLoaded)
                }
            case .failure(let error):
                self?.eventHandler?(.error(error))
            }
            self?.eventHandler?(.stopLoading)
        }
    }
    
    // MARK: - Edit Cart
    func editCart(productId: Int, quantity: Int) {
        let request = EditCartRequest(product_id: productId, quantity: quantity)
        eventHandler?(.loading)
        
        APIManager.shared.manager(
            modelType: CartModel.self,
            type: EndPointList.editCart,
            requestModel: request,
            method: .post
        ) { [weak self] result in
            switch result {
            case .success(let response):
                if response.status == 200 {
                    self?.eventHandler?(.dataLoaded)
                }
            case .failure(let error):
                self?.eventHandler?(.error(error))
            }
            self?.eventHandler?(.stopLoading)
        }
    }
    
    // MARK: - Delete from Cart
    func deleteFromCart(productId: Int) {
        let request = DelCartRequest(product_id: productId)
        eventHandler?(.loading)
        
        APIManager.shared.manager(
            modelType: CartModel.self,
            type: EndPointList.deleteCart,
            requestModel: request,
            method: .post
        ) { [weak self] result in
            switch result {
            case .success(let response):
                if response.status == 200 {
                    self?.eventHandler?(.dataLoaded)
                }
            case .failure(let error):
                self?.eventHandler?(.error(error))
            }
            self?.eventHandler?(.stopLoading)
        }
    }
}


