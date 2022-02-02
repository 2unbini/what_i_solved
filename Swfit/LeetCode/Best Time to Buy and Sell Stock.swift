class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var buy = prices[0]
        var profit = Int(-1 * pow(10, 4))
        
        for price in prices {
            buy = min(buy, price)
            profit = max(profit, price - buy)
        }
        
        return profit
    }
}
