//
//  ProductDetailViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/12/24.
//

import Foundation
 
class ProductDetailViewModel{
    var productDetail : ProductDetail?
    
    func fetchProductDetails(productId:Int,completion: @escaping()-> Void){
        let requestModel = ProductDetailRequest(product_id: productId)
        
        APIManager.shared.manager(modelType: ProductDetail.self,
                                  type: EndPointList.products,
                                  requestModel: requestModel,
                                  method: .get) {
            result in
            switch result {
            case .success(let fetchedProductDetail):
                self.productDetail = fetchedProductDetail
                completion()
            case .failure(let error) :
                print(error)
            }
            
        }
    }
}
