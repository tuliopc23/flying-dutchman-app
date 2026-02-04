import Foundation

enum CLIOutput {
    static func section(_ title: String) {
        print("\n\(title.uppercased())")
        print(String(repeating: "-", count: max(8, title.count)))
    }

    static func line(_ key: String, _ value: String) {
        print("• \(key): \(value)")
    }

    static func warn(_ key: String, _ value: String) {
        fputs("[warn] \(key): \(value)\n", stderr)
    }

    static func hint(_ text: String) {
        print("Hint: \(text)")
    }

    static func table(headers: [String], rows: [[String]]) {
        let columnWidths: [Int] = headers.indices.map { idx in
            let widestRow = rows.map { row -> Int in
                guard row.indices.contains(idx) else { return 0 }
                return row[idx].count
            }.max() ?? 0
            return max(headers[idx].count, widestRow)
        }

        let headerRow = headers.enumerated().map { idx, title in
            padded(title, to: columnWidths[idx])
        }.joined(separator: "   ")
        print(headerRow)
        print(String(repeating: "-", count: headerRow.count))

        for row in rows {
            let line = row.enumerated().map { idx, value in
                padded(value, to: columnWidths[idx])
            }.joined(separator: "   ")
            print(line)
        }
    }

    private static func padded(_ value: String, to width: Int) -> String {
        guard value.count < width else { return value }
        return value + String(repeating: " ", count: width - value.count)
    }

    static func json<T: Encodable>(_ value: T) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        if let data = try? encoder.encode(value), let string = String(data: data, encoding: .utf8) {
            print(string)
        } else {
            warn("json", "Failed to encode JSON output")
        }
    }
}
