import XCTest
@testable import cracking_swift

final class cracking_swiftTests: XCTestCase {
    func testLengthOfLongestSubstring() {
        XCTAssertEqual(lengthOfLongestSubstring("pwwkew"), 3)
    }

    func testReverseBetween() {
        let list = listOf(1,2,3,4,5)
        let res = reverseBetween(list, 2, 4)!.toArray()
        XCTAssertEqual(res, listOf(1,4,3,2,5)!.toArray())
    }

    static var allTests = [
        ("testLengthOfLongestSubstring", testLengthOfLongestSubstring),
        ("testReverseBetween", testReverseBetween)
    ]
}
