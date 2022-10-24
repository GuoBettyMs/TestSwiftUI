//
//  TastModeApp.swift
//  TastMode
//
//  Created by Que on 2022/7/21.
//
///
import SwiftUI

@main
struct TastModeApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
