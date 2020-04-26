class LCSSolution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard !text1.isEmpty && !text2.isEmpty else { return 0 }

        let s1 = Array(" " + text1)
        let s2 = Array(" " + text2)
        let m = s1.count
        let n = s2.count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

        for i in 1..<n {
            for j in 1..<m {
                if s2[i] == s1[j] {
                    //match
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }

        return dp[n - 1][m - 1]
    }
}