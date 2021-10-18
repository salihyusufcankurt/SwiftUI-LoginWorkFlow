//
//  ContentView.swift
//  SwiftUILoginWorkFlow
//
//  Created by salihyusufcankurt on 15.10.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                        .foregroundColor(.gray)
//                        .padding(.all, 5)
                    Text("You are in!")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
//            .padding()
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Log out"){
                        authentication.updateValidation(success: false)
                        
                    }
                    
                }
            }
            
        }
        
        
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
