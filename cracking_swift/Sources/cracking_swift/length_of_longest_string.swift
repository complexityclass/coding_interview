func lengthOfLongestSubstring(_ s: String) -> Int {
    var lhs = s.startIndex
    var rhs = s.startIndex
    var maxLenght = 0
    var hSet = Set<Character>()

    while rhs < s.endIndex {
        let ch = s[rhs]
        if !hSet.contains(ch) {
            hSet.insert(ch)
            rhs = s.index(after: rhs)
            maxLenght = max(hSet.count, maxLenght)
        } else {
            hSet.remove(s[lhs])
            lhs = s.index(after: lhs)
        }
    }

    return maxLenght
}