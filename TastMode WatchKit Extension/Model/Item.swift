//
//  Item.swift
//  TastMode WatchKit Extension
//
//  Created by gbt on 2022/7/28.
//

import SwiftUI

struct Item: Identifiable{
    
    var id = UUID().uuidString
    var typeName: String
    var userName: String
    var state: String
//    var state: Float
    var img: String
    
    
    var offset: CGFloat
    var isSwiped: Bool
    
}
