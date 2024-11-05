//
//  Register.swift
//  NeoSTORE
//
//  Created by Apple on 11/5/24.
//

import Foundation
struct RegisterResponse: Codable {
    let status: Int
    let data: RegistrationData?
    let message: String
    let userMessage: String

    enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
        case userMessage = "user_msg"
    }
}

struct RegistrationData:Codable {
    var id:Int?
    var role_id: Int?
    var gender: String?
    var username: String?
    var created: String?
    var modified : String?
    var password : String?
    var confirm_password: String?
    var last_name: String?
    var email: String?
    var phone_no: String?
    var first_name: String?
    var access_token: String?
    
}


//struct RegistrationData: Codable {
//    var id: Int?
//    var roleId: Int?
//    var gender: String?
//    var username: String?
//    var created: String?
//    var modified: String?
//    var password: String?
//    var confirmPassword: String?
//    var lastName: String?
//    var email: String?
//    var phoneNo: String?
//    var firstName: String?
//    var accessToken: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case roleId = "role_id"
//        case gender
//        case username
//        case created
//        case modified
//        case password
//        case confirmPassword = "confirm_password"
//        case lastName = "last_name"
//        case email
//        case phoneNo = "phone_no"
//        case firstName = "first_name"
//        case accessToken = "access_token"
//    }
//
//
//    init(firstName: String, lastName: String, email: String, password: String, confirmPassword: String, gender: String?, phoneNo: String?) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.email = email
//        self.password = password
//        self.confirmPassword = confirmPassword
//        self.gender = gender
//        self.phoneNo = phoneNo
//
//        self.id = nil
//        self.roleId = nil
//        self.username = nil
//        self.created = nil
//        self.modified = nil
//        self.accessToken = nil
//    }
//}


struct RegistrationRequestData: Codable {
    var gender: String?
    var password: String?
    var confirmPassword: String?
    var lastName: String?
    var email: String?
    var phoneNo: String?
    var firstName: String?
    
    enum CodingKeys: String, CodingKey {
        case gender
        case password
        case confirmPassword = "confirm_password"
        case lastName = "last_name"
        case email
        case phoneNo = "phone_no"
        case firstName = "first_name"
    }
}
   
