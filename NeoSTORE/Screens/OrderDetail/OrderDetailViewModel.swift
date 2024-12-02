//
//  OrderDetailViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 12/2/24.
//

import Foundation


final class OrderDetailViewModel {
    var orderDetailsData: OrderDetailsData? {
        didSet {
            eventHandler?(.dataLoaded)
        }
    }

    var eventHandler: ((Event) -> Void)?
    
    func fetchOrderDetails(orderId: Int) {
        eventHandler?(.loading)

        APIManager.shared.manager(
            modelType: OrderDetails.self,
            type: EndPointList.orderDetail,
            requestModel: OrderDetailsRequest(order_id: orderId),
            method: .get
        ) { [weak self] result in
            guard let self = self else { return }
            self.eventHandler?(.stopLoading)

            switch result {
            case .success(let response):
                if response.status == 200, let data = response.data {
                    self.orderDetailsData = data
                } else {
                    self.eventHandler?(.error("An error occurred" as? Error))
                }
            case .failure(let error):
                self.eventHandler!(.error(error))
            }
        }
    }
}
