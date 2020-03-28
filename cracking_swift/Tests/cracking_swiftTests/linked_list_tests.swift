import XCTest
@testable import cracking_swift

final class LinkedListTests: XCTestCase {

    func testAddTwoNumbers() {
        let l1 = listOf(2,4,3)
        let l2 = listOf(5,6,4)
        let l3 = addTwoNumbers(l1, l2)
        XCTAssertEqual(l3, listOf(7,0,8))

        let t1 = listOf(9)
        let t2 = listOf(8)
        let t3 = addTwoNumbers(t1, t2)
        XCTAssertEqual(t3, listOf(7,1))

        let k1 = listOf(5)
        let k2 = listOf(5)
        let k3 = addTwoNumbers(k1, k2)
        XCTAssertEqual(k3, listOf(0,1))
    }

    static var allTests = [
        ("testAddTwoNumbers", testAddTwoNumbers)
    ]
}