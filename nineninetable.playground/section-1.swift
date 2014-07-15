// Playground - noun: a place where people can play

import Cocoa

let MaxNum = 10
let tableNum = 9


func printTable(tableNum:Int) -> String{
    var result = ""
    
    for index in 1..<10{
        result += "\(tableNum) X \(index) = \(tableNum * index)\n"
    }
    
    return result
}


for index in 2..<10{
    if index % 2 == 0{
        println(printTable(index))
    } else {
        println("\(index)단 : 홀수는 패스~~\n")
    }
}
