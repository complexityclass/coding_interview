class LRUCache {
    private var nodeMap: [Int: Node] = [:]
    private var head = Node(key: 0, value: 0)
    private var tail = Node(key: 0, value: 0)
    private var cacheCapacity: Int

    init(_ capacity: Int) {
        self.cacheCapacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        var value = -1
        if let node = nodeMap[key] {
            value = node.value
            remove(node)
            add(node)
        }
        return value
    }
    
    func put(_ key: Int, _ value: Int) {
        let node = nodeMap[key]
        if let node = node {
            remove(node)
            node.value = value
            add(node)
        } else {
            if nodeMap.count == cacheCapacity {
                nodeMap[tail.prev!.key] = nil
                remove(tail.prev!)
            }
            let newNode = Node(key: key, value: value)
            nodeMap[key] = newNode
            add(newNode)
        }
    }

    private func add(_ node: Node) {
        let headNext = head.next
        head.next = node
        node.prev = head
        node.next = headNext
        headNext?.prev = node
    }

    private func remove(_ node: Node) {
        let nextNode = node.next
        let prevNode = node.prev
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
    }

    class Node {
        var key: Int
        var value: Int
        var prev: Node?
        var next: Node?

        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }
}