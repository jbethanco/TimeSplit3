//
//  LinkedScrollers.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/1/21.
//

import SwiftUI



struct LinkedScrollers2: View {
    
    private struct ScrollOffsetPreferenceKeyX: PreferenceKey {
        static var defaultValue: CGPoint = .zero
        static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
    }
    private struct ScrollOffsetPreferenceKeyY: PreferenceKey {
        static var defaultValue: CGPoint = .zero
        static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
    }
    
    @State var yOffset: CGFloat = 444
    @State var xOffset: CGFloat = 333
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment:.topLeading){
                VStack{
                    ScrollView(.horizontal){
                        HStack (alignment: .center, spacing:50) {
                            Color.red.frame(width:2,height:2)
                                .background(
                                    GeometryReader { geometry in
                                        Color.clear
                                            .preference(
                                                key: ScrollOffsetPreferenceKeyX.self,
                                                value: geometry.frame(in: .named("scrollViewX")).origin
                                            )
                                    }
                                )
                            ForEach(0..<11) {
                                Text("Person \($0)")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 144, height: 55)
                                    .background(Color.green)
                            }
                        }
                    }
                    .frame(width: 1200, height: 100, alignment: .center)
                    .coordinateSpace(name: "scrollViewX")
                    .onPreferenceChange(ScrollOffsetPreferenceKeyX.self, perform: offsetChangedX)
                    .background(Color.yellow)
                    
                    HStack{
                        ScrollView {
                            VStack(spacing: 10) {
                                Color.red.frame(width:2,height:2)
                                    .background(
                                        GeometryReader { geometry in
                                            Color.clear
                                                .preference(
                                                    key: ScrollOffsetPreferenceKeyY.self,
                                                    value: geometry.frame(in: .named("scrollViewY")).origin
                                                )
                                        }
                                    )
                                ForEach(0..<6) {
                                    Text("Item \($0)")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                        .frame(width: 200, height: 111)
                                        .background(Color.blue)
                                }
                            }
                        }
                        .coordinateSpace(name: "scrollViewY")
                        .onPreferenceChange(ScrollOffsetPreferenceKeyY.self, perform: offsetChangedY)
                        .frame(width:210, height: 600)
                        .background(Color.pink)
                        
                        ScrollView([.horizontal,.vertical]){
                            VStack(spacing: 5) {
                                
                                HStack{
                                    VStack{
                                        ForEach(0..<6) {
                                            StepperView(name:"Item \($0)")
                                                .padding(20)
                                                .frame(width: 200, height: 111)
                                        }
                                    }
                                    VStack{
                                        ForEach(0..<6) {
                                            SwipeView(name:"Item \($0)")
                                                
                                                .frame(width: 200, height: 111)
                                            
                                        }
                                    }
                                    VStack{
                                        ForEach(0..<6) {
                                            SwipeView(name:"Item \($0)")
                                                
                                                .frame(width: 200, height: 111)
                                            
                                        }
                                    }
                                }
                            }
                        }
                        .content.offset(x: xOffset, y:yOffset)
                    }
                }.frame(width: geometry.size.width, height:geometry.size.height)
                Color.white
                    .frame(width:210,height: 155)
                    .ignoresSafeArea()
                VStack(alignment:.trailing){
                    Text("Header and")
                    Text("Side cause scroll")
                    Text("Stepper Area can't")
                }.foregroundColor(.primary)
            }
        }.navigationBarTitle(Text("Scroll via header and side view"), displayMode: .inline)
    }
    func offsetChangedX(point: CGPoint){
        
        xOffset = point.x
        print(point)
    }
    func offsetChangedY(point: CGPoint){
        yOffset = point.y
        
        print(point)
    }
}

struct LinkedScrollers2_Previews: PreviewProvider {
    static var previews: some View {
        LinkedScrollers2()
    }
}

