//
//  SearchAssembly.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 14.03.2025.
//

import Foundation
import UIKit

final class CharactersAssembly {
    func createModule() -> UIViewController {
        let storageManager = DiskStorageManager()
        let charactersService = CharactersService()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let tableViewDataSource = CharactersTableViewDataSource(imageLoader: imageLoader)

        let viewController = CharactersViewController(
            characterTableViewDataSource: tableViewDataSource,
            charactersService: charactersService,
            storageManager: storageManager
        )

        let navigationController = UINavigationController(rootViewController: viewController)

        return navigationController
    }
}
