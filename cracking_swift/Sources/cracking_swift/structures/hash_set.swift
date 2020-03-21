class MyHashSet {
    private var container: [[Int]]
    private let bucketSize = 100

    init() {
        self.container = Array(repeating: [], count: bucketSize)
    }
    
    func add(_ key: Int) {
        let index = hashFunction(key)
        var arr = container[index]
        if !arr.contains(key) {
            arr.append(key)
        }
        container[index] = arr        
    }
    
    func remove(_ key: Int) {
        let index = hashFunction(key)
        var arr = container[index]
        if let idxToDelete = (arr.firstIndex { $0 == key }) {
            arr.remove(at: idxToDelete)
        }
        container[index] = arr
    }
    
    func contains(_ key: Int) -> Bool {
        let index = hashFunction(key)
        let arr = container[index]
        return arr.contains(key)
    }

    private func hashFunction(_ key: Int) -> Int {
        key % bucketSize
    }
}