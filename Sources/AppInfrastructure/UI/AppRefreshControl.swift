import UIKit

open class AppRefreshControl: UIRefreshControl {
    private var startRefreshing: () -> ()
    
    init(startRefreshing: @escaping () -> ()) {
        self.startRefreshing = startRefreshing
        super.init()
        addTarget(self, action: #selector(startPullToRefresh), for: .valueChanged)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func startPullToRefresh() {
        startRefreshing()
    }
}
