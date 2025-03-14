//
//  CharacterTableViewDataSource.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 06.01.2025.
//

import Foundation
import UIKit

final class CharactersTableViewDataSource: NSObject, UITableViewDataSource {
    private let imageLoader: ImageLoader

    var characters = [Character]()

    init(imageLoader: ImageLoader) {
        self.imageLoader = imageLoader
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharactersTableViewCell.id,
            for: indexPath) as? CharactersTableViewCell else {
            return UITableViewCell()
        }

        let character = characters[indexPath.row]
        let imageURL = character.image

        imageLoader.loadImage(from: imageURL) { loadedImage in
            DispatchQueue.main.async {
                guard let cell = tableView.cellForRow(at: indexPath) as? CharactersTableViewCell  else {
                    return
                }
                cell.configure(with: character, image: loadedImage)
            }
        }

        return cell
    }
}
