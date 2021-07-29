//
//  StructsEnums.swift
//  Calculator
//
//  Created by Noor Mohammed Anik on 6/7/21.
//

import Foundation

enum Operator : String {
    case add="+"
    case subtract="-"
    case times="*"
    case divide="/"
    case nothing=""
    
}

enum calculationState: String {
    case enteringNum="enteringNum"
    case newNumStarted="newNumStarted"
}
