//
//  RandomQuoteView.swift
//  ChuckNorrisApp
//
//  Created by Rodrigo Borges on 18/05/22.
//

import SwiftUI

struct RandomFactView: View {

    var quotes = ["Chuck Norris once rode a nine foot grizzly bear through an automatic car wash, instead of taking a shower.",
                  "When in Rome, Chuck Norris roundhouse-kicks you in the face wearing a toga.",
                  "Chuck Norris can kill 2 stones with one bird",
                  "how many Chuck Norris' does it Chuck to Norris? Chuck. Fucking Norris."]

    @State var quote = "Chuck Norris once rode a nine foot grizzly bear through an automatic car wash, instead of taking a shower."

    var body: some View {
        NavigationView {
            VStack {
                Text(quote)
                    .padding()

                Button("Generate") {

                    let index = Int.random(in: 0..<4)
                    quote = quotes[index]
                }.buttonStyle(.borderedProminent)
            }
            .navigationTitle("Random")
        }

    }
}

struct RandomFactView_Previews: PreviewProvider {
    static var previews: some View {
        RandomFactView()
    }
}
