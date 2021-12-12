//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import SwiftUI

struct MovieListView: View {
    @State private var searchText = ""
    @InjectedObject private var viewModel: BaseMovieListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.movieSummaries) { summary in
                MovieListRow(summary: summary)
                    .listRowSeparator(.hidden)
                    .listSectionSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Search in movies")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { searchText in
            print(searchText)
            viewModel.searchText.send(searchText)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
