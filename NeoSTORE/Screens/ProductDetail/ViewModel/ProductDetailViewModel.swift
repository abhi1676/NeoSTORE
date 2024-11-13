//
//  ProductDetailViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/12/24.
//

import Foundation
 
class ProductDetailViewModel{
    var productDetail : ProductDetail?
    var eventHandler :((_ event:Event) -> Void)?
    

    
    func fetchProductDetails(productId:Int , completion: @escaping()-> Void) {
        self.eventHandler?(.loading)
        let requestModel = ProductDetailRequest(product_id: productId)
        
        APIManager.shared.manager(modelType: ProductDetail.self,
                                  type: EndPointList.productDetail,
                                  requestModel: requestModel,
                                  method: .get) {
            result in
           
            switch result {
               
            case .success(let fetchedProductDetail):
                self.productDetail = fetchedProductDetail
                self.eventHandler?(.dataLoaded)
                self.eventHandler?(.stopLoading)

                completion()
            case .failure(let error) :
                self.eventHandler?(.error(error))

                print(error)
            }
        }
    }
}


extension ProductDetailViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
