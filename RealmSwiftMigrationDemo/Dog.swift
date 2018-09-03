//
//  Dog.swift
//  RealmSwiftMigrationDemo
//
//  Created by Thomas Do on 03/09/2018.
//  Copyright © 2018 Tho Do. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers final class Dog: Object {
    dynamic var id: String = UUID().uuidString
    dynamic var name: String = ""
    dynamic var age: Int = 0
}
