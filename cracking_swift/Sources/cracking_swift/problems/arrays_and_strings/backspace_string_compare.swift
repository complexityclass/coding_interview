/*
 * Compare two strings with # backspace character
 */

func backspaceCompare(_ S: String, _ T: String) -> Bool {
    if S.isEmpty && T.isEmpty { return true }
    var skipS = 0
    var skipT = 0
    var sI: String.Index? = S.index(before: S.endIndex)
    var tI: String.Index? = T.index(before: T.endIndex)

    let dec: (String, String.Index?) -> String.Index? = { s, i in
        guard let i = i else { return nil }
        if i == s.startIndex {
            return nil
        } else {
            return s.index(before: i)
        }
    }

    while sI != nil && tI != nil {

        while sI != nil {
            if (S[sI!] == "#") { 
                skipS += 1
                sI = dec(S, sI)
            } else if skipS > 0 {
                skipS -= 1
                sI = dec(S, sI)
            } else {
                break
            }
        }

        while tI != nil { 
            if (T[tI!] == "#") { 
                skipT += 1
                tI = dec(T, tI)
            } else if skipT > 0 {
                skipT -= 1
                tI = dec(T, tI)
            } else {
                break
            }
        }

        if let sI = sI, let tI = tI, S[sI] != T[tI] {
            return false
        }
        if sI == nil {
            if !(tI == nil) { return false }
        }
        if tI == nil {
            if !(sI == nil) { return false }
        }

        print("\(sI == nil ? 0 : 1) : \(tI == nil ? 0 : 1)")

        sI = dec(S, sI)
        tI = dec(T, tI)
    }

    return true
}