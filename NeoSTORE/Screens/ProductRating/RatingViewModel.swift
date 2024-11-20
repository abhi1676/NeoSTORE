import Foundation

class RatingViewModel {
    var ratingResponse: RatingResponse?
    var eventHandler: ((_ event: Event) -> Void)?

    func setRating(productId: String, rating: Int) {
        self.eventHandler?(.loading)

        let requestModel = RatingRequest(product_id: productId, rating: rating)

        APIManager.shared.manager(
            modelType: RatingResponse.self,
            type: EndPointList.setRating,
            requestModel: requestModel,
            method: .post
        ) { [weak self] result in
            self?.eventHandler?(.stopLoading)

            switch result {
            case .success(let response):
                self?.ratingResponse = response
                self?.eventHandler?(.dataLoaded)
            case .failure(let error):
                self?.eventHandler?(.error(error))
            }
        }
    }
}
