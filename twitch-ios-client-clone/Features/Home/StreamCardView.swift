//
//  StreamCardView.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import SwiftUI

struct StreamCardView: View {
    let stream: Stream
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "video")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(stream.name)
                .font(.headline)
                .lineLimit(1)
            Text("id: \(stream.id)")
        }
        .padding(.vertical, 8)
    }
}
