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

public extension Color {
    
    static let rpPrimary = Color("primary", bundle: .module)
    static let rpPrimaryLight = Color("primaryLight", bundle: .module)
    
    static let rpAccentOrange = Color("accentOrange", bundle: .module)
    
    static let rpBackground = Color("background", bundle: .module)
    static let rpSurface = Color("surface", bundle: .module)
    
    static let rpTextPrimary = Color("textPrimary", bundle: .module)
    static let rpTextSecondary = Color("textSecondary", bundle: .module)
    
    static let rpGradientStart = Color("bgGradientStart", bundle: .module)
    static let rpGradientAltStart = Color("bgGradientAltStart", bundle: .module)
}
