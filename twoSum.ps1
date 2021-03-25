# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

 

# Example 1:

# Input: nums = [2,11,15,7], target = 9
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]

using namespace System.Collections


function Get-TwoSum {
    param (
        $Array, 
        $Target
    )

    begin {
        [ArrayList]$answer = @()
    }

    process {
        for ($i = 0; $i -lt $Array.Count; $i++) {
            for($j = $i+1; $j -lt $Array.Count; $j++) {
                if (($Array[$i] + $Array[$j]) -eq $Target) {
                    $answer += @($Array[$i], $Array[$j])
                    return $answer
                }
            }
        }
    }
}

$n1 = 2,11,15,7
$t1 = 9

$n2 = 3,2,4
$t2 = 6

Get-TwoSum -Array $n1 -Target $t1
Get-TwoSum -Array $n2 -Target $t2