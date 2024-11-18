import Foundation


class EditProfileViewModel {
    
    var eventHandler: ((_ event: Event) -> Void)?

    func updateProfile(requestModel: EditProfileRequest) {
    
        eventHandler?(.loading)
        
        let endpoint = EndPointList.updateUserData
        
   
        APIManager.shared.manager(
            modelType: EditProfileResponse.self,
            type: endpoint,
            requestModel: requestModel,
            method: .post
        ) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.eventHandler?(.dataLoaded)
                    print(response)
                case .failure(let error):
                    self?.eventHandler?(.error(error))
                }
                
                self?.eventHandler?(.stopLoading)
            }
        }
    }
}
