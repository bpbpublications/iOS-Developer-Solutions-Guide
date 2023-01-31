//
//  DemoAppTests.swift
//  DemoAppTests
//

import XCTest
@testable import DemoApp

final class DemoAppTests: XCTestCase {

    let food = Food()
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_for_calculating_total_amount() {
        let amountArray = [200, 300, 100]
        let total = food.calculate(amountArray: amountArray)
        XCTAssertEqual(total, 600, "Wrong total")
    }
    
    func test_for_calculating_tip() {
        let total = 100
        let tip = 20
        let finalAmount = food.calculateTip(totalAmount:total,tipAmount:tip)
        XCTAssertEqual(finalAmount, 120, "Wrong tip calculation")
    }
    func test_for_calculating_discount() {
        let total = 100
        let discount = 20
        let finalAmount = food.discount(totalAmount: total, discountAmount: discount)
        XCTAssertEqual(finalAmount, 80, "Wrong calculation on discount")
    }
}
