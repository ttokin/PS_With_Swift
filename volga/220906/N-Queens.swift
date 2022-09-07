class Solution {
    var answer: [[String]] = []
    var map: [[Character]] = []
    var c: [Bool] = []
    var rc: [Bool] = []
    var cr: [Bool] = []
    var n = 0

    func transCharacterToString() -> [String] {
        var ret: [String] = []

        for i in 0..<n {
            var str: String = ""
            for j in 0..<n {
                str += String(map[i][j])
            }
            ret.append(str)
        }
        return ret
    }

    func recur(_ row: Int) {
        if row == n {
            answer.append(transCharacterToString())
            return
        }

        for i in 0..<n {
            let rightDown = i + row
            let leftDown = i - row + n
            if c[i] { continue }
            if cr[rightDown] { continue }
            if rc[leftDown] { continue }
            c[i] = true
            cr[rightDown] = true
            rc[leftDown] = true
            map[row][i] = "Q"
            recur(row + 1)
            map[row][i] = "."
            c[i] = false
            cr[rightDown] = false
            rc[leftDown] = false
        }
    }

    func solveNQueens(_ n: Int) -> [[String]] {
        self.n = n
        c = [Bool](repeating: false, count: n)
        rc = [Bool](repeating: false, count: n + n + 10)
        cr = [Bool](repeating: false, count: n + n + 10)
        map = [[Character]](repeating: [Character](repeating: ".", count: n), count: n)

        recur(0)

        return answer
    }
}
