//
//  MockStorageManager.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import Foundation
@testable import RMDiskStorageMVC

final class MockStorageManager: StorageManagerProtocol {
    private(set) var characters: [Character]?
    private(set) var images = [String: Data]()

    func saveCharacters(_ characters: [Character]) {
        self.characters = characters
    }

    func loadCharacters() -> [Character]? {
        return characters
    }

    func saveImage(_ image: Data, key: String) {
        images[key] = image
    }

    func loadImage(key: String) -> Data? {
        return images[key]
    }
}
