var loopCount = Int(readLine()!)!

while loopCount != 0 {
    let value = readLine()!.split(separator: " ").compactMap{ String($0) }
    var priorityArray = readLine()!.split(separator: " ").compactMap { String($0) }
    var index = Int(value[1])!
    var printedCount = 0
    
    while true {
        if priorityArray.first == priorityArray.max() {
            priorityArray.removeFirst()
            printedCount += 1
            if (index == 0) {
                break
            }
            index -= 1
        } else {
            let temp = priorityArray.removeFirst()
            priorityArray.append(temp)
            if (index == 0) {
                index = priorityArray.count - 1
            } else {
                index -= 1
            }
        }
    }
    print(printedCount)
    loopCount -= 1
}
