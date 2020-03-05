// https://leetcode.com/problems/reverse-linked-list-ii/

func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let sentinel = ListNode(0)
        sentinel.next = head
        var prev: ListNode? = sentinel
        var node: ListNode? = head
        
        var count = 1
        while count < m && node != nil {
            prev = node
            node = node!.next
            count += 1
        }
        
        let to: ListNode! = prev
        let from: ListNode? = node
        var next: ListNode?

        while count <= n && node != nil {
            next = node!.next
            node!.next = prev
            prev = node
            node = next
            count += 1
        }
        
        to.next = prev
        from?.next = node
        
        return sentinel.next   
}