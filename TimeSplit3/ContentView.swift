//
//  ContentView.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack{
                NavigationLink("Linked scrolls 1", destination: LinkedScrollers())
                    .padding()
                
                NavigationLink("Linked scrolls 2", destination: LinkedScrollers2())
                    .padding()
                
            }.padding()
           
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
