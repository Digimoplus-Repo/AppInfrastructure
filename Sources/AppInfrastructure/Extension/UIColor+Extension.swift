import UIKit

extension UIColor {
    static var background: UIColor {
        return .systemBackground
    }

    public static func colorWithName(named: String) -> UIColor {
        UIColor(named: named) ?? .darkText
    }
}
