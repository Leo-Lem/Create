// Created by Leopold Lemmermann on 26.05.23.

import ArgumentParser
import struct Foundation.URL

struct App: CreateCommand {
  static let category = "app", configuration = CommandConfiguration(abstract: "Creates a new app.")

  @OptionGroup var location: LocationOption
  @OptionGroup var options: Options
  @OptionGroup var general: GeneralFlags

  func run() {
    create(project: location.project, repo: general.repo, open: general.open)
  }
}

extension App {
  struct Options: ParsableArguments {
    @Option(name: .shortAndLong, help: "Your organisation name. (for Bundle identifier)")
    var organisation: String

    @Option(name: [.long, .customShort("i")], help: "Your team ID. (default: select manually in Xcode)")
    var teamID: String?

    @Flag(name: [.long, .customShort("l")], inversion: .prefixedEnableDisable, help: "Use SwiftLint.")
    var swiftlint = true
  }
}
