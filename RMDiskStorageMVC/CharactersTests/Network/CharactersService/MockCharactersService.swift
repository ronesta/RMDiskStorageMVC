//
//  MockCharactersService.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import Foundation
@testable import RMDiskStorageMVC

final class MockCharactersService: CharactersServiceProtocol {
    var mockResult: Result<[Character], Error>?

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        if let result = mockResult {
            completion(result)
        }
    }

    func getCharactersWithInvalidJSON(completion: @escaping (Result<[Character], Error>) -> Void) {
        let invalidJSON = "".data(using: .utf8)!

        do {
            let _ = try JSONDecoder().decode(PostCharacters.self, from: invalidJSON)
            completion(.success([]))
        } catch {
            completion(.failure(error))
        }
    }
}
