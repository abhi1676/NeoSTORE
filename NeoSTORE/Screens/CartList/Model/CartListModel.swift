//
//  CartListModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//

import Foundation

struct CartListModel : Codable {
    let status : Int
    let data : [CartListData]
    let count : Int
    let total : Int
}

struct CartListData : Codable {
    let id : Int
    let product_id : Int
    let quantity : Int
    let product : CartListProduct
}

struct CartListProduct : Codable {
    let id : Int
    let name : String
    let cost : Int
    let product_category : String
    let product_images : String
    let sub_total : Int
}

