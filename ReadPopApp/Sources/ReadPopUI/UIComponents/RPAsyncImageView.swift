//
//  RPAsyncImageView.swift
//  ReadPopApp
//
//  Created by Afnan Alotaibi on 03/01/1447 AH.
//

import SwiftUI

public struct RPAsyncImageView: View {
    let imageUrl: String?
    let width: CGFloat?
    let height: CGFloat
    let cornerRadius: CGFloat
    
    public init(imageUrl: String?, width: CGFloat? = nil, height: CGFloat, cornerRadius: CGFloat = 16) {
        self.imageUrl = imageUrl
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        if let imageUrl, let url = URL(string: imageUrl) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                    
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: width, height: height)
                        .cornerRadius(cornerRadius)
                    
                case .failure(let error):
                    errorView(message: error.localizedDescription)
                    
                default:
                    placeholder
                }
            }
        } else {
            errorView(message: "Invalid URL")
        }
    }
    
    private func errorView(message: String) -> some View {
        ZStack(alignment: .bottom) {
            placeholder
            
            Text(message)
                .font(.caption).bold()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.horizontal, 4)
        }
        .frame(width: width, height: height)
    }
    
    private var placeholder: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color.gray.opacity(0.3))
            .overlay(
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white.opacity(0.6))
            )
            .frame(width: width, height: height)
    }
}
