//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import SwiftUI

struct MovieListView: View {
    // TODO: Change hardcoded data
    var movieSummaries: [MovieSummary] = [
        MovieSummary(id: 0, title: "Movie 1", image: "image", budget: 5000),
        MovieSummary(id: 1, title: "Movie 2", image: "image", budget: 6000)
    ]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(movieSummaries) { summary in
                MovieListRow(summary: summary)
                    .listRowSeparator(.hidden)
                    .listSectionSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Search in movies")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { searchText in
            // TODO: implement searching
            print(searchText)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
