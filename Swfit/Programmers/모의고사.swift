import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let firstSp = [1, 2, 3, 4, 5]
    let secondSp = [2, 1, 2, 3, 2, 4, 2, 5]
    let thirdSp = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var spGradeArr = [0, 0, 0]
    
    for (i, elem) in answers.enumerated() {
        if elem == firstSp[i % 5] {
            spGradeArr[0] += 1
        }
        if elem == secondSp[i % 8] {
            spGradeArr[1] += 1
        }
        if elem == thirdSp[i % 10] {
            spGradeArr[2] += 1
        }
    }
    
    var maxSpArr = [Int]()
    
    if spGradeArr[0] >= spGradeArr[1] && spGradeArr[0] >= spGradeArr[2] {
        if spGradeArr[0] == spGradeArr[1] && spGradeArr[0] == spGradeArr[2] {
            maxSpArr += [1, 2, 3]
        } else if spGradeArr[0] == spGradeArr[2] {
            maxSpArr += [1, 3]
        } else if spGradeArr[0] == spGradeArr[1] {
            maxSpArr += [1, 2]
        } else {
            maxSpArr += [1]
        }
    } else if spGradeArr[1] >= spGradeArr[2] {
        if spGradeArr[1] == spGradeArr[2] {
            maxSpArr += [2, 3]
        } else {
            maxSpArr += [2]
        }
    } else {
        maxSpArr += [3]
    }
    
    return maxSpArr
}
