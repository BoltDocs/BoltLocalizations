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
import XCTest

@testable import BoltLocalizations

final class LocalizationsTests: XCTestCase {

  private var bundlePath = BoltLocalizations.localizationBundle.bundlePath

  private func getStringsFileList() -> [String] {
    let enumerator = FileManager.default.enumerator(atPath: bundlePath)
    return (enumerator?.map { path in
      guard let path = path as? String else {
        return nil
      }
      return path.hasSuffix("Localizable.strings") ? path : nil
    } ?? [])
    .compactMap { $0 }
  }

  func testStringsHasSameKeys() throws {
    var keysSet = Set<Set<String>>()
    for stringsFile in getStringsFileList() {
      let path = (bundlePath as NSString).appendingPathComponent(stringsFile)
      let data = try Data(contentsOf: URL(fileURLWithPath: path))

      var format = PropertyListSerialization.PropertyListFormat.binary
      let stringDict = try PropertyListSerialization.propertyList(from: data, options: [], format: &format) as! [String: AnyObject]
      keysSet.insert(Set<String>(stringDict.keys))
    }
    XCTAssertEqual(keysSet.count, 1)
  }

}
