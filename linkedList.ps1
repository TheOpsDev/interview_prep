using namespace System.Collections

class Node {
    [Int32]$Value
    [ref]$Next

    Node([Int32]$val) {
        $this.Value = $val
    }

    [void] ChangeValue([Int32]$val) {
        $this.Value = $val
    }
}

class LinkedList {
    [ref]$Head
    [Int32]$Length

    LinkedList([ref]$node) {
        $this.Head = $node
    }

    [void] Prepend([ref]$node) {
        $next = $this.Head
        $this.Head = $node
        $this.Head.Value.Next = $next
        $this.Length++
    }

    [void] PrintList() {
        Write-Host -NoNewline "Head: $($this.Head.Value.Value) --> "
        $next = $this.Head.Value.Next
        for ($i = 0; $i -lt $this.Length; $i++) {
            Write-Host -NoNewline "$($Next.Value.Value) -->"
            $next = $next.Value.Next
        }
    }

}

$n1 = [Node]::new(15)
$n2 = [Node]::new(17)
$n3 = [Node]::new(22)
$LList = [LinkedList]::new($n3)
$LList.Prepend($n2)
$LList.Prepend($n1)
$LList.PrintList()