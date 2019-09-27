//
//  Instruction.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 04.02.19.
//

import Foundation

public enum Instruction {
    case increment
    case decrement
    case shiftRight
    case shiftLeft
    case readChar
    case writeChar
    case loop(body: InstructionChain)
}
