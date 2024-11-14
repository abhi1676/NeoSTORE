//
//  CartViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//

import Foundation
import Foundation

class CartViewModel {
    private(set) var cartItems: [CartModel] = []
    var reloadCartData: (() -> Void)?
    var showError: ((String) -> Void)?

    func fetchCartItems(productId:Int,quantity:Int) {
      

        let request = CartRequest(product_id: productId, quantity: quantity)
        
        // Make the API call
        APIManager.shared.manager(
            modelType: CartModel.self,
            type: EndPointList.cart ,
            requestModel: request,
            method: .get
        ) { [weak self] result in
            switch result {
            case .success(let response):
               
                self?.cartItems = response.data ? [response] : [] 
                self?.reloadCartData?()
                
            case .failure(let error):
                self?.showError?("Failed to fetch cart items: \(error)")
            }
        }
    }
}
