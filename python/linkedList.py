class SinglyLinkedListNode:
    def __init__(self, data):
        self.data = data
        self.next = None
        
    def printData(self):
        print(self.data)

        
class SinglyLinkedList:
    def __init__(self, data):
        self.head = SinglyLinkedListNode(data)
    
    def printLinkedList(self):
        curr = self.head
        while curr is not None:
            print("{} --> ".format(curr.data), end='', flush=True)
            curr = curr.next

if __name__ == '__main__':
    
    llist1 = SinglyLinkedList(12)
    node1 = SinglyLinkedListNode(15)
    node2 = SinglyLinkedListNode(11)
    node1.next = node2
    llist1.head.next = node1
    llist1.printLinkedList()
    