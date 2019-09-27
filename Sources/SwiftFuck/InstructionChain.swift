//
//  InstructionChain.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 04.02.19.
//

import Foundation

public class InstructionChain {
    public let instruction: Instruction?
    public private(set) var next: InstructionChain?

    public static func from<Stream: InputStream>(stream: Stream) -> InstructionChain where Stream.Element == Character {
        let start = InstructionChain()
        var last = start


        while let character = stream.getNext() {
            let new: InstructionChain

            switch character {
            case "[":
                new = InstructionChain(instruction: .loop(body: .from(stream: stream)))
            case "]":
                return start.next ?? InstructionChain()
            case "+":
                new = InstructionChain(instruction: .increment)
            case "-":
                new = InstructionChain(instruction: .decrement)
            case ">":
                new = InstructionChain(instruction: .shiftRight)
            case "<":
                new = InstructionChain(instruction: .shiftLeft)
            case ".":
                new = InstructionChain(instruction: .writeChar)
            case ",":
                new = InstructionChain(instruction: .readChar)
            default:
                new = InstructionChain(instruction: nil)
            }

            last += new
            last = new
        }

        return start.next ?? InstructionChain()
    }

    public init(instruction: Instruction? = nil) {
        self.instruction = instruction
    }

    public func chain(_ chain: InstructionChain) {
        self.next = chain
    }
}

func +=(lhs: InstructionChain, rhs: InstructionChain) {
    lhs.chain(rhs)
}
