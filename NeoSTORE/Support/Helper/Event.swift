//
//  Event.swift
//  NeoSTORE
//
//  Created by Apple on 11/13/24.
//

import Foundation
enum Event{
    case loading
    case stopLoading
    case dataLoaded
    case error(Error?)
}
