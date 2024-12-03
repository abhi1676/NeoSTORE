//
//  RatingModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/20/24.
//

import Foundation


struct RatingRequest: Codable {
    let product_id : String?
    let rating: Int?
}

struct RatingResponse: Codable {
    let status : Int?
    let data : RatingData?
    let message : String?
    let user_msg : String?
}

struct RatingData: Codable {
    let id : Int?
    let product_category_id : Int?
    let name : String?
    let producer : String?
    let description : String?
    let cost : Int?
    let rating : Int?
    let view_count : Int?
    let created : String?
    let modified : String?
} 
