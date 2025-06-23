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
    
    @State private var isPresentingFullscreen = false
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .frame(height: 240)
                .onAppear { player.play() }
                .onDisappear { player.pause() }
            
            VStack {
                HStack {
                    Button {
                        isPresentingFullscreen = true
                    } label: {
                        Image(systemName: "arrow.up.left.and.arrow.down.right")
                            .padding(10)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    .padding()
                    Spacer()
                }
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isPresentingFullscreen) {
            FullscreenPlayerView(player: player)
        }
    }
}
