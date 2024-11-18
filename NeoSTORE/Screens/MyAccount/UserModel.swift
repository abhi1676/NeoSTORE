//
//  UserModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 12/07/24.
//

import Foundation

struct UserModel : Codable {
    let status : Int?
    let data : UserData?
    let message: String?
    let user_msg: String?
}

struct UserData: Codable {
    let user_data : UserDetails?
    let product_categories : [Product_categories]
    let total_carts : Int?
    let total_orders : Int?
}

struct UserDetails: Codable {
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

struct Product_categories: Codable {
    let id : Int?
    let name : String?
    let icon_image : String?
    let created : String?
    let modified : String?
}
struct EmptyRequest: Codable {}
