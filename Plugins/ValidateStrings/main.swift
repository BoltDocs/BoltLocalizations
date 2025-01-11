//
// MIT License
//
// Copyright (c) 2024 Bolt Contributors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation
import PackagePlugin

@main
struct ValidateStringsPlugin: BuildToolPlugin {

  func createBuildCommands(
    context: PackagePlugin.PluginContext,
    target: PackagePlugin.Target
  ) async throws -> [PackagePlugin.Command] {
    return [
      .prebuildCommand(
        displayName: "Validate .strings files",
        executable: URL(fileURLWithPath: "/usr/bin/python3"),
        arguments: [
          context.package.directoryURL.appending(path: ("./Plugins/ValidateStrings/validate-strings.py")).path(),
          context.package.directoryURL.path(),
          // context.pluginWorkDirectoryURL.appending("output.log").path(),
        ],
        outputFilesDirectory: context.pluginWorkDirectoryURL
      ),
    ]
  }

}

#if canImport(XcodeProjectPlugin)

import XcodeProjectPlugin

extension ValidateStringsPlugin: XcodeBuildToolPlugin {

  func createBuildCommands(
    context: XcodePluginContext,
    target: XcodeTarget
  ) throws -> [Command] {
    return []
  }
}

#endif
