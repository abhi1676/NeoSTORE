//
//  CartViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//


import Foundation

class ListCartViewModel {
    private(set) var cartItems: [CartListData] = []
    var reloadCartData: (() -> Void)?
    var showError: ((String) -> Void)?

    func fetchCartItems() {
        // Make the API call
        APIManager.shared.manager(
            modelType: CartListModel.self,
            type: EndPointList.cart,
            requestModel: emptyRequest(),
            method: .get
        ) { [weak self] result in
            switch result {
            case .success(let response):
                self?.cartItems = response.data
                self?.reloadCartData?()
                
            case .failure(let error):
                self?.showError?("Failed to fetch cart items: \(error)")
            }
        }
    }
}
