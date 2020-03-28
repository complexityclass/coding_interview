func myAtoi(_ str: String) -> Int {
    var res = 0
    var digitsOnly = false
    var sign = 1

    for char in str {
        switch char {
        case " ":
            if digitsOnly {
                return res
            } else {
                continue 
            }
        case "+":
            fallthrough
        case "-":
            if digitsOnly {
                return res
            } else {
                digitsOnly = true
                sign = char == "+" ? 1 : -1
            }
        case "0"..."9":
            res = (res * 10 + Int(String(char))! * sign)
            digitsOnly = true
            if res > Int32.max {
                return Int(Int32.max)
            } else if res < Int32.min {
                return Int(Int32.min)
            }
        default:
            return res
        }
    }

    return res
}