import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(cracking_swiftTests.allTests),
    ]
}
#endif
