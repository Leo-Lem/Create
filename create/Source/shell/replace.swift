// Created by Leopold Lemmermann on 20.05.23.

import struct Foundation.URL

extension Shell {
  static func replace(_ match: String, in dir: URL, with replacement: String) throws {
    try replaceNames(match, in: dir, with: replacement)
    try replaceInFiles(match, in: dir, with: replacement)
  }

  static func replaceNames(_ match: String, in dir: URL, with replacement: String) throws {
    try run(
      "cd \(dir.path())",
      "find . -depth -execdir bash -c 'mv \"$0\" \"${0/\(match)/\(replacement)}\"' {} \\;"
    )
  }

  static func replaceInFiles(_ match: String, in dir: URL, with replacement: String) throws {
    let sanitized = replacement
      .replacing("\n", with: "\\\n")
      .replacing("/", with: "\\/")

    try run(
      "cd \(dir.path())",
      "find . -type f -exec sed -i '' 's/\(match)/\(sanitized)/g' {} +"
    )
  }
}
