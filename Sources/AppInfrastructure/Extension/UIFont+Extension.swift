import UIKit

public protocol FontStyle {
    var size: CGFloat { get }
    var weight: UIFont.Weight { get }
    var name: String? { get }
}

extension UIFont {
    private static func systemFontWithStyle(_ style: FontStyle) -> UIFont {
        .systemFont(
            ofSize: style.size,
            weight: style.weight
        )
    }

    static public func withStyle(_ style: FontStyle) -> UIFont {
        if let name = style.name, let font = UIFont(name: name, size: style.size) {
            return font
        }
        return systemFontWithStyle(style)
    }

    static public func withSize(_ size: CGFloat, weight: UIFont.Weight) -> UIFont {
        .systemFont(
            ofSize: size,
            weight: weight
        )
    }
}
