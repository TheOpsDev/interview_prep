# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.

class Node {
    [Int32]$Key
    [Node]$Next

    Node() {
        $this.Key = $null
        $this.Next = $null
    }

    Node ([Int32]$Key) {
        $this.Key = $Key
        $this.Next = $null
    }

    [void] AddNext([Node]$NextNode) {
        $this.Next = $NextNode
    }
}

class LinkedList {
    [Node]$Head
    [Int32]$Length = 0

    LinkedList() {
        $this.Head = [Node]::new()
    }

    LinkedList($Node) {
        $this.Head = $Node
        $this.Length++
    }

    [void] Prepend([Node]$Node) {
        if ($null -eq $this.Head) {
            $this.Head = $Node
        }
        $tmp = $this.Head
        $this.head = $Node
        $this.Head.Next = $tmp
        $this.Length++
    }

    [void] Reverse() {
        $prev = $null
        $next = $null
        $curr = $this.Head

        do {
            $next = $curr.Next
            $curr.Next = $prev
            $prev = $curr
            $curr = $next
        } while ($null -ne $curr)
        $this.Head = $prev
    }

    [void] PrintList() {
        $curr = $this.Head
        
        do {
            Write-Host -NoNewline "$($curr.Key) -->  "
            $curr = $curr.Next
        } while ($null -ne $curr)
        Write-Host ""
    }

    [String] ToString() {
        $llStr = ""
        $curr = $this.Head
        for ($i = 0; $i -lt $this.Length; $i++) {
            $next = $curr.Next
            $llStr += $curr.Key
            $curr = $next
        }
        return $llStr
    }
}


$n1 = [Node]::new(2)
$n2 = [Node]::new(4)
$n3 = [Node]::new(3)
$ll1 = [LinkedList]::new($n3)
$ll1.Prepend($n2)
$ll1.Prepend($n1)

$n4 = [Node]::new(5)
$n5 = [Node]::new(6)
$n6 = [Node]::new(4)
$ll2 = [LinkedList]::new($n6)
$ll2.Prepend($n5)
$ll2.Prepend($n4)

$ll1.Reverse()
$num1 = $ll1.ToString()

$ll2.Reverse()
$num2 = $ll2.ToString()

[Int32]$num1 + [Int32]$num2

