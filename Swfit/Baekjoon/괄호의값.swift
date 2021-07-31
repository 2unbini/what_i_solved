var input = readLine()!.compactMap{ String($0) }
var stack = [String]()

func solution() {
    var i = 0
    var ans = 0
    var temp = 1
    var valid = true
    
    while i < input.count {
        let val = input[i]
        
        if val == "[" {
            stack.append(val)
            temp *= 3
        }
        else if val == "(" {
            stack.append(val)
            temp *= 2
        }
        else if stack.last != nil && stack.last! == "[" && val == "]" {
            if i > 0 && input[i - 1] == "[" {
                ans += temp
            }
            stack.removeLast()
            temp /= 3
        }
        else if stack.last != nil && stack.last! == "(" && val == ")" {
            if i > 0 && input[i - 1] == "(" {
                ans += temp
            }
            stack.removeLast()
            temp /= 2
        } else {
            valid = false
        }
        i += 1
    }
    
    if !stack.isEmpty || !valid {
        ans = 0
    }
    print(ans)
}

solution()
