// swift-tools-version:6.0
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

// swiftlint:disable prefixed_toplevel_constant

import PackageDescription

let package = Package(
  name: "BoltLocalizations",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v17),
    .macCatalyst(.v18),
  ],
  products: [
    .library(
      name: "BoltLocalizations",
      targets: ["BoltLocalizations"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "BoltLocalizations",
      dependencies: [],
      path: "./Sources",
      resources: [
        .process("./Localizations"),
      ],
      swiftSettings: [
        .swiftLanguageMode(.v5)
      ],
    ),
    .testTarget(
      name: "BoltLocalizationsTests",
      dependencies: ["BoltLocalizations"],
      path: "./Tests",
      swiftSettings: [
        .swiftLanguageMode(.v5)
      ]
    ),
  ]
)

// swiftlint:enable prefixed_toplevel_constant
