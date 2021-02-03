//
//  LinkedScrollers.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/1/21.
//

import SwiftUI



struct LinkedScrollers: View {
    
    private struct ScrollOffsetPreferenceKey: PreferenceKey {
        static var defaultValue: CGPoint = .zero
        
        static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
    }
    @State var yOffset: CGFloat = 0
    @State var xOffset: CGFloat = 0
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack(alignment:.topLeading){
                
                VStack{
                    ScrollView(.horizontal){
                        HStack (alignment: .center, spacing:50) {
                            ForEach(0..<11) {
                                Text("Person \($0)")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 144, height: 55)
                                    .background(Color.green)
                            }
                        }
                    }
                    .content.offset(x: xOffset)
                    .frame(width: 1200, height: 100, alignment: .center)
                    .background(Color.yellow)
                    
                    HStack{
                        
                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(0..<22) {
                                    Text("Item \($0)")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                        .frame(width: 200, height: 111)
                                        .background(Color.blue)
                                    
                                }
                            }
                        }.content.offset(y: yOffset)
                        .frame(width:210, height: 800)
                        .background(Color.pink)
                        .border(Color.black)
                        
                        ScrollView([.horizontal,.vertical]){
                            VStack(spacing: 20) {
                                Color.red.frame(width:2,height:2)
                                    
                                    .background(
                                        GeometryReader { geometry in
                                            Color.clear
                                                .preference(
                                                    key: ScrollOffsetPreferenceKey.self,
                                                    value: geometry.frame(in: .named("scrollView")).origin
                                                )
                                        }
                                    )
                                HStack{
                                    VStack{
                                        ForEach(0..<20) {
                                            StepperView(name:"Item \($0)")
                                                .padding(20)
                                                .frame(width: 200, height: 111)
                                                 
                                        }
                                    }
                                    VStack{
                                        ForEach(0..<20) {
                                            SwipeView(name:"Item \($0)")
                                               
                                                .frame(width: 200, height: 111)
                                                 
                                        }
                                    }
                                    VStack{
                                        ForEach(0..<20) {
                                            Text("Item \($0)")
                                                .foregroundColor(.white)
                                                .font(.largeTitle)
                                                .frame(width: 200, height: 111)
                                                .background(Color.red)
                                        }
                                    }
                                    VStack{
                                        ForEach(0..<20) {
                                            Text("Item \($0)")
                                                .foregroundColor(.white)
                                                .font(.largeTitle)
                                                .frame(width: 200, height: 111)
                                                .background(Color.red)
                                        }
                                    }
                                    VStack{
                                        ForEach(0..<20) {
                                            Text("Item \($0)")
                                                .foregroundColor(.white)
                                                .font(.largeTitle)
                                                .frame(width: 200, height: 111)
                                                .background(Color.red)
                                        }
                                    }
                                }
                                
                            }
                        }.coordinateSpace(name: "scrollView")
                        .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: offsetChanged)
                        
                    }
                }.frame(width: geometry.size.width, height:geometry.size.height)
                Color.white
                    .frame(width:210,height: 155)
                    .ignoresSafeArea()
                    .shadow(color: .white, radius: 30, x: 10, y: -10)
                VStack{
                    Text("Stepper Area")
                    Text("Causes V/H scroll")
                    Text("Header and side ")
                    Text("do nothing ")
                }
            }
        }
    }
    func offsetChanged(point: CGPoint){
        yOffset = point.y  + 1000
        xOffset = point.x
        print(point)
    }
}

struct LinkedScrollers_Previews: PreviewProvider {
    static var previews: some View {
        LinkedScrollers()
    }
}
//struct StepperView: View {
//    var name: String
//    @State var value = 0
//    var body: some View {
//        HStack{
//            //Text(name)
//            Stepper("\(name): \(value)", value:$value)
//        }
//    }
//}
//struct StepperView_Previews: PreviewProvider {
//    static var previews: some View {
//        StepperView(name:"test")
//            .padding()
//    }
//}
struct SwipeView: View {
    var name: String
    @State var count = 0
    var body: some View {
        VStack{
            Text("\(name): \(count)")
            Text("Swipe to change")
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .padding(20)
        .gesture(DragGesture(minimumDistance: 1, coordinateSpace: .local)
                    .onEnded({ value in
                        if value.translation.height < 0 || value.translation.width > 0 {
                            count += 1
                            return
                        }
                        if value.translation.height > 0 || value.translation.width < 0 {
                            count -= 1
                        }
                    }))
    }
}
struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView(name:"test")
            .padding()
    }
}
