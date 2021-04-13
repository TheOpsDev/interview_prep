# Given an array, rotate the array to the right by k steps, where k is non-negative.

# Follow up:

# Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
# Could you do it in-place with O(1) extra space?

# Input: nums = [1,2,3,4,5,6,7], k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

using namespace System.Collections

function Rotate-Array {
    param (
        $Array, 
        $Rotations
    )

    begin {
        [ArrayList]$tmpArr += $Array
        $rotate = $true
        $count = 1
    }
    process {
        do {    
            if ($count -eq $Rotations) {
                $rotate = $false
            }
            
            $tmp = $tmpArr[$tmpArr.Count - 1]
            $tmpArr.Insert(0, $tmp)
            $tmpArr.RemoveAt($tmpArr.Count - 1)

            $count++
        } while ($rotate)
    }
    end { return $tmpArr }
}


$arr1 = @(1,2,3,4,5,6,7)
$k1 = 3
$arr2 = @(-1,-100,3,99)
$k2 = 2