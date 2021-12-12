//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import SwiftUI

struct MovieDetailsView: View {
    @InjectedObject var viewModel: BaseMovieDetailsViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Image(viewModel.movieDetails.backdrop)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(viewModel.movieDetails.title)
                    .font(.title)
                Text(viewModel.movieDetails.releaseDate)
                    .font(.caption)
                Text(viewModel.movieDetails.overview)
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
        MovieDetailsView()
    }
}
