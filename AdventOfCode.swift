import SwiftUI

// Add each new day implementation to this array:
let allChallenges: [any AdventDay] = [
    Day00(),
    Day01(),
    Day02(),
]

@main
struct AdventOfCode: App {
    /// The day of the challenge. For December 1st, use '1'.
    var day: Int?

    /// Benchmark the time taken by the solution.
    var benchmark: Bool = false

    /// The selected day, or the latest day if no selection is provided.
    var selectedChallenge: any AdventDay {
        guard let day else {
            return latestChallenge
        }
        guard let challenge = allChallenges.first(where: { $0.day == day }) else {
            fatalError("No solution found for day \(day)")
        }
        return challenge
    }

    /// The latest challenge in `allChallenges`.
    var latestChallenge: any AdventDay {
        allChallenges.max(by: { $0.day < $1.day })!
    }

    func run(part: () async throws -> Any, named: String) async -> Duration {
        var result: Result<Any, Error> = .success("<unsolved>")
        let timing = await ContinuousClock()
            .measure {
                do {
                    result = .success(try await part())
                } catch {
                    result = .failure(error)
                }
            }
        switch result {
        case .success(let success):
            print("\(named): \(success)")
        case .failure(let failure):
            print("\(named): Failed with error: \(failure)")
        }
        return timing
    }

    func test(part: () async throws -> Bool, named: String) async {
        do {
            if try await part() {
                print("\(named): test passed")
            } else {
                print("\(named): test failed")
            }
        } catch {
            print("\(named): Failed with error: \(error)")
        }
    }

    func run() async {
        let challenge = selectedChallenge
        print("Executing Advent of Code challenge \(challenge.day)...")

        await test(part: challenge.testPart1, named: "Part 1")
        let timing1 = await run(part: challenge.part1, named: "Part 1")
        await test(part: challenge.testPart2, named: "Part 2")
        let timing2 = await run(part: challenge.part2, named: "Part 2")

        if benchmark {
            print("Part 1 took \(timing1), part 2 took \(timing2).")
            #if DEBUG
                print("Looks like you're benchmarking debug code. Try swift run -c release")
            #endif
        }
    }

    var body: some Scene {
        WindowGroup {
            Button("Run") {
                Task { await run() }
            }
        }
    }
}
