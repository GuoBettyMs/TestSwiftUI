//
//  ContentView.swift
//  TastMode WatchKit Extension
//
//  Created by Que on 2022/7/21.
//

import SwiftUI
import UIKit


struct ContentView: View {
    
    
    var body: some View {
        NavigationView {

            TableView()
             .navigationTitle("IsdLink")
        }
        

        
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
