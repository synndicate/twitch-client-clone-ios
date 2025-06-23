//
//  Constants.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import Foundation
import SwiftUI

enum Constants {
    
    enum URLs {
        static let sampleStream = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
    }
    
    enum UI {
        static let playerHeight: CGFloat = 240
        static let controlButtonPadding: CGFloat = 10
        static let controlOverlayBackground = Color.black.opacity(0.69)
        static let controlOverlayForeground = Color.white.opacity(0.69)
        static let controlAutoHideDelay: TimeInterval = 1.0 // second(s)
    }
    
    enum Icons {
        static let fullscreen = "arrow.up.left.and.arrow.down.right"
        static let close = "xmark.circle.fill"
    }
}
