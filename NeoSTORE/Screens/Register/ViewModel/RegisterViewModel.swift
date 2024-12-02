//
//  RegisterViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 10/30/24.
//

import Foundation

class RegisterViewModel{
    
    
    var onRegisterSuccess : (()->Void)?
    var onRegisterFailure : ((String)->Void)?
    
  
    func register(firstName: String, lastName: String, email: String, password: String, confirmPassword: String, phoneNo: String?, gender: String?) {
      
        let registerRequest = RegistrationData(gender: gender, password: password, confirm_password: confirmPassword, last_name: lastName, email: email, phone_no: phoneNo, first_name: firstName)
        APIManager.shared.manager(modelType: RegisterResponse.self, type: EndPointList.register, requestModel: registerRequest, method: .post) { result in
            switch result {
            case .success(let response):
                guard let registerData = response.data else {
                    self.onRegisterFailure?(Constants.noUserData)
                       return
                   }
                UserDefaults.standard.set(registerData.access_token, forKey:Constants.accessToken)
                   self.onRegisterSuccess?()
                
            case .failure(let error):
                self.onRegisterFailure?(error.localizedError)
            }
        }
    }
    
    
  func  validInputs(firstName:String?,lastName:String?,email:String?,password:String?,confirmPassword:String?,phoneNumber:String?, completion : @escaping (Bool,String?)->Void){
        
      typealias t = TextfieldType
      
      
      let isNameValid = t.name(firstName ?? "").isValid
              let isPasswordValid = t.password(password ?? "").isValid
              let isPhoneNumberValid = t.phoneNumber(phoneNumber ?? "").isValid
              let isEmailValid = t.email(email ?? "").isValid
              let isPasswordMatching = password == confirmPassword

              if !isNameValid {
                  completion(false, Constants.invalidFirstName)
                  return
              }
              if !isPasswordValid {
                  completion(false, Constants.invalidLastName)
                  return
              }
              if !isPhoneNumberValid {
                  completion(false, Constants.invalidPhonenumber )
                  return
              }
              if !isEmailValid {
                  completion(false, Constants.invalidEmail)
                  return
              }
              if !isPasswordMatching {
                  completion(false,Constants.passwordNotMatching )
                  return
              }

              completion(true, nil)
          }
    



}
      
  
 
