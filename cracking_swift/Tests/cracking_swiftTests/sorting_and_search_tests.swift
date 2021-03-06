import XCTest
@testable import cracking_swift

final class SortingAndSearchTests: XCTestCase {
    func testSortInRotatedArray() {
        let solution = SearchInRotatedArray()
        let input = [4,5,6,7,0,1,2]
        let res = solution.search(input, 0)
        XCTAssertEqual(res, 4)
    }

    func testFirstAndLast() {
        let solution = FirstAndLast()
        let input3 = [2,2]
        let res3 = solution.searchRange(input3, 2)
        XCTAssertEqual(res3, [0,1])
    }

    func testSingleElemArr() {
        let solution = FirstAndLast()
        let input = [1]
        let res = solution.searchRange(input, 0)
        XCTAssertEqual(res, [-1,-1])
    }

    static var allTests = [
        ("testSortInRotatedArray", testSortInRotatedArray),
        ("testFirstAndLast", testFirstAndLast),
        ("testSingleElemArr", testSingleElemArr)
    ]
}