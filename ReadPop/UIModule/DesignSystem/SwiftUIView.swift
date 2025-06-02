//////
//////  SwiftUIView.swift
//////  ReadPop
//////
//////  Created by Afnan Alotaibi on 05/12/1446 AH.
//////
////
//import SwiftUI
////
////
////
////// MARK: - NYTArticle Model (to avoid conflict)
////struct NYTArticle: Identifiable {
////    let id: String
////    let title: String
////    let abstract: String
////    let imageURL: String?
////    let source: String
////    let publishedAt: String
////}
////
////// Example transformed from JSON manually (replace with real mapping in production)
////let sampleNYTArticles: [NYTArticle] = [
////    NYTArticle(
////        id: "100000010146090",
////        title: "On the Campaign Trail, Elon Musk Juggled Drugs and Family Drama",
////        abstract: "As Mr. Musk entered President Trump’s orbit, his private life grew increasingly tumultuous...",
////        imageURL: "https://static01.nyt.com/images/2025/05/26/multimedia/00musk-wflt/00musk-wflt-mediumThreeByTwo440.jpg",
////        source: "New York Times",
////        publishedAt: "3d"
////    ),
////    NYTArticle(
////        id: "100000010193359",
////        title: "I’m Normally a Mild Guy. Here’s What’s Pushed Me Over the Edge.",
////        abstract: "Trumpism can be seen as a giant attempt to amputate the highest aspirations...",
////        imageURL: "https://static01.nyt.com/images/2025/05/30/multimedia/29brooks1-kpjf/29brooks1-kpjf-mediumThreeByTwo440.jpg",
////        source: "New York Times",
////        publishedAt: "2d"
////    )
////]
////
////struct PopularArticlesView: View {
////    let articles: [NYTArticle] = sampleNYTArticles
////    @State private var selectedDummyPeriod: Int = 7
////
////    var body: some View {
////        ScrollView {
////            VStack(alignment: .leading, spacing: 16) {
////                Text("MOST POPULAR")
////                    .font(FontTheme.SectionHeader.primary())
////                    .foregroundColor(.rpPrimary)
////                    .padding(.horizontal)
////
//////                DummyPeriodSelectorView(selectedDummyPeriod: $selectedDummyPeriod)
////
////
////                VStack(spacing: 20) {
////                    ForEach(articles.indices, id: \ .self) { index in
////                        if index % 3 == 0 {
////                            bigCard(articles[index])
////                        } else {
////                            HStack(spacing: 12) {
////                                if index < articles.count { smallCard(articles[index]) }
////                                if index + 1 < articles.count { smallCard(articles[index + 1]) }
////                            }.padding(.horizontal)
////                        }
////                    }
////                }
////            }
////        }
////        .background(
////            LinearGradient(
////                gradient: Gradient(colors: [Color.rpGradientStart, Color.rpBackground]),
////                startPoint: .topLeading,
////                endPoint: .bottomTrailing
////            )
////        )
////    }
////
////    func bigCard(_ article: NYTArticle) -> some View {
////        ZStack(alignment: .bottomLeading) {
////            AsyncImage(url: URL(string: article.imageURL ?? "")) { image in
////                image.resizable()
////            } placeholder: {
////                Rectangle().fill(Color.rpSurface)
////            }
////            .aspectRatio(1.6, contentMode: .fit)
////            .cornerRadius(12)
////
////            VStack(alignment: .leading, spacing: 4) {
////                Text(article.title)
////                    .font(FontTheme.ArticleTitle.bold())
////                    .foregroundColor(.white)
////                Text("\(article.source) • \(article.publishedAt)")
////                    .font(FontTheme.Metadata.condensed())
////                    .foregroundColor(.white.opacity(0.9))
////            }
////            .padding()
////        }.padding(.horizontal)
////    }
////
////    func smallCard(_ article: NYTArticle) -> some View {
////        VStack(alignment: .leading, spacing: 4) {
////            AsyncImage(url: URL(string: article.imageURL ?? "")) { image in
////                image.resizable()
////            } placeholder: {
////                Rectangle().fill(Color.rpSurface)
////            }
////            .frame(height: 120)
////            .cornerRadius(10)
////
////            Text(article.title)
////                .font(FontTheme.SummaryText.regular())
////                .lineLimit(2)
////                .foregroundColor(.rpTextPrimary)
////            Text("\(article.source) • \(article.publishedAt)")
////                .font(FontTheme.Metadata.condensed())
////                .foregroundColor(.rpTextSecondary)
////        }.frame(maxWidth: .infinity)
////    }
////}
////
////#Preview {
////    PopularArticlesView()
////}
////
////import SwiftUI
////
////import SwiftUI
//////
//////struct ArticleGridView: View {
//////    let articles: [NYTArticle]
//////
//////    var body: some View {
//////        ScrollView {
//////            LazyVStack(spacing: 16) {
//////                ForEach(Array(articles.chunked(into: 5).enumerated()), id: \.offset) { index, group in
//////                    VStack(spacing: 12) {
//////                        if let first = group.first {
//////                            FullWidthArticleCard(article: first)
//////                        }
//////
//////                        let pairs = Array(group.dropFirst()).chunked(into: 2)
//////
//////                        ForEach(pairs, id: \.self) { pair in
//////                            HStack(spacing: 12) {
//////                                ForEach(pair, id: \.id) { article in
//////                                    SmallArticleCard(article: article)
//////                                }
//////
//////                                if pair.count < 2 {
//////                                    Spacer()
//////                                }
//////                            }
//////                        }
//////                    }
//////                    .padding(.horizontal)
//////                }
//////            }
//////            .padding(.vertical)
//////        }
//////        .background(Color(.systemGroupedBackground))
//////    }
//////}
//////
//////struct FullWidthArticleCard: View {
//////    let article: NYTArticle
//////
//////    var body: some View {
//////        VStack(alignment: .leading, spacing: 8) {
//////            AsyncImage(url: URL(string: article.imageURL!)) { phase in
//////                switch phase {
//////                case .success(let image):
//////                    image.resizable()
//////                        .scaledToFill()
//////                        .frame(height: 220)
//////                        .clipped()
//////                        .cornerRadius(12)
//////                case .failure(_):
//////                    placeholder
//////                case .empty:
//////                    placeholder
//////                @unknown default:
//////                    placeholder
//////                }
//////            }
//////
//////            Text(article.title)
//////                .font(.headline)
//////                .foregroundColor(.primary)
//////                .lineLimit(2)
//////
//////            HStack {
//////                Text(article.source)
//////                Spacer()
//////                Text(article.publishedAt)
//////            }
//////            .font(.caption)
//////            .foregroundColor(.secondary)
//////        }
//////    }
//////
//////    private var placeholder: some View {
//////        RoundedRectangle(cornerRadius: 12)
//////            .fill(Color.gray.opacity(0.3))
//////            .frame(height: 220)
//////    }
//////}
//////
//////struct SmallArticleCard: View {
//////    let article: NYTArticle
//////
//////    var body: some View {
//////        VStack(alignment: .leading, spacing: 6) {
//////            AsyncImage(url: URL(string: article.imageURL!)) { phase in
//////                if let image = phase.image {
//////                    image.resizable()
//////                        .scaledToFill()
//////                        .frame(height: 120)
//////                        .clipped()
//////                        .cornerRadius(10)
//////                } else {
//////                    RoundedRectangle(cornerRadius: 10)
//////                        .fill(Color.gray.opacity(0.3))
//////                        .frame(height: 120)
//////                }
//////            }
//////
//////            Text(article.title)
//////                .font(.subheadline)
//////                .foregroundColor(.primary)
//////                .lineLimit(2)
//////
//////            Text(article.source)
//////                .font(.caption)
//////                .foregroundColor(.secondary)
//////        }
//////        .frame(maxWidth: .infinity)
//////    }
//////}
//////
//////extension Array {
//////    func chunked(into size: Int) -> [[Element]] {
//////        stride(from: 0, to: count, by: size).map {
//////            Array(self[$0..<Swift.min($0 + size, count)])
//////        }
//////    }
//////}
//////
//////#Preview {
//////    ArticleGridView(articles: sampleNYTArticles)
//////}
//
//let sampleNYTArticles: [NYTArticle] = [
//    NYTArticle(
//        id: "1",
//        title: "Elon Musk Juggled Drugs and Family Drama",
//        abstract: "As Mr. Musk entered President Trump’s orbit...",
//        imageURL: "https://static01.nyt.com/images/2025/05/26/multimedia/00musk-wflt/00musk-wflt-mediumThreeByTwo440.jpg",
//        source: "New York Times",
//        publishedAt: "3d"
//    ),
//    NYTArticle(
//        id: "2",
//        title: "What’s Pushed Me Over the Edge",
//        abstract: "Trumpism can be seen as a giant attempt...",
//        imageURL: "https://static01.nyt.com/images/2025/05/30/multimedia/29brooks1-kpjf/29brooks1-kpjf-mediumThreeByTwo440.jpg",
//        source: "New York Times",
//        publishedAt: "2d"
//    )
//]
//
//#Preview("ArticleCardView Preview") {
//    ScrollView {
//        VStack(spacing: 24) {
//            // بطاقة كاملة العرض
//            ArticleCardView(article: sampleNYTArticles[0], style: .large)
//                .padding()
//
//            // صف أفقي فيه بطاقتين صغيرة
//            HStack(spacing: 12) {
//                ArticleCardView(article: sampleNYTArticles[0], style: .small)
//                    .frame(maxWidth: .infinity)
//
//                ArticleCardView(article: sampleNYTArticles[1], style: .small)
//                    .frame(maxWidth: .infinity)
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//
//struct NYTArticle: Identifiable, Hashable {
//    let id: String
//    let title: String
//    let abstract: String
//    let imageURL: String
//    let source: String
//    let publishedAt: String
//}
//
//extension Array {
//    func chunked(into size: Int) -> [[Element]] {
//        stride(from: 0, to: count, by: size).map {
//            Array(self[$0..<Swift.min($0 + size, count)])
//        }
//    }
//}
//
//struct ArticleGridView: View {
//    let articles: [NYTArticle]
//
//    var body: some View {
//        ScrollView {
//            LazyVStack(spacing: 16) {
//                ForEach(Array(articles.chunked(into: 5)), id: \.self) { group in
//                    VStack(spacing: 12) {
//                        if let first = group.first {
//                            ArticleCardView(article: first, style: .large)
//                        }
//
//                        let rows = Array(group.dropFirst()).chunked(into: 2)
//                        ForEach(rows, id: \.self) { row in
//                            HStack(spacing: 12) {
//                                ForEach(row, id: \.id) { article in
//                                    ArticleCardView(article: article, style: .small)
//                                        .frame(maxWidth: .infinity)
//                                }
//
//                                if row.count < 2 {
//                                    Spacer()
//                                }
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//            .padding(.vertical)
//        }
//        .background(Color(.systemGroupedBackground))
//    }
//}
//
////struct ArticleCardView: View {
////    let article: NYTArticle
////    let style: ArticleCardStyle
////
////    var body: some View {
////        VStack(alignment: .leading, spacing: 6) {
////            AsyncImage(url: URL(string: article.imageURL)) { phase in
////                if let image = phase.image {
////                    image.resizable()
////                        .scaledToFill()
////                        .frame(height: style == .large ? 220 : 120)
////                        .clipped()
////                        .cornerRadius(12)
////                } else {
////                    RoundedRectangle(cornerRadius: 12)
////                        .fill(Color.gray.opacity(0.3))
////                        .frame(height: style == .large ? 220 : 120)
////                }
////            }
////
////            Text(article.title)
////                .font(style == .large ? .headline : .subheadline)
////                .foregroundColor(.primary)
////                .lineLimit(2)
////
////            HStack {
////                Text(article.source)
////                Spacer()
////                Text(article.publishedAt)
////            }
////            .font(.caption)
////            .foregroundColor(.secondary)
////        }
////    }
////}
////
////enum ArticleCardStyle {
////    case large
////    case small
////}
