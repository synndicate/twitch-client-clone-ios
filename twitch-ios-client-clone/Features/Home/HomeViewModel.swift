//
//  HomeViewModel.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var streams: [Stream] = []
    private let streamService: StreamServiceProtocol
    
    init(streamService: StreamServiceProtocol = MockStreamService()) {
        self.streamService = streamService
        loadStreams()
    }
    
    func loadStreams() {
        streamService.fetchStreams(completion: {
            [weak self] streams in
            DispatchQueue.main.async {
                self?.streams = streams
            }
        })
    }
}
