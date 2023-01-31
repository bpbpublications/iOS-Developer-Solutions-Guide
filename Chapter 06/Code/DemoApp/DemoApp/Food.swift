//
//  Food.swift
//  DemoAppTests
//

import Foundation

class Food {
    
    func calculate(amountArray:[Int]) -> Int {
        var total = 0
        for amount in amountArray {
            total+=amount
        }
        return total
    }
    
    func calculateTip(totalAmount:Int, tipAmount:Int) -> Int {
        return tipAmount + totalAmount
    }
    
    func discount(totalAmount: Int, discountAmount: Int) -> Int {
        return totalAmount - discountAmount
    }
}

