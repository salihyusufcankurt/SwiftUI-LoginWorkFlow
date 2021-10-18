//
//  SwiftUILoginWorkFlowApp.swift
//  SwiftUILoginWorkFlow
//
//  Created by salihyusufcankurt on 15.10.2021.
//

import SwiftUI

@main
struct SwiftUILoginWorkFlowApp: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated{
//                ContentView()
//                    .environmentObject(authentication)
//                
                TabView{
                    ContentView()
                        .tabItem {
                            Label("Main", systemImage: "list.dash")
                        }
                        .environmentObject(authentication)

                    
                }
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}
