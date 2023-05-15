//
//  ContentView.swift
//  SwiftUIModal
//
//  Created by Maxim Brishten on 12.05.23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedArticle: Article?
    
    var body: some View {
        NavigationStack {
            List(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
                        selectedArticle = article
                    }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .fullScreenCover(item: $selectedArticle, content: { article in
                ArticleDetailView(article: article)
            })
            .navigationTitle("Your Reading")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
