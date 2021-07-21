import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var resultArray = [Int]()
    
    for eachCommand in commands {
        let i = eachCommand[0] - 1
        let j = eachCommand[1] - 1
        let k = eachCommand[2] - 1
        let arr = array[i...j].sorted()
        let result = arr[k]
        resultArray.append(result)
    }
    
    return resultArray
}
