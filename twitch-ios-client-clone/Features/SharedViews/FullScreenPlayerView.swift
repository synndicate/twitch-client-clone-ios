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
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 32))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.5).clipShape(Circle()))
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                showCloseButton = false
            }
        }
    }
}
