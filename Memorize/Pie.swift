//
//  File.swift
//  Memorize
//
//  Created by Yoonsoo Park on 7/28/20.
//  Copyright © 2020 Yoonsoo Park. All rights reserved.
//

import SwiftUI

struct Pie : Shape {
    var startAngle : Angle
    var endAngle : Angle
    var clockwise = true
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width/2, rect.height/2)

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.x + radius * cos(CGFloat(startAngle.radians)))
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        p.addLine(to: center)
        return p
    }
}
