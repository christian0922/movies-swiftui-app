//
//  MovieListRow.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import SwiftUI

struct MovieListRow: View {
    @State var details: MovieDetails
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: details.posterUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.clear
            }
            VStack(alignment: .leading) {
                Text(details.title)
                    .font(.headline)
                    .fontWeight(.black)
                Text(details.budgetString)
                    .font(.caption)
                    .fontWeight(.black)
            }
            .padding([.leading, .trailing, .bottom])
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB,
                              red: 150/255,
                              green: 150/255,
                              blue: 150/255,
                              opacity: 0.1),
                        lineWidth: 1)
        )
        .shadow(color: Color.gray, radius: 10, x: 5, y: 5)
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .topLeading)
        .cornerRadius(10)
        .listRowBackground(Color.clear)
        .background(
            NavigationLink("", destination: MovieDetailsView(details: details))
        )
    }
}

struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow(details: MovieDetails(id: 0, title: "title", budget: 5000, overview: "overview", releaseDate: "releaseDate", backdropPath: nil, posterPath: nil))
    }
}
