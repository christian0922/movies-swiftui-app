//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import SwiftUI

struct MovieDetailsView: View {
    @State var details: MovieDetails
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: details.backdropUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.clear
            }
            VStack(alignment: .leading) {
                Text(details.title)
                    .font(.title)
                Text(details.releaseDateString)
                    .font(.caption)
                    .padding([.bottom])
                Text(details.overview)
                    .font(.body)
            }
            .padding()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
        .navigationBarTitle("Movie details", displayMode: .inline)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(details: MovieDetails(id: 0, title: "title", budget: 5000, overview: "overview", releaseDate: "releaseDate", backdropPath: nil, posterPath: nil))
    }
}
