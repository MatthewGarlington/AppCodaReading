//
//  ArticleDetailView.swift
//  AppCodaPractice
//
//  Created by Matthew Garlington on 1/27/21.
//

import SwiftUI


struct ArticleDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
   
    // This is to show the alert
    
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

        }.alert(isPresented: $showAlert) {
         // This enables the alert view
            Alert(title: Text("Reminder"), message: Text("Are you sure you are finished reading the article?"), primaryButton: .default(Text("Yes"), action: { self.presentationMode.wrappedValue.dismiss() }), secondaryButton: .cancel(Text("No")))
        }
        
        // This Gives a button to dismiss the modal view
        .overlay(
            
            HStack {
                Spacer()

                VStack {
                    Button(action: {
                        // This shows the reader an alert to see if they are ready to stop reading 
                        self.showAlert = true
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 40)

                    Spacer()
                }
            }
        )
        
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}
