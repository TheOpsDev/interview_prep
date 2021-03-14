using namespace System.Collections

function Get-Median {
    param (
        [ArrayList]
        $arr1,
        [ArrayList]
        $arr2
    )

    begin { 
        $median = $null 
        $counter = 0
        [ArrayList]$combined = $arr1 + $arr2
        $combined.Sort()
    }
    
    process {
        if ($combined.Count % 2 -eq 0) {
            $mid1 = $combined.Count / 2 - 1
            $mid2 = $combined.Count / 2
            $median = ( $combined[$mid1] + $combined[$mid2] ) / 2
        } else {
            $median = $combined[( $combined.Count + 1 ) / 2]
        }
    }

    end { return $median }
}

[ArrayList]$arr1 = @(1,3,5)
[ArrayList]$arr2 = @(2,4)

Get-Median -arr1 $arr1 -arr2 $arr2