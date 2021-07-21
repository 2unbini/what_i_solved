// memory overflow

let N = Int(readLine()!)!
let k = Int(readLine()!)!

var i = 1
var j = 1
var numArray = [Int]()

while i <= N {
    j = 1
    while j <= N {
        numArray.append(i * j)
        j += 1
    }
    i += 1
}

let sortedArray = numArray.sorted()
print(sortedArray[k])


// with binary search
// passed

let N = Int(readLine()!)!
let k = Int(readLine()!)!

var left = 1
var right = k
var ans = 0

while left <= right {
    let mid = (left + right) / 2
    var cnt = 0
    
    for i in 1...N {
        if N > mid / i {
            cnt += mid / i
        } else {
            cnt += N
        }
    }
    
    if cnt >= k {
        ans = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(ans)


// more compact version

let N = Int(readLine()!)!
let k = Int(readLine()!)!

var left = 1
var right = k
var ans = 0

while left <= right {
    let mid = (left + right) / 2
    var cnt = 0
    
    for i in 1...N {
        cnt += min(mid / i, N)
    }
    
    if cnt >= k {
        ans = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(ans)
