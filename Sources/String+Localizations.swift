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

public extension String {

  var boltLocalized: String {
    return NSLocalizedString(self, bundle: Bundle.module, comment: "")
  }

  var boltLocalizedStringResource: LocalizedStringResource {
    #if swift(>=6.2)
    return LocalizedStringResource(
      LocalizationValue(self),
      bundle: Bundle.module
    )
    #else
    return LocalizedStringResource(
      LocalizationValue(self),
      bundle: .atURL(Bundle.module.bundleURL)
    )
    #endif
  }

  func boltLocalized(_ arguments: any CVarArg...) -> String {
    let format = boltLocalized
    return Self.localizedStringWithFormat(format, arguments)
  }

}

public class BoltLocalizations {

  package static let localizationBundle = Bundle.module

  public static let confirm = "Localizations-General-confirm".boltLocalized
  public static let getInfo = "Localizations-General-getInfo".boltLocalized

}
