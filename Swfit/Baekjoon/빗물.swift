// passed

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let H = input[0]
let W = input[1]
let blocks = readLine()!.split(separator: " ").compactMap{ Int($0) }

func solution() {
    var ans = 0
    
    for (i, elem) in blocks.enumerated() {
        var rightMax = 0
        var leftMax = 0
        var height = 0
        
        if i == 0  || i == W - 1 {
            continue
        }
        
        for j in 0..<i {
            leftMax = max(leftMax, blocks[j])
        }
        for j in (i + 1)..<W {
            rightMax = max(rightMax, blocks[j])
        }
        height = min(rightMax, leftMax)
        
        if elem < height {
            ans += (height - elem)
        }
    }
    
    print(ans)
}

solution()


// first code. There were some counterexamples.
let input = readLine()!.split(separator: " ").compactMap{ String($0) }
let blocks = readLine()!.split(separator: " ").compactMap{ Int($0) }

func solution() {
    var maxHeight = 0
    var maxHeightIndex = 0
    var temp = 0
    var tempMax = 0
    var ans = 0
    var tempAns = [Int]()
    
    for (i, elem) in blocks.enumerated() {
        if elem > 0 {
            maxHeight = elem
            maxHeightIndex = i
            break
        }
    }
    
    if blocks.count == 2 || maxHeight == 0 {
        print(0)
        return
    }
    
    for (i, elem) in blocks.enumerated() {
        if i == 0 || i == 1 {
            continue
        }
        
        temp = 0
        for j in (maxHeightIndex + 1)..<i {
            if maxHeight >= elem && blocks[j] < elem {
                temp += elem - blocks[j]
            }
            else if maxHeight < elem && blocks[j] < elem && maxHeight > blocks[j] {
                temp += maxHeight - blocks[j]
            }
        }
        tempMax = max(tempMax, temp)
        
        if maxHeight <= elem {
            maxHeight = elem
            maxHeightIndex = i
            tempAns.append(tempMax)
            tempMax = 0
        }
    }
    
    for i in tempAns {
        ans += i
    }
    
    print(ans + tempMax)
}

solution()
