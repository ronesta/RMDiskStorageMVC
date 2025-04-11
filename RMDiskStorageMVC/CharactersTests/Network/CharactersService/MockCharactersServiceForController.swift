//
//  MockCharactersServiceForController.swift
//  CharactersTests
//
//  Created by Ибрагим Габибли on 11.04.2025.
//

import Foundation
@testable import RMDiskStorageMVC

final class MockCharactersServiceForController: CharactersServiceProtocol {
    var shouldReturnError = false
    var characters = [Character]()

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        if shouldReturnError {
            let error = NSError(domain: "Test", code: 0, userInfo: nil)
            completion(.failure(error))
        } else {
            completion(.success(characters))
        }
    }
}

