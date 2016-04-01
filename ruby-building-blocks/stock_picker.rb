def stock_picker(prices)
  max_profit = 0
  buy = 0
  sell = 0
  prices.each_index do |x|
    y = x + 1
    while y < prices.size
      profit = prices[y] - prices[x]
      if profit > max_profit
        max_profit = profit
        buy = x
        sell = y
      end
      y += 1
    end
  end
  puts "[#{buy},#{sell}]"
end
stock_picker([17,3,6,9,15,8,6,1,10])