import UIKit

extension UIColor {
    static var background: UIColor {
        return .systemBackground
    }
    
    static var lightContent: UIColor {
        return colorWithName(named: "lightContent")
    }
    
    static var darkContent: UIColor {
        return colorWithName(named: "darkContent")
    }
    
    static var error: UIColor {
        return .red
    }
    
    static var styleWhite: UIColor {
        return .white
    }
    
    private static func colorWithName(named: String) -> UIColor {
        UIColor(named: named) ?? .darkText
    }
}
