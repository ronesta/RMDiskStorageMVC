//
//  MockDispatchQueue.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 28.04.2025.
//

import Foundation
@testable import RMDiskStorageMVC

final class MockDispatchQueue: DispatchQueueProtocol {
    func async(_ block: @escaping () -> Void) {
        block()
    }
}
