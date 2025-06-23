//
//  StreamService.swift
//  twitch-ios-client-clone
//
//  Created by Daniel Synn on 6/23/25.
//

import Foundation

protocol StreamServiceProtocol {
    func fetchStreams(completion: @escaping ([Stream]) -> Void)
}

class MockStreamService: StreamServiceProtocol {
    func fetchStreams(completion: @escaping ([Stream]) -> Void) {
        let streams = [
            Stream(id: "001", title: "Big Buck Bunny", url: Constants.URLs.sampleStream)
        ]
        completion(streams)
    }
}
