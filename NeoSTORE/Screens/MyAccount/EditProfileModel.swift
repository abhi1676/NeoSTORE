//
//  EditProfileModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/18/24.
//

import Foundation

struct EditProfileRequest: Codable {
    
      let first_name: String
      let last_name: String
      let email: String
      let dob: String
      let profile_pic: String
      let phone_no: String
    
}

struct EditProfileResponse: Codable {
    let status: Int
    let data: [EditProfileData]
    let message: String
    let user_msg: String
}

struct EditProfileData: Codable {
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
}
