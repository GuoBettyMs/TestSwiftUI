//
//  cell.swift
//  TastMode WatchKit Extension
//
//  Created by gbt on 2022/7/28.
//

import SwiftUI

//TableCellModel是属于环境数据的累，必须继承ObservableObject，环境对象能够在任意位置自由访问和修改，与环境对象有绑定关系的组件都会接收到变动的通知并刷新
class TableCellModel: ObservableObject{
   
    //tableCell item
    @Published var cells = [
        Item(typeName: "iPhone", userName: "NewName", state: "80%", img: "Watch-PB40", offset: 0, isSwiped: false),
        Item(typeName: "iPhone", userName: "Test01", state: "Offine", img: "Watch-PB10DW", offset: 0, isSwiped: false),
        Item(typeName: "K4", userName: "My Charger", state: "Working", img: "Watch-K4", offset: 0, isSwiped: false),
        Item(typeName: "iPhone", userName: "Test01", state: "Offine", img: "Watch-PB10DW", offset: 0, isSwiped: false),
        Item(typeName: "iPhone", userName: "Test01", state: "70", img: "Watch-PB10DW", offset: 0, isSwiped: false)
    ]
    
    //环境对象只有使用 @Published 属性可触发绑定和监听
//    @Published var cells = [
//        Item(typeName: "PB40", userName: "NewName", state: 80, img: "Watch-PB40", offset: 0, isSwiped: false),
//        Item(typeName: "PB10DW", userName: "Test012", state: 40, img: "Watch-PB10DW", offset: 0, isSwiped: false),
//        Item(typeName: "K4", userName: "MyCharger",
//             state: 80, img: "Watch-K4", offset: 0, isSwiped: false),
//        Item(typeName: "PB40", userName: "Test01", state: 70, img: "Watch-PB40", offset: 0, isSwiped: false),
//        Item(typeName: "PB40", userName: "充电宝", state: 70, img: "Watch-PB40", offset: 0, isSwiped: false)
//    ]
    
}
