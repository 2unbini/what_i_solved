func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var orOperatedArray = [[String]]()
    
    for i in 0...(n - 1) {
        var temp = String(arr1[i] | arr2[i], radix: 2)
        var j = temp.count
        while (j < n) {
            temp = "0" + temp
            j += 1
        }
        orOperatedArray.append(temp.map{String($0)})
    }
    
    for arr in orOperatedArray {
        var result: String = ""
        for i in 0...(n - 1) {
            if (arr[i] == "1") {
                result += "#"
            } else if (arr[i] == "0") {
                result += " "
            }
        }
        answer.append(result)
    }
    
    return answer
}
