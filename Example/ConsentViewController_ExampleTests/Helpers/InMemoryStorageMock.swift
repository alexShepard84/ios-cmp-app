//
//  InMemoryStorageMock.swift
//  ConsentViewController_ExampleTests
//
//  Created by Andre Herculano on 10.06.20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
@testable import ConsentViewController

/// A class that uses [String: Any] as its storage
class InMemoryStorageMock: Storage {
    func integer(forKey defaultName: String) -> Int {
        storage[defaultName] as? Int ?? 0
    }

    var storage = [String: Any]()

    func string(forKey defaultName: String) -> String? {
        storage[defaultName] as? String
    }

    func object<T>(ofType type: T.Type, forKey defaultName: String) -> T? where T: Decodable {
        storage[defaultName] as? T
    }

    func set(_ value: Any?, forKey defaultName: String) {
        storage[defaultName] = value
    }

    func setObject<T>(_ value: T, forKey defaultName: String) where T: Encodable {
        storage[defaultName] = value
    }

    func setValuesForKeys(_ keyedValues: [String: Any]) {
        keyedValues.forEach { storage[$0.key] = $0.value }
    }

    func removeObject(forKey defaultName: String) {
        storage.removeValue(forKey: defaultName)
    }

    func removeObjects(forKeys keys: [String]) {
        keys.forEach { storage.removeValue(forKey: $0) }
    }

    func dictionaryRepresentation() -> [String: Any] {
        storage
    }
}
