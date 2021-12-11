//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import SwiftUI

struct MovieDetailsView: View {
    var details: MovieDetails
    var body: some View {
        VStack(alignment: .leading) {
            Image(details.backdrop)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(details.title)
                    .font(.title)
                Text(details.releaseDate)
                    .font(.caption)
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
        MovieDetailsView(details: MovieDetails(title: "title", overview: "overview", releaseDate: "releaseDate", backdrop: "backdrop"))
    }
}
