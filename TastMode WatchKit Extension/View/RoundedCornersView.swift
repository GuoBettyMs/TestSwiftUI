//
//  RoundedCorners.swift
//  TastMode WatchKit Extension
//
//  Created by gbt on 2022/7/29.
//

import SwiftUI

struct RoundedCornersView: View {
    
    var color: Color = .blue
    var topLeft: CGFloat = 0.0
    var topRight: CGFloat = 0.0
    var bottomLeft: CGFloat = 0.0
    var bottomRight: CGFloat = 0.0
    
    var body: some View {
        GeometryReader{ geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height
                
                let tr = min(min(self.topRight, h/2), w/2)
                let tl = min(min(self.topLeft, h/2), w/2)
                let bl = min(min(self.bottomLeft, h/2), w/2)
                let br = min(min(self.bottomRight, h/2), w/2)
                
                path.move(to: CGPoint(x: w/2, y: 0))
                path.addLine(to: CGPoint(x: w-tr, y: 0))
                path.addArc(center: CGPoint(x: w-tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                               path.addLine(to: CGPoint(x: w, y: h-br))
                path.addArc(center: CGPoint(x: w-br, y: h-br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h-bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(self.color)
        }

    }
}

