//
//  MockURLSessionDataTask.swift
//  RMDiskStorageMVC
//
//  Created by Ибрагим Габибли on 28.04.2025.
//

import Foundation
@testable import RMDiskStorageMVC

final class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private let completion: (() -> Void)?
    private(set) var resumeCallCount = 0

    init(completion: (() -> Void)?) {
        self.completion = completion
    }

    func resume() {
        resumeCallCount += 1
        completion?()
    }
}
