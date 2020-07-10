//
//  ContentView.swift
//  SwiftUIFirebaseFirestore
//
//  Created by Lucas Spusta on 7/10/20.
//

import SwiftUI
import Firebase

struct Book: Identifiable {
  var id: String = UUID().uuidString
  var title: String
  var author: String
  var numberOfPages: Int
}


let testData = [
  Book(title: "My Book", author: "lspusta", numberOfPages: 235)
]

struct ContentView: View {
    @ObservedObject var booksViewModel = BooksViewModel()
      
      var body: some View {
        NavigationView {
          List(booksViewModel.books) { book in
            VStack(alignment: .leading) {
              Text(book.title)
                .font(.headline)
              Text(book.author)
                .font(.subheadline)
              Text("\(book.numberOfPages) pages")
                .font(.subheadline)
            }
          }
          .navigationBarTitle("Books")
          .onAppear() {
            self.booksViewModel.fetchData()
          }
        }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
