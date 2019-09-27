//
//  InputStream.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 04.02.19.
//

import Foundation

public protocol InputStream {
    associatedtype Element

    func getNext() -> Element?
}
