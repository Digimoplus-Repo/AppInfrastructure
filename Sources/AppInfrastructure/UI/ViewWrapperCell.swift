import UIKit

public protocol NibView: UIView {
    static func fromNib() -> Self
}

open class ViewWrapperCell<T: UIView>: UICollectionViewCell {
    public var view: T!

    override init(frame: CGRect) {
        super.init(frame: frame)
        if let nibType = T.self as? NibView.Type {
            self.view = nibType.fromNib() as? T
        } else {
            self.view = T(frame: frame)
        }
        contentView.addSubview(view)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        view.pin(to: contentView)
    }
}
