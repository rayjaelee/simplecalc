//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//
// Modified by Raymond Lee on 3rd October 2018.
// INFO 449 Au 18

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args.count == 3 {
            
            let arthSymbol = args[1]
            let first: Int! = Int(args[0])
            let second: Int! = Int(args[2])
            
            if arthSymbol == "+" {
                return first + second
            } else if arthSymbol == "-" {
                return first - second
            } else if arthSymbol == "/" {
                return first / second
            } else if arthSymbol == "*" {
                return first * second
            } else if arthSymbol == "%" {
                return first % second
            }
            
        } else {
            return complexCalc(args)
        }
        return 0
    }
    
    private func complexCalc(_ args: [String]) -> Int {
        let calcType = args[args.count - 1]
        if calcType == "fact" {
            var result = 1
            let target: Int! = Int(args[0])
            for num in 1...target {
                result *=  num
            }
            return result
        } else if calcType == "count" {
            return args.count - 1
        } else if calcType == "avg" {
            var total = 0
            for i in 0...args.count - 1 {
                let num: Int! = Int(args[i])
                total += num
            }
            return total
        }
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

