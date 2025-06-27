//
//  RoundedCorners.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 13/12/1446 AH.
//

import SwiftUI

public struct RoundedCorners: Shape {
    var radius: CGFloat = 16
    var corners: UIRectCorner = [.allCorners]
    
    public init(radius: CGFloat, corners: UIRectCorner) {
        self.radius = radius
        self.corners = corners
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
