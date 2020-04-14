class FirstAndLast {
    func searchRange(in arr: [Int], target: Int) -> ClosedRange<Int>? {
        guard !arr.isEmpty else { return nil }
        guard let fst = binarySearch(arr: arr, target: target, findFirst: true) else { return nil }
        guard let snd = binarySearch(arr: arr, target: target, findFirst: false) else { return nil }
        return fst...snd
    }

    private func binarySearch(arr: [Int], target: Int, findFirst: Bool) -> Int? {
        guard !arr.isEmpty else { return nil }
        var low = 0
        var high = arr.count - 1

        while low <= high {
            let mid = low + (high - low) / 2
            if findFirst {
                if (mid == 0 || arr[mid - 1] < target) && arr[mid] == target {
                    return arr[mid] == target ? mid : nil
                } else if target > arr[mid] {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            } else {
                if (mid == arr.count - 1 || arr[mid + 1] > target) && arr[mid] == target {
                    return arr[mid] == target ? mid : nil
                } else if target < arr[mid] {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
        }

        return nil
    }

    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard let range = searchRange(in: nums, target: target) else {
            return [-1, -1]
        }
        return [range.lowerBound, range.upperBound]
    }
}