//
//  HomeView.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView(content: {
            List(viewModel.streams) { s in
                NavigationLink(destination: StreamDetailView(stream: s)) {
                    StreamCardView(stream: s)
                }
            }
        }).navigationTitle("Live Streams")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
