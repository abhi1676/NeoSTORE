import Foundation

class LoginViewModel {
    
    var onLoginSuccess: (() -> Void)?
    var onLoginFailure: ((String) -> Void)?
  
    func login(email: String, password: String) {
        let loginData = LoginData(email: email, password: password)

        APIManager.shared.manager(
            modelType: LoginResponse.self,
            type: EndPointList.login,
            requestModel: loginData,
            method: .post
        ) { [weak self] (result: Result<LoginResponse, DataError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                
                guard let user = response.data else {
                    self.onLoginFailure?(Constants.userNotFound)
                    return
                }
                
                UserDefaults.standard.set(user.access_token, forKey: Constants.accessToken)
                self.onLoginSuccess?()
                
            case .failure(let error):
                self.onLoginFailure?(error.localizedDescription)
            }
        }
    }
}
