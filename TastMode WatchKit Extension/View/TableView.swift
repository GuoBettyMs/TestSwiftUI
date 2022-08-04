//
//  TableView.swift
//  TastMode WatchKit Extension
//
//  Created by gbt on 2022/7/28.
//


import SwiftUI

struct TableView: View {
    
    @StateObject var tableData = TableCellModel()
 
    var body: some View {

        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack(spacing: 5) {
                ForEach(tableData.cells){ item in

                    //Item view
                    TableCellView(item: $tableData.cells[getIndex(item: item)], items: $tableData.cells)
                }
            }
        }

        
    }
    
    
    // MARK: 获取list 某个item
    func getIndex(item: Item)-> Int{
        return  tableData.cells.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
