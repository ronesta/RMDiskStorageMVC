//
//  CharactersDataSourceProtocol.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 11.04.2025.
//

import Foundation
import UIKit

protocol CharactersDataSourceProtocol: UITableViewDataSource {
    var characters: [Character] { get set }
}
