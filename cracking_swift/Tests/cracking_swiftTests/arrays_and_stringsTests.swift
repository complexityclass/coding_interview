import XCTest
@testable import cracking_swift

final class ArraysAndStringsTests: XCTestCase {
    func testBackspaceCompare() {
        let s1 = "ab#c"
        let s2 = "ad#c"
        XCTAssertTrue(backspaceCompare(s1,s2))

        let s3 = "ab##"
        let s4 = "c#d#"
        XCTAssertTrue(backspaceCompare(s3,s4))

        let s5 = "bbbextm"
        let s6 = "bbb#extm"
        XCTAssertFalse(backspaceCompare(s5,s6))
    }

    static var allTests = [
        ("testBackspaceCompare", testBackspaceCompare)
    ]
}