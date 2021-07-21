import Foundation

func solution(_ new_id:String) -> String {
    var dotNum = 0
    var editedId = new_id.lowercased().components(separatedBy: ["~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+", "[", "{", "]", "}", ":", "?", ",", "<", ">", "/"])
    var editedArr = Array(editedId.joined())
    var cnt = editedArr.count
    var i = 0

    while i < cnt {
        if (editedArr[i] == ".") {
            dotNum += 1
            if (dotNum != 1) {
                editedArr.remove(at: i)
                cnt -= 1
                i -= 1
            }
        } else {
            dotNum = 0
        }
        i += 1
    }
    
    if (editedArr[editedArr.startIndex] == ".") {
        editedArr.removeFirst()
    } else if (editedArr[editedArr.endIndex - 1] == ".") {
        editedArr.removeLast()
    }

    if editedArr.isEmpty {
        editedArr.append("a")
    }
    
     while editedArr.count > 15 {
        editedArr.removeLast()
    }
    
    if editedArr.count > 0 && editedArr[editedArr.endIndex - 1] == "." {
        editedArr.removeLast()
    }
    
    i = editedArr.count
    if i <= 2 {
        let lastChar = editedArr[editedArr.endIndex - 1]
        while i < 3 {
            i += 1
            editedArr.append(lastChar)
        }
    }
    
    return String(editedArr)
}
