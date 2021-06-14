//
//  AnimatedConnection.swift
//  DummySchProject
//
//  Created by babatundejimoh on 14/06/2021.
//

import SwiftUI

struct AnimatedConnectionView: View {
    
    @State var movablePoint = false
    @State var ddd2 = false
    
    let outerCircleWidth = UIScreen.main.bounds.width * 0.8
    let outerCircleRadius = (UIScreen.main.bounds.width * 0.8)/2.0
    
    var body: some View {
            ZStack {
                Circle()
                    .stroke()
                    .frame(width: outerCircleWidth, height: outerCircleWidth)
                    .foregroundColor(.init(hex: "##FF661F"))
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.red)
                    .offset(x: getPointOnOuterCircle(for: 50.0).x, y: getPointOnOuterCircle(for: 50.0).y)
                    .rotationEffect(.degrees(movablePoint ? 0 : 360))
                    .animation(.easeIn(duration: 5).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.movablePoint.toggle()
                    }
                
                AnimatedConnectionInnerView()
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnOuterCircle(for: 50.0).x, y: getPointOnOuterCircle(for: 50.0).y)
                    
                
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnOuterCircle(for: 30.0).x, y: getPointOnOuterCircle(for: 30.0).y)
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnOuterCircle(for: 10.0).x, y: getPointOnOuterCircle(for: 10.0).y)
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnOuterCircle(for: 15.0).x, y: getPointOnOuterCircle(for: 15.0).y)
                
                Image("my_pic")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(color: .init(hex: "#000029"), radius: 3, x: 0, y: 3)
                        .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .offset(x: getPointOnOuterCircle(for: 70.0).x, y: getPointOnOuterCircle(for: 70.0).y)
                
            }
            .padding(.top, 40)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            .background(Color.init(hex: "#FFFAF8"))
    }
    
    func getPointOnOuterCircle(for angle: CGFloat) -> CGPoint {
        let x = outerCircleRadius * cos(angle)
        let y = outerCircleRadius * sin(angle)
        return CGPoint(x: x, y: y)
    }
}

struct AnimatedConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedConnectionView()
            .previewLayout(.sizeThatFits)
    }
}
