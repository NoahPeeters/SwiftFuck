//
//  Machine.swift
//  SwiftFuck
//
//  Created by Noah Peeters on 04.02.19.
//

import Foundation 

public class Machine<DataBand: DataField> {
    let dataField: DataBand

    public init(dataField: DataBand) {
        self.dataField = dataField
    }

    public func run(chain: InstructionChain) {
        var chain: InstructionChain? = chain
        while let c = chain {
            if let instruction = c.instruction {
                execute(instruction: instruction)
            }
            chain = c.next
        }
    }

    private func execute(instruction: Instruction) {
        switch instruction {
        case .increment:
            dataField.incrementValue()
        case .decrement:
            dataField.decrementValue()
        case .shiftRight:
            _ = dataField.incrementPointer()
        case .shiftLeft:
            _ = dataField.decrementPointer()
        case .readChar:
            dataField.writeValue(DataBand.Cell(getchar()))
        case .writeChar:
            putchar(Int32(dataField.readValue()))
        case let .loop(body):
            while (dataField.readValue() != 0) {
                run(chain: body)
            }
        }
    }
}
