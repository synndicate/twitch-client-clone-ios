//
//  StreamPlayerView.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import SwiftUI
import AVKit

struct StreamPlayerView: View {
    private let player = AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)

    var body: some View {
        VideoPlayer(player: player)
            .frame(height: 240)
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
    }
}
