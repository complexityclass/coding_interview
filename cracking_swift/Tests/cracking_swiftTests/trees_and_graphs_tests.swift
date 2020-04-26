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

    func testGraph() {
        let graph = Graph<Int>(directed: false)
        graph.addEdge(v1: 1, v2: 2)
        graph.addEdge(v1: 1, v2: 5)
        graph.addEdge(v1: 5, v2: 4)
        graph.addEdge(v1: 5, v2: 2)
        graph.addEdge(v1: 2, v2: 4)
        graph.addEdge(v1: 4, v2: 3)
        
        var res: [Int] = []
        graph.dfs(from: 1) {
            res.append($0)
        }
    }

    func testCourseSchedule() {
        let solution = CourseScheduleSolution()
        let numCourses = 2
        let p1 = [[1,0]]
        let p2 = [[1,0],[0,1]]
        XCTAssertTrue(solution.canFinish(numCourses, p1))
        XCTAssertFalse(solution.canFinish(numCourses, p2))
    }

    static var allTests = [
        ("testIsValidBST", testIsValidBST),
        ("testGraph", testGraph),
        ("testCourseSchedule", testCourseSchedule)
    ]
}