//
//  CharactersViewTests.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 11.04.2025.
//


import XCTest
@testable import RMDiskStorageMVC

final class CharactersViewTests: XCTestCase {
    private var charactersView: CharactersView!

    override func setUp() {
        super.setUp()
        charactersView = CharactersView(frame: .zero)
    }

    override func tearDown() {
        charactersView = nil
        super.tearDown()
    }

    func testSetupViews() {
        XCTAssertNotNil(charactersView.tableView)
        XCTAssertNotNil(charactersView.tableView.delegate)
        XCTAssertTrue(charactersView.tableView.delegate === charactersView)
    }
}
