//
//  CharactersViewControllerTests.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 11.04.2025.
//

import XCTest
@testable import RMDiskStorageMVC

final class CharactersViewControllerTests: XCTestCase {
    private var viewController: CharactersViewController!
    private var mockDataSource: MockDataSource!
    private var mockService: MockCharactersServiceForController!
    private var mockStorageManager: MockStorageManager!
    
    override func setUp() {
        super.setUp()
        mockDataSource = MockDataSource()
        mockService = MockCharactersServiceForController()
        mockStorageManager = MockStorageManager()

        viewController = CharactersViewController(
            tableViewDataSource: mockDataSource,
            charactersService: mockService,
            storageManager: mockStorageManager
        )
    }
    
    override func tearDown() {
        viewController = nil
        mockDataSource = nil
        mockService = nil
        mockStorageManager = nil
        super.tearDown()
    }
    
    func testViewDidLoadWhenCharactersAreSaved() {
        let savedCharacters = [
            Character(name: "Summer Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Female",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     ),
            Character(name: "Beth Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Female",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     )
        ]

        mockStorageManager.saveCharacters(savedCharacters)

        viewController.viewDidLoad()
        
        XCTAssertEqual(mockDataSource.characters, savedCharacters)
    }
    
    func testViewDidLoadWhenCharactersAreNotSaved() {
        let fetchedCharacters = [
            Character(name: "Rick Sanchez",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     ),
            Character(name: "Morty Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     )

        ]

        mockService.characters = fetchedCharacters

        viewController.viewDidLoad()

        XCTAssertEqual(mockDataSource.characters, fetchedCharacters)
        XCTAssertEqual(mockStorageManager.characters, fetchedCharacters)
    }

    func testGetCharactersFailureHandlesError() {
        mockService.shouldReturnError = true

        viewController.viewDidLoad()

        XCTAssertEqual(mockDataSource.characters, [])
    }
}
