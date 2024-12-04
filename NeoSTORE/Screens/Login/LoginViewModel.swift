import Foundation

class LoginViewModel {
    
    var onLoginSuccess: (() -> Void)?
    var onLoginFailure: ((String) -> Void)?
  
    private let apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol) {
        self.apiManager = apiManager
    }
    
    func login(email: String, password: String) {
        let loginData = LoginData(email: email, password: password)

        apiManager.manager(
            modelType: LoginResponse.self,
            type: EndPointList.login,
            requestModel: loginData,
            method: .post
        ) { [weak self] (result: Result<LoginResponse, DataError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                
                guard let user = response.data,
                        let firstName = user.first_name,
                        let lastName = user.last_name,
                         let email = user.email else {
                    self.onLoginFailure?(Constants.userNotFound)
                    return
                }
                let fullname = "\(firstName + lastName)"
           
             
                UserDefaults.standard.set(fullname,forKey: Constants.fullname)
                UserDefaults.standard.set(email,forKey:Constants.email)
                print(fullname," ",email)
                UserDefaults.standard.set(user.access_token, forKey: Constants.accessToken)
                
                self.onLoginSuccess?()
                
            case .failure(let error):
                self.onLoginFailure?(error.localizedError)
            }
        }
    }
}
