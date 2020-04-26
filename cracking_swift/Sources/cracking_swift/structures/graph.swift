
final class Graph<V: Hashable>: CustomStringConvertible {
    private var adj: [V:[V]] = [:]
    private let directed: Bool

    init(directed: Bool) {
        self.directed = directed
    }

    func addEdge(v1: V, v2: V) {
        add(from: v1, to: v2)
        if !directed {
            add(from: v2, to: v1)
        }
    }

    private func add(from: V, to: V) {
        if var fromList = adj[from] {
            fromList.append(to)
            adj[from] = fromList
        } else {
            adj[from] = [to]
        }
    }

    var description: String {
        var res: String = ""
        for key in adj.keys {
            let l = adj[key]!
            res += "\(key): \(l) \n"
        }
        return res
    } 
}

extension Graph {
    func dfs(from: V, action: (V) -> Void) {
        var stack: [V] = []
        var seen: Set<V> = []
        stack.insert(from, at: 0)
        while !stack.isEmpty {
            let v = stack.removeFirst()
            if !seen.contains(v) {
                seen.insert(v)
                action(v)
            }
            for vert in adj[v]! {
                if !seen.contains(vert) {
                    stack.insert(vert, at: 0)
                }
            }
        }
    }
}