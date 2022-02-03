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

#if canImport(UIKit)
import UIKit

public class UIKitLocalization {

  private static let UIKitBundle = Bundle(for: UIButton.self)

  public static func localizedString(_ string: String) -> String {
    return UIKitBundle.localizedString(forKey: string, value: nil, table: nil)
  }

  public static let done = "Done".UIKitLocalized
  public static let edit = "Edit".UIKitLocalized
  public static let cancel = "Cancel".UIKitLocalized
  public static let search = "Search".UIKitLocalized

}

public extension String {

  var UIKitLocalized: String {
    return UIKitLocalization.localizedString(self)
  }

}
#endif
