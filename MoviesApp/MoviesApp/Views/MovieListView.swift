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
            contentView
                .navigationTitle("Searching in movies")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { searchText in
            viewModel.searchText.send(searchText)
        }
    }
    
    var contentView: some View {
        if viewModel.hasError {
            return AnyView(errorView)
        } else if viewModel.movies.count > 0, searchText != "" {
            return AnyView(listView)
        } else if searchText == "" {
            return AnyView(emptySearchView)
        } else {
            return AnyView(emptyView)
        }
    }
    
    var listView: some View {
        List(viewModel.movies) { details in
            MovieListRow(details: details)
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
    var emptySearchView: some View {
        VStack(alignment: .leading) {
            Text("Type a movie name for searching")
                .font(.callout)
        }
    }
    
    var emptyView: some View {
        VStack(alignment: .leading) {
            Text("Movies not found for this search condition")
                .font(.callout)
        }
    }
    
    var errorView: some View {
        VStack(alignment: .leading) {
            Text("Something went wrong")
                .font(.callout)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
