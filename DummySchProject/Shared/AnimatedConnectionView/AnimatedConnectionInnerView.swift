//
//  AnimatedConnectionInnerView.swift
//  DummySchProject
//
//  Created by babatundejimoh on 14/06/2021.
//

import SwiftUI

struct AnimatedConnectionInnerView: View {
    
    @State var movablePoint = false
    let innerCircleWidth = UIScreen.main.bounds.width * 0.5
    let innerCircleRadius = (UIScreen.main.bounds.width * 0.5)/2.0
    
    var body: some View {
        
            ZStack {
                
                Circle()
                    .stroke()
                    .frame(width: innerCircleWidth, height: innerCircleWidth)
                    .foregroundColor(.init(hex: "##FF661F"))
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.red)
                    .offset(x: getPointOnInnerCircle(for: 44.40).x, y: getPointOnInnerCircle(for: 44.40).y)
                    .rotationEffect(.degrees(movablePoint ? 0 : 360))
                    .animation(.easeIn(duration: 5).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.movablePoint.toggle()
                    }
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 5, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnInnerCircle(for: 44.40).x, y: getPointOnInnerCircle(for: 44.40).y)
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnInnerCircle(for: 30.0).x, y: getPointOnInnerCircle(for: 30.0).y)
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnInnerCircle(for: 16.10).x, y: getPointOnInnerCircle(for: 16.10).y)
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnInnerCircle(for: 90.0).x, y: getPointOnInnerCircle(for: 90.0).y)
                
            }
            
    }
    
    func getPointOnInnerCircle(for angle: CGFloat) -> CGPoint {
        let x = innerCircleRadius * cos(angle)
        let y = innerCircleRadius * sin(angle)
        return CGPoint(x: x, y: y)
    }
}

struct AnimatedConnectionInnerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedConnectionInnerView()
            .previewLayout(.sizeThatFits)
    }
}
