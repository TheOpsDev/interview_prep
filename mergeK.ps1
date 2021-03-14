using namespace System.Collections

function Merge-Arrays {
    param (
        [ArrayList]
        $kayArr
    )

    begin {
        [ArrayList]$combined = @()
    }

    process {
        foreach ($i in $kayArr) {
            foreach ($j in $i) {
                $combined += $j
            }
        }
        $combined.Sort()
    }

    end { return $combined }
}

$testArr = @(
    @(1,2,3),
    @(16,17,18),
    @(3,4,5)
)

Merge-Arrays -kayArr $testArr