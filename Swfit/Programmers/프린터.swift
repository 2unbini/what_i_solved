import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var updatedPriorities = priorities
    var currentIndex = location
    var printedCnt = 0
    
    while true {
        if updatedPriorities.first == updatedPriorities.max() {
            updatedPriorities.removeFirst()
            printedCnt += 1
            
            if currentIndex == 0 {
                break
            } else {
                currentIndex -= 1
            }
        } else {
            let goLast = updatedPriorities.removeFirst()
            updatedPriorities.append(goLast)
            
            if currentIndex == 0 {
                currentIndex = updatedPriorities.count - 1
            } else {
                currentIndex -= 1
            }
        }
    }
    return printedCnt
}
