//
//  CharactersViewControllerSnapshotTests.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 11.04.2025.
//

import XCTest
import SnapshotTesting
@testable import RMDiskStorageMVC

final class CharactersViewControllerSnapshotTests: XCTestCase {
    func testCharactersViewControllerDefaultAppearance() {
        let mockDataSource = MockDataSource()
        let mockService = MockCharactersServiceForController()
        let mockStorageManager = MockStorageManager()

        let viewController = CharactersViewController(
            tableViewDataSource: mockDataSource,
            charactersService: mockService,
            storageManager: mockStorageManager
        )

        let navigationController = UINavigationController(rootViewController: viewController)

        let characters = [
            Character(name: "John Doe",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth"),
                      image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
                     ),
            Character(name: "Morty Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth (C-137)"),
                      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
                     )
        ]

        viewController.loadViewIfNeeded()
        mockService.characters = characters
        mockStorageManager.saveCharacters(characters)
        viewController.viewDidLoad()

        assertSnapshot(of: navigationController, as: .image)
    }
}
