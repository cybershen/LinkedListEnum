import Foundation

enum LinkedListNode<T> {
    case empty
    indirect case node(value: T, next: LinkedListNode<T>)
    
    mutating func append(_ newValue: T) {
        guard case .node(let value, var next) = self else {
            self = .node(value: newValue, next: .empty)
            return
        }
        
        next.append(newValue)
        self = .node(value: value, next: next)
    }
    
    init() {
        self = .empty
    }
}

extension LinkedListNode: CustomStringConvertible {
    var description: String {
        var desc = ""
        var node: LinkedListNode<T> = self
        
        while case let .node(value, next) = node {
            desc += "\(value) -> "
            node = next
        }
        
        return desc
    }
}

var linkedList = LinkedListNode<String>()

linkedList.append("NSObject")
linkedList.append("UIResponder")
linkedList.append("UIViewController")
linkedList.append("UISplitViewController")

linkedList.description

//NSObject -> UIResponder -> UIViewController -> UISplitViewController



