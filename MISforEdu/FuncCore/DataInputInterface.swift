//
//  DataInputInterface.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//
/*
import Foundation
//import PythonKit

func runPythonScript() {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/python3")
    process.arguments = ["fatchdata.py"]

    let pipe = Pipe()
    process.standardInput = pipe

    let inputString = "filename"
    let inputData = Data(inputString.utf8)
    pipe.fileHandleForWriting.write(inputData)
    pipe.fileHandleForWriting.closeFile()

    let outputPipe = Pipe()
    process.standardOutput = outputPipe

    process.launch()
    process.waitUntilExit()

    let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
    if let outputString = String(data: outputData, encoding: .utf8) {
        print(outputString)
    }
}
*/
