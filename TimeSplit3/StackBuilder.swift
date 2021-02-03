//
//  StackBuilder.swift
//  scrolling
//
//  Created by Pete Misik on 2/3/21.
//

import SwiftUI

struct StackBuilder: View {
    var body: some View {
        VStack (spacing: 0){
            ForEach (0..<20) {
                StepperView(name: "Item \($0)")
            }
        }
        .frame(width: 200, height: 1000)
        .background(Color.lightGray)
        .cornerRadius(12.0)
    }
}

struct StackBuilder_Previews: PreviewProvider {
    static var previews: some View {
        StackBuilder()
    }
}
