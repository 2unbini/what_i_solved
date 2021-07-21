import Foundation

let N = Int(readLine()!)!
let A = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()
let M = Int(readLine()!)!
let B = readLine()!.components(separatedBy: " ").map { Int($0)! }

func binarySearch(_ a: [Int], key: Int, range: Range<Int>) -> Int {
    let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2

    if range.lowerBound >= range.upperBound {
        return 0
    } else {
        if a[midIndex] == key {
            return 1
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1..<range.upperBound)
        } else {
            return binarySearch(a, key: key, range: range.lowerBound..<midIndex)
        }
    }
}

func main(_ N: Int, _ M: Int, _ A: [Int], _ B: [Int]) -> Void {
    for i in B {
        print(binarySearch(A, key: i, range: 0..<N))
    }
}

main(N, M, A, B)
