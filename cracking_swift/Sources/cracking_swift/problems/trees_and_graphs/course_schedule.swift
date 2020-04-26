
class CourseScheduleSolution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var g: [Int: [Int]] = [:]
        for v in 0..<numCourses {
            g[v] = []
        }
        for p in prerequisites {
            var l = g[p[0]]!
            l.append(p[1])
            g[p[0]] = l
        }

        var hasCycle: Bool = false

        func hasCycleDfs(from: Int) -> Bool {
            var stack: [Int] = []
            var seen: Set<Int> = []
            stack.insert(from, at: 0)
            while !stack.isEmpty {
                let v = stack.removeFirst()
                if !seen.contains(v) {
                    seen.insert(v)
                }
                for vert in g[v]! {
                    if !seen.contains(vert) {
                        stack.insert(vert, at: 0)
                    } else {
                        return true
                    }
                }
            }

            return false
        }

        for v in 0..<numCourses {
            if hasCycleDfs(from: v) {
                return false
            }
        }

        return true
    }
}