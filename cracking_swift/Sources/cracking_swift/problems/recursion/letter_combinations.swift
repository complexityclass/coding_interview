// Input: "23"
// Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

func letterCombinations(_ digits: String) -> [String] {
    guard !digits.isEmpty else { return [] }
    let dict: [Int: String] = [
        2: "abc",
        3: "def",
        4: "ghi",
        5: "jkl",
        6: "mno",
        7: "pqrs",
        8: "tuv",
        9: "wxyz",
    ]

    var res: [String] = []
    func iter(_ numbers: [Int], _ combination: String) {
        guard !numbers.isEmpty else {
            res.append(combination)
            return
        }
        let chars = dict[numbers.first!]!
        for ch in chars {
            iter(Array(numbers[1...]), combination + String(ch))
        }
    }

    let d = digits.map { String($0) }.compactMap { Int($0) }
    iter(d, "")

    return res      
}