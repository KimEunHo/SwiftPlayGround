// Playground - noun: a place where people can play

import Cocoa


func getBinaryStr(num:Int) -> String{
    var result = ""
    var quotient:Int = Int(num / 2)
    var reminder = num % 2

    if quotient > 1 {
        result = getBinaryStr(quotient) + "\(reminder)"
    }else {
        result = "\(quotient)\(reminder)"
    }

    return result
}

getBinaryStr(7)


