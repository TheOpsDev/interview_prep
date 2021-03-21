# You are given an array prices where prices[i] is the price of a given stock on the ith day.

# You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

# Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

using namespace System.Collections
function Get-MaxProfit {
    param (
        [Object[]]
        $Prices
    )

    begin {
        $profit = 0
    }

    process {
        for ($i = 0; $i -lt $Prices.Count; $i++) {
            $diff = $Prices[$i+1] - $Prices[$i]
            
            if ($diff -le 0) {
                Continue
            }
            $profit += $diff
        }
    }

    end { return $profit }
}

$p1 = @(7,1,5,3,6,4)
$p2 = @(1,2,3,4,5)
$p3 = @(7,6,4,3,1)

Get-MaxProfit -Prices $p1
Get-MaxProfit -Prices $p2
Get-MaxProfit -Prices $p3