import SwiftFuck

//let program = StringStream(string: ",[.,]")

//let program = FileStream(path: "<path>/mandelbrot.bf")!.map { Character(UnicodeScalar($0)) }

let chain = InstructionChain.from(stream: program)

let machine = Machine(dataField: ArrayDataField<UInt32>())
machine.run(chain: chain)
