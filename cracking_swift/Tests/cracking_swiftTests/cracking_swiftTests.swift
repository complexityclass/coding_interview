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

    func testLRUCache() {
        let cache = LRUCache(2)
        cache.put(1, 1)
        cache.put(2, 2)
        let x1 = cache.get(1)   // returns 1
        XCTAssertEqual(x1, 1)
        cache.put(3, 3)         // evicts key 2
        let x2 = cache.get(2)   // returns -1 (not found)
        XCTAssertEqual(x2, -1)
        cache.put(4, 4)         // evicts key 1
        let x3 = cache.get(1)   // returns -1 (not found)
        XCTAssertEqual(x3, -1)
        let x4 = cache.get(3)   // returns 3
        XCTAssertEqual(x4, 3)
        let x5 = cache.get(4)   // returns 4
        XCTAssertEqual(x5, 4)
    }

    static var allTests = [
        ("testLengthOfLongestSubstring", testLengthOfLongestSubstring),
        ("testReverseBetween", testReverseBetween),
        ("testLRUCache", testLRUCache)
    ]
}
