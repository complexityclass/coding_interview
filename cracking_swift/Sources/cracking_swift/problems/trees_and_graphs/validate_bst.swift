
func isValidBST(_ root: TreeNode?) -> Bool {
    func iter(_ node: TreeNode?, low: Int?, high: Int?) -> Bool {
        guard let node = node else { return true }
        if let low = low, node.val <= low { return false }
        if let high = high, node.val >= high { return false }
        if !iter(node.right, low: node.val, high: high) { return false }
        if !iter(node.left, low: low, high: node.val) { return false }
        return true
    }
    return iter(root, low: nil, high: nil)   
}