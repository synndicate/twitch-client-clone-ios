//
//  StreamDetailView.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import SwiftUI
import AVKit

struct StreamDetailView: View {
    let stream: Stream
    private let player: AVPlayer
    @StateObject private var viewModel = StreamDetailViewModel()

    init(stream: Stream) {
        self.stream = stream
        self.player = AVPlayer(url: stream.url)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                StreamPlayerView(player: player)

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
