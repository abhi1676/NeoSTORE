//
//  ProductList.swift
//  NeoSTORE
//
//  Created by Apple on 11/11/24.
//

import Foundation
struct Product : Codable {
    let status : Int?
    let data : [Data]?

}

struct Data: Codable {
    let id: Int?
    let product_category_id: Int?
    let name: String?
    let producer: String?
    let description: String?
    let cost: Int?
    let rating: Int?
    let view_count: Int?
    let created: String?
    let modified: String?
    let product_images: String?


}
struct ProductRequest: Codable {
    let product_category_id: Int?
//    let limit: Int?
//    let page: Int?
//    
    
}
