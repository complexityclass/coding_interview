class GenericHashMap<K: Hashable & Equatable, V> {
    private class Entry<K, V> {
        let key: K
        var value: V
        var next: Entry<K, V>?

        init(key: K, value: V, next: Entry<K, V>?) {
            self.key = key
            self.value = value
            self.next = next
        }
    }

    private static var initialCapacity: Int { get { 1 << 4 } }
    private var buckets: [Entry<K,V>?]
    private var size = 0

    convenience init() {
        self.init(capacity: Self.initialCapacity)
    }

    init(capacity: Int) {
        self.buckets = Array(repeating: nil, count: capacity)
    }

    func put(key: K, value: V) {
        let entry = Entry(key: key, value: value, next: nil)
        let bucket = abs(key.hashValue) % buckets.count
        let existing = buckets[bucket]
        if let node = existing {
            var node: Entry<K, V>? = node
            while node?.next != nil {
                if node!.key == key {
                    node!.value = value
                    return
                }
                node = node!.next
            }

            if node!.key == key {
                node!.value = value
            } else {
                node!.next = entry
                size += 1
            }

        } else {
            buckets[bucket] = entry
            size += 1
        }
    }

    func get(key: K) -> V? {
        var bucket: Entry<K, V>? = buckets[abs(key.hashValue) % buckets.count]
        while bucket != nil {
            if bucket!.key == key {
                return bucket?.value
            }
            bucket = bucket?.next
        }

        return nil
    }

    func remove(key: K) {
        let bucketIdx = abs(key.hashValue) % buckets.count
        guard let bucket = buckets[bucketIdx] else {
            return
        }

        if bucket.next == nil {
            buckets[bucketIdx] = nil
            return
        }

        var prev = bucket
        var next = bucket.next

        while next != nil {
            if next!.key == key {
                prev.next = next?.next
                return
            }
            prev = next!
            next = prev.next
        }
    }
}

class MyHashMap {
    private let hashMap: GenericHashMap<Int, Int>

    init() {
        self.hashMap = GenericHashMap(capacity: 100)
    }
    
    func put(_ key: Int, _ value: Int) {
        hashMap.put(key: key, value: value)
    }
    
    func get(_ key: Int) -> Int {
        return hashMap.get(key: key) ?? -1
    }
    
    func remove(_ key: Int) {
        hashMap.remove(key: key)

    }
}