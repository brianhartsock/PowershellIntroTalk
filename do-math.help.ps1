# .\do-math.ps1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

$numbers = 1..999
$count = 0

foreach($number in $numbers){
    if((($number % 3) -eq 0) -and (($number % 5) -eq 0)){
        $count += $number
    }
}


1..999 | 
    where { ($_ % 3) -eq 0 } |
    where { ($_ % 5) -eq 0 } |
    Measure-Object -sum | 
    select -expand sum
     