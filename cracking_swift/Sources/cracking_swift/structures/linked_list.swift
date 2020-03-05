 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         next = nil
     }

     func toArray() -> [Int] {
         var arr: [Int] = []
         var curr: ListNode? = self
         while curr != nil {
             arr.append(curr!.val)
             curr = curr?.next
         }

         return arr
     }
 }

 extension ListNode: Equatable {
     public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
         var pl: ListNode? = lhs
         var pr: ListNode? = rhs
         while pl != nil || pr != nil {
             if pl == nil || pr == nil {
                 return false
             }
             if pl!.val != pr!.val {
                 return false
             }
             pl = pl?.next
             pr = pr?.next
         }

         return true
     }
 }

 func listOf(_ values: Int...) -> ListNode? {
     let root = ListNode(0)
     var curr: ListNode? = root
     for value in values {
         let node = ListNode(value)
         curr?.next = node
         curr = curr?.next
     }

     return root.next 
 }