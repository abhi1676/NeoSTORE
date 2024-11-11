//
//  ProductViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/11/24.
//

import Foundation


class ProductViewModel {
    var products: Product? 

    func fetchProducts(categoryId: Int, completion: @escaping () -> Void) {
        let requestModel = ProductRequest(product_category_id: categoryId)
        
        APIManager.shared.manager(
            modelType: Product.self,
            type: EndPointList.products,
            requestModel: requestModel,
            method: .get
        ) { result in
            switch result {
            case .success(let fetchedProducts):
                self.products = fetchedProducts
                completion()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
