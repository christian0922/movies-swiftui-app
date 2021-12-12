//
//  MovieListRow.swift
//  MoviesApp
//
//  Created by Madarász Krisztián on 2021. 12. 11..
//

import SwiftUI

struct MovieListRow: View {
    @State var summary: MovieSummary
    var body: some View {
        VStack(alignment: .leading) {
            Image(summary.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(summary.title)
                    .font(.headline)
                    .fontWeight(.black)
                Text("\(summary.budget)")
                    .font(.caption)
            }
            .padding([.leading, .trailing])
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
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .topLeading)
        .cornerRadius(10)
        .listRowBackground(Color.clear)
        // TODO: Change hardcoded data
        .background(NavigationLink("", destination: MovieDetailsView()))
    }
}

struct MovieListRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRow(summary: MovieSummary(id: 0, title: "title", image: "image", budget: 5000))
    }
}
