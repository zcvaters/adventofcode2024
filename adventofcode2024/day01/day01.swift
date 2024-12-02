//
//  day01.swift
//  adventofcode2024
//
//  Created by Zachary Vaters on 2024-12-01.
//

func day01() {
    let input = readInputFile("day01/input")
    
    if input == "" {
        return print("No input found.")
    }
    
    let lines = input.split(whereSeparator: \.isNewline)
    
    var firstNumbers: [Int] = []
    var secondNumbers: [Int] = []
    
    for (_, line) in lines.enumerated() {
        let values = line.split(separator: "   ")
            if let number = Int(values[1]) {
                secondNumbers.append(number)
            }
            if let number = Int(values[0]) {
                firstNumbers.append(number)
            }
    }
    
    partA(firstNumbers: firstNumbers, secondNumbers: secondNumbers)
    partB(firstNumbers: firstNumbers, secondNumbers: secondNumbers)
}

func partA(firstNumbers: [Int], secondNumbers: [Int]) {
    var firstNumbersCopy = firstNumbers
    var secondNumbersCopy = secondNumbers
    var distance = 0
    while !firstNumbersCopy.isEmpty && !secondNumbersCopy.isEmpty {
        guard let min1 = firstNumbersCopy.min(), let min2 = secondNumbersCopy.min() else {
            print("Error: No numbers found.")
            break
        }

        let difference = abs(min1 - min2)
        distance += difference

        if let index1 = firstNumbersCopy.firstIndex(of: min1) {
            firstNumbersCopy.remove(at: index1)
        }
        if let index2 = secondNumbersCopy.firstIndex(of: min2) {
            secondNumbersCopy.remove(at: index2)
        }
    }

        print("Part A: ", distance)
}

func partB(firstNumbers: [Int], secondNumbers: [Int]) {
    var occurenceMultipled = 0
    for number in firstNumbers {
        let occurrenceCount = secondNumbers.filter {$0 == number}.count
        occurenceMultipled += number * occurrenceCount
    }
    
    
    print("Part B", occurenceMultipled)
}

