import Foundation
import UIKit

open class AppViewController: CardViewController {
    open override var defaultBackground: UIColor { .systemBackground }
    private var viewModel: AppViewModel

    public init(_ viewModel: AppViewModel) {
        self.viewModel = viewModel
        super.init()
        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.showLoader.bind { value in
            print("Loader \(value ? "Start" : "Stop")")
        }

        viewModel.successAlert.bind { value in
            print("Success Alert: \(value ?? "")")
        }

        viewModel.errorAlert.bind { value in
            print("Error Alert: \(value ?? "")")
        }
    }

    // MARK: - Pull to refresh control
    public func addPullToRefresh(_ refreshing: @escaping () -> ()) {
        collectionView.refreshControl = nil
        collectionView.refreshControl = AppRefreshControl(startRefreshing: refreshing)
    }

    public func endRefreshing() {
        collectionView.refreshControl?.endRefreshing()
    }
}
