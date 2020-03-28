// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 0 -> 8

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard l1 != nil || l2 != nil else {
        return nil
    }
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }

    let head = ListNode(-1)
    let listSize: (ListNode?) -> Int = {
        var node = $0
        var count = 0
        while node != nil {
            count += 1
            node = node?.next
        }
        return count
    }

    let diff = listSize(l1) - listSize(l2)
    let minL = diff >= 0 ? l2 : l1
    var curr: ListNode? = minL
    while curr?.next != nil { curr = curr?.next } 
    for _ in 0...abs(diff) {
        let node = ListNode(0)
        curr?.next = node
        curr = curr?.next
    }

    var rem = 0
    var p1 = l1
    var p2 = l2
    var c: ListNode? = head
    while p1 != nil && p2 != nil {
        let sum = p1!.val + p2!.val + rem
        let val: Int
        if sum > 9 {
            val = sum % 10
            rem = 1
        } else {
            val = sum
            rem = 0
        }

        let node = ListNode(val)
        c?.next = node
        c = c?.next

        p1 = p1?.next
        p2 = p2?.next
    }

    if rem != 0 {
        c?.next = ListNode(1) 
    }

    return head.next        
}