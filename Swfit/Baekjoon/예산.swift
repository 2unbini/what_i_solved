let N = Int(readLine()!)!
let budgetArray = readLine()!.split(separator: " ").compactMap{ Int($0) }
let wholeBudget = Int(readLine()!)!

let sortedArray = budgetArray.sorted()
var left = 0
var right = sortedArray[N - 1]
var ans = 0

while left <= right {
    let mid = (left + right) / 2
    var midBudget = 0
    
    for i in 0..<N {
        midBudget += mid > sortedArray[i] ? sortedArray[i] : mid
    }
    
    if midBudget <= wholeBudget {
        ans = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(ans)
