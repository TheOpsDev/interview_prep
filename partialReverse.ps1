# Given a list, write a function "partial_reverse(a, i, j)"
# That will reverse the items in the array "a" starting @ i and ending @ j
# for example given the array equal to A,B,C,D,E,F:
# a = [A,B,C,D,E,F]
# partial_reverse(a, 2, 4)
# result: [A,B,E,D,C,F]

using namespace System.Collections
function partial-reverse {
    param (
        $Array,
        $Start,
        $End
    )

    process {
        $size = $End - $Start
        for ($i = $size; $i -gt 0; $i--) {
            $Array[($i - $Start)] = $Array[$size - $i]
        }
        return $Array
    }
}

$a = @('A','B','E','D','C','F')
partial-reverse -Array $a -Start 2 -End 4