//
//  StreamDetailView.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import SwiftUI

struct StreamDetailView: View {
    let stream: Stream
    @StateObject private var viewModel = StreamDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                StreamPlayerView()

                VStack(alignment: .leading, spacing: 8) {
                    Text(stream.title)
                        .font(.title2)
                        .bold()

                    Text("id: \(stream.id)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
        }
        .navigationTitle("Stream")
        .navigationBarTitleDisplayMode(.inline)
    }
}
