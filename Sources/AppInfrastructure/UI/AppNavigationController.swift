import UIKit

protocol AppNavigationCoordinator {
    func onDestroy()
}

open class AppNavigationController: UINavigationController {

    public var onPopController: (() -> ())?
    public var onPopToRootController: (() -> ())?
    
    @discardableResult
    open override func popViewController(animated: Bool) -> UIViewController? {
        onPopController?()
        return super.popViewController(animated: animated)
    }

    @discardableResult
    open override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        onPopToRootController?()
        return super.popToRootViewController(animated: animated)
    }
}
