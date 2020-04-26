func printMatrix(_ mtx: [[Int]]) {
    for i in 0..<mtx.count {
        var res = ""
        for j in 0..<mtx[0].count {
            res += " \(mtx[i][j])"
        }
        print(res)       
    }
}