//
//  ArticleDetailView.swift
//  SwiftUIModal
//
//  Created by Maxim Brishten on 12.05.23.
//

import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
        .overlay(content: {
            HStack {
                Spacer()
                VStack {
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding([.top, .trailing], 20)
                    Spacer()
                }
            }
        })
        .alert("Reminder", isPresented: $showAlert, actions: {
            Button("Yes") {
                dismiss()
            }
            Button(role: .cancel, action: {}) {
                Text("No")
            }
        }, message: {
            Text("Are you shore you want finish reading?")
        })
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}
