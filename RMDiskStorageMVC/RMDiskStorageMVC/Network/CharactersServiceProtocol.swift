//
//  CharactersServiceProtocol.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 10.04.2025.
//

import Foundation

protocol CharactersServiceProtocol {
    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void)
}
