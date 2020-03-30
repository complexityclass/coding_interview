import XCTest
@testable import cracking_swift

final class SortingAndSearchTests: XCTestCase {
    func testSortInRotatedArray() {
        let solution = SearchInRotatedArray()
        let input = [4,5,6,7,0,1,2]
        let res = solution.search(input, 0)
        XCTAssertEqual(res, 4)
    }

    static var allTests = [
        ("testSortInRotatedArray", testSortInRotatedArray)
    ]
}