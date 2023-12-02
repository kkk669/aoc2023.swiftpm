struct Day02: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    func part1() -> Any {
        data.split(separator: "\n").lazy
            .enumerated()
            .filter { _, line in
                let reds = line.matches(of: /(?<num>\d+) red/)
                let greens = line.matches(of: /(?<num>\d+) green/)
                let blues = line.matches(of: /(?<num>\d+) blue/)
                guard
                    reds.allSatisfy({ Int($0.num)! <= 12 }),
                    greens.allSatisfy({ Int($0.num)! <= 13 }),
                    blues.allSatisfy({ Int($0.num)! <= 14 })
                else { return false }
                return true
            }
            .reduce(0) { lhs, rhs in lhs + rhs.offset + 1 }
    }

    func part2() -> Any {
        data.split(separator: "\n").lazy
            .map { line in
                let reds = line.matches(of: /(?<num>\d+) red/)
                let greens = line.matches(of: /(?<num>\d+) green/)
                let blues = line.matches(of: /(?<num>\d+) blue/)
                let requiredRed = reds.map { Int($0.num)! }.max() ?? 0
                let requiredBlue = greens.map { Int($0.num)! }.max() ?? 0
                let requiredGreen = blues.map { Int($0.num)! }.max() ?? 0
                return requiredRed * requiredBlue * requiredGreen
            }
            .reduce(0, +)
    }

    static let testData = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """

    func testPart1() -> Bool {
        let challenge = Self(data: Self.testData)
        return String(describing: challenge.part1()) == "8"
    }

    func testPart2() -> Bool {
        let challenge = Self(data: Self.testData)
        return String(describing: challenge.part2()) == "2286"
    }
}
