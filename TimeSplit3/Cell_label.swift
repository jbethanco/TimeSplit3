//
//  Cell_label.swift
//  scrolling
//
//  Created by Pete Misik on 2/3/21.
//

import SwiftUI

struct Cell_label: View {
    var text: String
    var color: Color
    
    var body: some View {
        Text(text)
            .font(.body)
            .foregroundColor(color)
            .frame(width: 200, height: 50, alignment: .center)
//            .border(Color.black)
    }
}

struct Cell_label_Previews: PreviewProvider {
    static var previews: some View {
        Cell_label(text: "Sample Text", color: Color.black)
    }
}
