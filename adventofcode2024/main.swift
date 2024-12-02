//
//  main.swift
//  adventofcode2024
//
//  Created by Zachary Vaters on 2024-12-01.
//

import Foundation

func readInputFile(_ file: String) -> String {
    #if DEBUG
    let currentDirectoryURL = URL(fileURLWithPath: #file)
        .deletingLastPathComponent()
    #else
    let currentDirectoryURL = URL(fileURLWithPath: Bundle.main.bundlePath)
        .deletingLastPathComponent()
    #endif
    
    let fileURL = currentDirectoryURL.appendingPathComponent(file)

    do {
        return try String(contentsOf: fileURL, encoding: .utf8)
    }
    catch {
        print("Error: \(error)")
        print("Attempted to read file at: \(fileURL.path)")
    }
    return ""
}

day01()
