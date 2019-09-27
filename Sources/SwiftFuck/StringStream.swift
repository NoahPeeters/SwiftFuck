//
//  StringStream.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 04.02.19.
//

import Foundation

public class StringStream: InputStream {
    public typealias Element = Character

    private let string: String
    private var index: String.Index

    public init(string: String) {
        self.string = string
        index = self.string.startIndex
    }

    public func getNext() -> Character? {
        guard index < string.endIndex else {
            return nil
        }
        defer {
            index = string.index(after: index)
        }

        return string[index]
    }
}
