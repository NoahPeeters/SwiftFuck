//
//  FileStream.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 04.02.19.
//

import Foundation

public class FileStream: InputStream {
    public typealias Element = UInt8

    private let fileHandle: FileHandle
    private var index: Int = 0

    public init(fileHandle: FileHandle) {
        self.fileHandle = fileHandle
    }

    public convenience init?(path: String) {
        guard let fileHandle = FileHandle(forReadingAtPath: path) else {
            return nil
        }

        self.init(fileHandle: fileHandle)
    }

    deinit {
        fileHandle.closeFile()
    }

    public func getNext() -> UInt8? {
        return autoreleasepool {
            let data = fileHandle.readData(ofLength: 1)
            guard data.count == 1 else {
                return nil
            }

            index += 1
            return data[0]
        }
    }
}
