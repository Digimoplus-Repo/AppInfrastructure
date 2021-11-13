import UIKit

extension UIFont {
    enum Style {
        case title
        case titleBold
        case subTitle
        case subTitleBold

        var size: CGFloat {
            switch self {
            case .subTitle:
                return 12
            case .subTitleBold:
                return 12
            case .title:
                return 16
            case .titleBold:
                return 16
            }
        }

        var weight: UIFont.Weight {
            switch self {
            case .title:
                return .regular
            case .titleBold:
                return .bold
            case .subTitle:
                return .regular
            case .subTitleBold:
                return .bold
            }
        }
    }

    static func withStyle(_ style: Style) -> UIFont {
        .systemFont(
            ofSize: style.size,
            weight: style.weight
        )
    }

    static func withSize(_ size: CGFloat, weight: UIFont.Weight) -> UIFont {
        .systemFont(
            ofSize: size,
            weight: weight
        )
    }
}
