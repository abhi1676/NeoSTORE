//
//  OrderModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/22/24.
//

import Foundation


//MARK: - Placing Order
struct OrderRequest:Codable{
    let address : String
}
struct OrderResponse:Codable{
    
    let status: Int
    let message: String
    let user_msg :String
}

//MARK: - Order List
struct Order: Codable {
    let id: Int
    let cost: Double
    let created: String
}

struct OrderListResponse: Codable {
    let status: Int
    let data: [Order]
    let message: String
    let user_msg: String
}

//MARK: - Order Details

