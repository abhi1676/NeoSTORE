import Foundation

class OrderViewModel {
    var eventHandler: ((_ event: Event) -> Void)?
    
    //MARK: - Placing Order
    func placeOrder(with address: String) {
        
        guard !address.isEmpty else {
            eventHandler?(.error("Address cannot be empty" as? Error))
            return
        }
        
        let requestModel = OrderRequest(address: address)
        eventHandler?(.loading)
        
        APIManager.shared.manager(
            modelType: OrderResponse.self,
            type: EndPointList.order,
            requestModel: requestModel,
            method: .post
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.eventHandler?(.stopLoading)
                switch result {
                case .success(let response):
                    print(response)
                    self?.eventHandler?(.dataLoaded)
                case .failure(let error):
                    print(error)
                    self?.eventHandler?(.error(error))
                }
            }
        }
    }
    
//MARK: - Listing Orders
    
   
        var orders: [Order] = []
  
        
        func fetchOrderList() {
            eventHandler?(.loading)
            
            APIManager.shared.manager(
                modelType: OrderListResponse.self,
                type: EndPointList.orderList,
                requestModel: EmptyRequest(),
                method: .get
            ) { [weak self] result in
                DispatchQueue.main.async {
                    self?.eventHandler?(.stopLoading)
                    switch result {
                    case .success(let response):
                        if response.status == 200 {
                            self?.orders = response.data
                            self?.eventHandler?(.dataLoaded)
                        } else {
                            self?.eventHandler?(.error("" as? Error))
                        }
                    case .failure(let error):
                        self?.eventHandler?(.error(error))
                    }
                }
            }
        }
    
    struct EmptyModel: Codable {}
    }


  



