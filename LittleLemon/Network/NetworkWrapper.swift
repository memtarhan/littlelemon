//
//  NetworkWrapper.swift
//  LittleLemon
//
//  Created by Mehmet Tarhan on 24.09.2025.
//

import Foundation

protocol NetworkWrapper {
    /// Handles HTTP call and retrieve a response for given url with no authorization
    /// - Parameter url: The url HTTP call should be pointed to
    /// - Returns: Returns a response of given type
    func handleDataTask<T: APIResponse>(from url: URL) async throws -> T
}

extension NetworkWrapper {
    func handleDataTask<T: APIResponse>(from url: URL) async throws -> T {
        let (data, _) = try await session.data(from: url)
        data.printPrettied()
        return try decoder.decode(T.self, from: data)
    }
}

// MARK: Private variables

private extension NetworkWrapper {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys

        return decoder
    }

    var session: URLSession {
        URLSession.shared
    }
}
