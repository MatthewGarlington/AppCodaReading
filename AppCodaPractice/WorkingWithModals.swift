//
//  WorkingWithModals.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/27/21.
//

import SwiftUI

struct WorkingWithModals: View {
    
    @State var showDetailView = false
    @State var selectedArticle: Article?
    
 
    
   
    var body: some View {
        NavigationView {
            List(articles) { article in
                ArticleRow(article: article)
                
                  .onTapGesture {
                            self.showDetailView = true
                            self.selectedArticle = article
                        }
            }
            
            // This creates a Full Screen model to show the detail view with a dismiss button instead of swipe 
           
            .fullScreenCover(item: self.$selectedArticle) { article in
                ArticleDetailView(article: article)
            }
            
            // This shows a regular modal view that is not full screen and can be dismissed with a swipe
//            .sheet(isPresented: self.$showDetailView) {
//
//                    if let selectedArticle = self.selectedArticle {
//                        ArticleDetailView(article: selectedArticle)
//                    }
//                }

            .navigationBarTitle("Your Reading")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct WorkingWithModals_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithModals()
    }
}

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
                
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
                
                
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            
        }
     
    }
}
