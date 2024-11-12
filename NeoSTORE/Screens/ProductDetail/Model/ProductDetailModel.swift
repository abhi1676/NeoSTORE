//
//  ProductDetailModel.swift
//  NeoSTORE
//
//  Created by Apple on 11/12/24.
//

import Foundation

struct ProductDetail:Codable{
    let status: Int
    let data: ProductDetailData
}

struct ProductDetailData:Codable{
    let id, product_category_id: Int
       let name, producer, description: String
       let cost, rating, view_count: Int
       let created, modified: Date
       let product_images: [ProductImage]

    
}

struct ProductImage:Codable{
    let id, product_id: Int
        let image: String
        let created, modified: Date

        
}

struct ProductDetailRequest:Codable{
 let product_id:Int
}
