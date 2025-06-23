//
//  FullScreenPlayerView.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import SwiftUI
import AVKit

struct FullscreenPlayerView: View {
    @Environment(\.dismiss) private var dismiss
    let player: AVPlayer

    @State private var showCloseButton = true

    var body: some View {
        ZStack(alignment: .topLeading) {
            VideoPlayer(player: player)
                .ignoresSafeArea()
                .onAppear {
                    player.play()
                    scheduleButtonHide()
                }
                .onDisappear { player.pause() }

            if showCloseButton {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: Constants.Icons.close)
                        .font(.system(size: 32))
                        .padding()
                        .foregroundColor(Constants.UI.controlOverlayForeground)
                        .background(Constants.UI.controlOverlayBackground)
                }
                .transition(.opacity)
                .animation(.easeInOut, value: showCloseButton)
            }
        }
        .contentShape(Rectangle()) // ensures tap gesture works
        .onTapGesture(count: 1) {
            withAnimation {
                showCloseButton.toggle()
            }
        }
    }

    private func scheduleButtonHide() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.UI.controlAutoHideDelay) {
            withAnimation {
                showCloseButton = false
            }
        }
    }
}
