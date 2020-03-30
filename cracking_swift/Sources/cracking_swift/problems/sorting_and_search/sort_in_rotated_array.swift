// (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
// You are given a target value to search. If found in the array return its index, otherwise return -1.

class SearchInRotatedArray {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] == target { return mid }
            if nums[mid] >= nums[low] {
                if target >= nums[low] && target <= nums[mid] {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            } else {
                if target <= nums[high] && target > nums[mid] {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
        }

        return -1
    }
}