//
//  RegisterViewModel.swift
//  NeoSTORE
//
//  Created by Apple on 10/30/24.
//

import Foundation

class RegisterViewModel{
    
    
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
