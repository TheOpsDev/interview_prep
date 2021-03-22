# Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

# Follow up: Could you implement a solution with a linear runtime complexity and without using extra memory?

 

# Example 1:

# Input: nums = [2,2,1]
# Output: 1

# Example 2:

# Input: nums = [4,1,2,1,2]
# Output: 4

function Find-SingleNum {
    param (
        $Array
    )

    begin {
        $slist = New-Object -TypeName SortedList
    }
    
    process {
        foreach ($i in $Array) {
            if($false -eq $slist.ContainsKey($i)) {
                $slist.Add($i, 1)
                continue
            }
            $slist[$i]++
        }
    }

    end { return $sList.GetKey($slist.IndexOfValue(1)) }
}

$arr1 = @(2,2,1)
$arr1 = @(4,1,2,1,2)

Find-SingleNum -Array $arr1
Find-SingleNum -Array $arr2