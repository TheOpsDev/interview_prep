using namespace System.Collections

function Get-Median {
    param (
        [ArrayList]
        $arr1,
        [ArrayList]
        $arr2
    )

    begin { $median = $null }
    
    process {
        [SortedList]$combined = New-Object -TypeName SortedList
        foreach ($i in ($arr1 + $arr2)) {
            $combined.Add($i, $i)
        }
        if ($combined.Count % 2 -eq 0) {
            $mid1 = $combined.Count / 2 - 1
            $mid2 = $combined.Count / 2 
            $median = ( $combined.GetByIndex($mid1) + $combined.GetByIndex($mid2) ) / 2
        }
    }

    end { return $median }
}

[ArrayList]$arr1 = @(1,3,5)
[ArrayList]$arr2 = @(2,4,6)

Get-Median -arr1 $arr1 -arr2 $arr2