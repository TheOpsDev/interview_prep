using namespace System.Collections

function Find-Duplicate {
    param (
        [ArrayList]
        $arr
    )
    
    begin { 
        $sList = New-Object -TypeName Hashtable
    }
    process { 
        # Copy ArrayList contents to sList {element, counter}
        foreach ($i in $arr) {
            if(!($sList.ContainsKey($i))) {
                $sList.Add($i, 0)
            }
            $sList[$i]++
        }
        $dups = $sList.Keys | Where-Object { $sList[$_] -gt 1 }
    }
    end { return $dups } 
}

[ArrayList]$arr = @(1,2,2,2,3,4,4)
Find-Duplicate -arr $arr