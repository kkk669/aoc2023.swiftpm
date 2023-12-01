struct Day01: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    func part1() -> Any {
        data.split(separator: "\n").lazy
            .map { $0.compactMap(\.wholeNumberValue) }
            .map { $0.first! * 10 + $0.last! }
            .reduce(0, +)
    }

    func part2() -> Any {
        data.split(separator: "\n").lazy
            .map { line in
                var first = 0
                loop: for i in line.indices {
                    if let n = line[i].wholeNumberValue {
                        first = n
                        break
                    } else {
                        switch line[i] {
                        case "o":
                            if line[i...].starts(with: "one") {
                                first = 1
                                break loop
                            }
                        case "t":
                            if line[i...].starts(with: "two") {
                                first = 2
                                break loop
                            } else if line[i...].starts(with: "three") {
                                first = 3
                                break loop
                            }
                        case "f":
                            if line[i...].starts(with: "four") {
                                first = 4
                                break loop
                            } else if line[i...].starts(with: "five") {
                                first = 5
                                break loop
                            }
                        case "s":
                            if line[i...].starts(with: "six") {
                                first = 6
                                break loop
                            } else if line[i...].starts(with: "seven") {
                                first = 7
                                break loop
                            }
                        case "e":
                            if line[i...].starts(with: "eight") {
                                first = 8
                                break loop
                            }
                        case "n":
                            if line[i...].starts(with: "nine") {
                                first = 9
                                break loop
                            }
                        case _: break
                        }
                    }
                }

                var last = 0
                loop: for i in line.indices.reversed() {
                    if let n = line[i].wholeNumberValue {
                        last = n
                        break
                    } else {
                        switch line[i] {
                        case "o":
                            if line[i...].starts(with: "one") {
                                last = 1
                                break loop
                            }
                        case "t":
                            if line[i...].starts(with: "two") {
                                last = 2
                                break loop
                            } else if line[i...].starts(with: "three") {
                                last = 3
                                break loop
                            }
                        case "f":
                            if line[i...].starts(with: "four") {
                                last = 4
                                break loop
                            } else if line[i...].starts(with: "five") {
                                last = 5
                                break loop
                            }
                        case "s":
                            if line[i...].starts(with: "six") {
                                last = 6
                                break loop
                            } else if line[i...].starts(with: "seven") {
                                last = 7
                                break loop
                            }
                        case "e":
                            if line[i...].starts(with: "eight") {
                                last = 8
                                break loop
                            }
                        case "n":
                            if line[i...].starts(with: "nine") {
                                last = 9
                                break loop
                            }
                        case _: break
                        }
                    }
                }
                return first * 10 + last
            }
            .reduce(0, +)
    }
}
