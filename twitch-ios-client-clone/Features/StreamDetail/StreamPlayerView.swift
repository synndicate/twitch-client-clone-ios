//
//  StreamPlayerView.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import SwiftUI
import AVKit

struct StreamPlayerView: View {
    let player: AVPlayer
    
    @State private var isPresentingFullscreen = false
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .frame(height: Constants.UI.playerHeight)
                .onAppear { player.play() }
                .onDisappear { player.pause() }
            
            VStack {
                HStack {
                    Button {
                        isPresentingFullscreen = true
                    } label: {
                        Image(systemName: Constants.Icons.fullscreen)
                            .padding(Constants.UI.controlButtonPadding)
                            .background(Constants.UI.controlOverlayBackground)
                            .clipShape(Circle())
                            .foregroundColor(Constants.UI.controlOverlayForeground)
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
