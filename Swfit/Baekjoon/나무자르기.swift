let value = readLine()!.split(separator: " ").compactMap {Int(String($0))}
let trees = readLine()!.split(separator: " ").compactMap {Int(String($0))}.sorted()
let cnt = value[0]
let key = value[1]

func solution() {
    var left = 0
    var right = 2000000000
    var ret = 0
    var mid = 0
    
    while left <= right {
        mid = (left + right) / 2
        if sliceTrees(mid) {
            ret = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    print(ret)
}

func sliceTrees(_ height: Int) -> Bool {
    var ret = 0
    var i = 0
    
    while i < cnt {
        if (trees[i] > height) {
            ret += trees[i] - height
        }
        i += 1
    }
    
    if ret >= key {
        return true
    } else {
        return false
    }
}

solution()
