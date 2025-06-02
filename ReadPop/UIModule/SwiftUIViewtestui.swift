////
////  SwiftUIViewtestui.swift
////  ReadPop
////
////  Created by Afnan Alotaibi on 05/12/1446 AH.
////
//

import SwiftUI

struct DummyArticleListScreen: View {
    @State private var selectedDummyPeriod: Int = 7
    @State private var selectedSection: NewsSection = .technology

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 1. الهيدر
            RPHeaderView(title: "MOST POPULAR", style: .main)
             //   .background(Color(hex: "#F3F0FA"))
            DummyPeriodSelectorView2(selectedDummyPeriod: $selectedDummyPeriod)
            
            SectionFilterView(selectedSection: $selectedSection)
            
                .padding(.vertical, 8)
            // 2. فيو اختيار الفترة
            VStack {
                
                
                // 3. قائمة المقالات الدمي
                List(dummyArticlesData) { dummyArticle in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(dummyArticle.dummyTitle)
                            .font(.headline)
                        Text(dummyArticle.dummyPublishedDate)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(PlainListStyle())
                
            }
            .padding(.horizontal , 20)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.rpGradientStart, Color.rpBackground]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        
  
    }
}

// نموذج دمي للمقال
struct DummyArticleModel: Identifiable {
    let id = UUID()
    let dummyTitle: String
    let dummyPublishedDate: String
}

// بيانات دمي للمقالات
let dummyArticlesData = [
    DummyArticleModel(dummyTitle: "Dummy SwiftUI Tips", dummyPublishedDate: "2025-06-01"),
    DummyArticleModel(dummyTitle: "Dummy Combine Overview", dummyPublishedDate: "2025-05-30"),
    DummyArticleModel(dummyTitle: "Dummy Async Techniques", dummyPublishedDate: "2025-05-28")
]

// Preview
#Preview {
    DummyArticleListScreen()
}

import SwiftUI

struct DummyPeriodSelectorView2: View {
    @Binding var selectedDummyPeriod: Int

    var body: some View {
        HStack(spacing: 0) {
            periodButton(title: "TODAY", periodValue: 1)
            periodButton(title: "THIS WEEK", periodValue: 7)
            periodButton(title: "THIS MONTH", periodValue: 30)
        }
        
    }

    // دالة مساعدة لزر الفترة
    private func periodButton(title: String, periodValue: Int) -> some View {
        Button(action: {
            withAnimation {
                selectedDummyPeriod = periodValue
            }
        }) {
            Text(title)
                .font(.custom("Oswald-Bold", size: 20))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .foregroundColor(selectedDummyPeriod == periodValue ? .white : .primary)
                .background(Color.rpPrimary)

        }
    }

}

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64

        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (
                int >> 24,
                int >> 16 & 0xFF,
                int >> 8 & 0xFF,
                int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}


import SwiftUI

struct SectionFilterView: View {
    @Binding var selectedSection: NewsSection

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(NewsSection.allCases) { section in
                    Button(action: {
                        withAnimation {
                            selectedSection = section
                        }
                    }) {
                        Text(section.title)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .foregroundColor(selectedSection == section ? .white : .primary)
                            .background(selectedSection == section ? Color.rpPrimary : Color.gray.opacity(0.2))
                            .clipShape(Capsule())
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
}
enum NewsSection: String, CaseIterable, Identifiable {
    case arts, automobiles, books_review = "books/review", business,
         fashion, food, health, home, insider, magazine,
         movies, nyregion, obituaries, opinion, politics,
         realestate, science, sports, sundayreview, technology,
         theater, t_magazine = "t-magazine", travel, upshot,
         us, world

    var id: String { self.rawValue }

    var title: String {
        self.rawValue
            .replacingOccurrences(of: "-", with: " ")
            .replacingOccurrences(of: "/", with: " ")
            .capitalized
    }
}

