import XCTest
@testable import cracking_swift

final class TreesAndGraphsTests: XCTestCase {
    func testIsValidBST() {
        let t1 = TreeNode(2)
        let t2 = TreeNode(1)
        let t3 = TreeNode(3)
        t1.left = t2
        t1.right = t3
        let ok = isValidBST(t1)
        XCTAssertTrue(ok)
    }

    static var allTests = [
        ("testIsValidBST", testIsValidBST)
    ]
}