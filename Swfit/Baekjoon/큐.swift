var loopCount = Int(readLine()!)!
var queue = [String]()

while loopCount != 0 {
    let loopCommand = readLine()!.split(separator: " ").compactMap { String($0) }

    switch loopCommand[0] {
    case "push":
        queue.append(loopCommand[1])
    case "pop":
        queue.isEmpty == true ? print(-1) : print(queue.removeFirst())
    case "size":
        print(queue.count)
    case "empty":
        queue.isEmpty == true ? print(1) : print(0)
    case "front":
        queue.isEmpty == true ? print(-1) : print(queue[0])
    case "back":
        queue.isEmpty == true ? print(-1) : print(queue[queue.count - 1])
    default:
        break
    }
    
    loopCount -= 1
}
