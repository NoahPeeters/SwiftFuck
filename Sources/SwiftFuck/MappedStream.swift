//
//  MappedStream.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 04.02.19.
//

import Foundation

public class MappedStream<Chained: InputStream, OutputValue>: InputStream {
    public typealias Element = OutputValue
    public typealias Mapping = (Chained.Element) -> OutputValue

    private let chained: Chained
    private let mapping: Mapping

    fileprivate init(_ chained: Chained, mapping: @escaping Mapping) {
        self.chained = chained
        self.mapping = mapping
    }

    public func getNext() -> OutputValue? {
        return chained.getNext().map(mapping)
    }
}

extension InputStream {
    public func map<Output>(mapping: @escaping (Self.Element) -> Output) -> MappedStream<Self, Output> {
        return MappedStream(self, mapping: mapping)
    }
}
