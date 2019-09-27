//
//  DataField.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 02.02.19.
//  Copyright © 2019 Noah Peeters. All rights reserved.
//

import Foundation

public protocol DataField {
    associatedtype Cell: FixedWidthInteger

    func incrementPointer() -> Bool
    func decrementPointer() -> Bool
    func incrementValue()
    func decrementValue()
    func readValue() -> Cell
    func writeValue(_ value: Cell)
}
