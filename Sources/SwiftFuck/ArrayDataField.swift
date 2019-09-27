//
//  ArrayDataField.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 02.02.19.
//  Copyright © 2019 Noah Peeters. All rights reserved.
//

import Foundation

public class ArrayDataField<Cell: FixedWidthInteger>: DataField {
    private var pointer = 0
    private var data: [Cell] = [0]

    public init() {}

    public func incrementPointer() -> Bool {
        pointer += 1

        if pointer == data.count {
            data.append(0)
        }
        return true
    }

    public func decrementPointer() -> Bool {
        guard pointer != 0 else {
            return false
        }

        pointer -= 1
        return true
    }

    public func incrementValue() {
        data[pointer] = data[pointer].addingReportingOverflow(1).partialValue
    }

    public func decrementValue() {
        data[pointer] = data[pointer].subtractingReportingOverflow(1).partialValue
    }

    public func readValue() -> Cell {
        return data[pointer]
    }

    public func writeValue(_ value: Cell) {
        data[pointer] = value
    }
}
