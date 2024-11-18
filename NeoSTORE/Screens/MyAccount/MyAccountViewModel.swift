//
//  MyAccountViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/18/24.
//

import Foundation


class MyAccountViewModel {
    var userDetails: UserDetails?
    var productCategories: [Product_categories] = []
    var totalCarts: Int = 0
    var totalOrders: Int = 0
    
    var eventHandler :((_ event:Event) -> Void)?

    
    func fetchUserDetails() {
        APIManager.shared.manager(
            modelType: UserModel.self,
            type: EndPointList.getUserData,
            requestModel: nil as EmptyRequest?,
            method: .get
        ) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.userDetails = response.data?.user_data
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
               
            }
        }
    }
}
