//
//  LoginData.swift
//  NeoSTORE
//
//  Created by Apple on 10/28/24.
//

import Foundation

struct LoginData:Codable{
    var email:String?
    var password:String?
    
}


struct LoginResponse : Codable {
    let status : Int?
    let data : User?
    let message : String?
    let user_msg : String?
    let test : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case message = "message"
        case user_msg = "user_msg"
        case test = "test"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        data = try values.decodeIfPresent(User.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user_msg = try values.decodeIfPresent(String.self, forKey: .user_msg)
        test = try values.decodeIfPresent(String.self, forKey: .test)
    }

}

struct User : Codable {
    let id : Int?
    let role_id : Int?
    let first_name : String?
    let last_name : String?
    let email : String?
    let username : String?
    let profile_pic : String?
    let country_id : String?
    let gender : String?
    let phone_no : String?
    let dob : String?
    let is_active : Bool?
    let created : String?
    let modified : String?
    let access_token : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case role_id = "role_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case username = "username"
        case profile_pic = "profile_pic"
        case country_id = "country_id"
        case gender = "gender"
        case phone_no = "phone_no"
        case dob = "dob"
        case is_active = "is_active"
        case created = "created"
        case modified = "modified"
        case access_token = "access_token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        role_id = try values.decodeIfPresent(Int.self, forKey: .role_id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
        country_id = try values.decodeIfPresent(String.self, forKey: .country_id)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        phone_no = try values.decodeIfPresent(String.self, forKey: .phone_no)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
        created = try values.decodeIfPresent(String.self, forKey: .created)
        modified = try values.decodeIfPresent(String.self, forKey: .modified)
        access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
    }

}
