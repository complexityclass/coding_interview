import XCTest
@testable import cracking_swift

final class RecursionTests: XCTestCase {
    func testLetterCombinations() {
        let res = letterCombinations("23")
        let expected = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
        XCTAssertEqual(res.sorted(), expected.sorted())
    }

    static var allTests = [
        ("testLetterCombinations", testLetterCombinations)
    ]
}