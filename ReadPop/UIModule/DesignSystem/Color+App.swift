//
//  Color+App.swift
//  ReadPop
//
//  Created by Afnan Alotaibi on 05/12/1446 AH.
//
// This extension provides custom theme colors for the ReadPop app.
// Colors are defined in Assets and support both light and dark mode.
// All names use camelCase with \"rp\" prefix for clarity and safety.

import SwiftUI

extension Color {
    
    static let rpPrimary = Color("primary")
    static let rpPrimaryLight = Color("primaryLight")
    
    static let rpAccentOrange = Color("accentOrange")
    
    static let rpBackground = Color("background")
    static let rpSurface = Color("surface")
    
    static let rpTextPrimary = Color("textPrimary")
    static let rpTextSecondary = Color("textSecondary")
    
    static let rpGradientStart = Color("bgGradientStart")
    static let rpGradientAltStart = Color("bgGradientAltStart")
}
