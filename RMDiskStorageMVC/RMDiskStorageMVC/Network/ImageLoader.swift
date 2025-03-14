//
//  ImageLoader.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 29.12.2024.
//

import Foundation
import UIKit.UIImage

final class ImageLoader {
    private var counter = 1

    private let storageManager: DiskStorageManager

    init(storageManager: DiskStorageManager) {
        self.storageManager = storageManager
    }

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let key = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? urlString

        if let imageData = storageManager.loadImage(key: key),
           let image = UIImage(data: imageData) {
            completion(image)
            return
        }

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            if let data,
               let image = UIImage(data: data) {
                self.storageManager.saveImage(data, key: key)
                DispatchQueue.main.async {
                    completion(image)
                    print("Load image \(self.counter)")
                    self.counter += 1
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
