import UIKit

extension UIView {
    var displayHeight: CGFloat {
        let padding = safeAreaInsets.top + safeAreaInsets.bottom
        return frame.height - padding
    }
}

open class CardViewController: UIViewController {
    private var collectionView: UICollectionView
    private var viewModel: AppViewModel

    var cards: [Card] = [] {
        didSet {
            sections = [cards]
        }
    }

    var sections: [[Card]] = [] {
        didSet {
            var uniqueCards = [Card]()
            sections.forEach { cards in
                cards.forEach { card in
                    if uniqueCards.filter({ $0.cellType.self == card.cellType.self }).count == 0 {
                        uniqueCards.append(card)
                    }
                }
            }
            uniqueCards.forEach { card in
                collectionView.register(card.cellType.self, forCellWithReuseIdentifier: card.cellType.identifier())
            }
            collectionView.reloadData()
            DispatchQueue.main.async {
                self.collectionView.isScrollEnabled = self.collectionView.contentSize.height >= self.view.displayHeight
            }
        }
    }

    public init(_ viewModel: AppViewModel) {
        self.viewModel = viewModel
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: collectionViewFlowLayout)
        super.init(nibName: nil, bundle: nil)

        initializeUI()
        bindViewModel()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

    private func initializeUI() {
        view.backgroundColor = .background
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.clipsToBounds = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.pin(to: view)
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard previousTraitCollection != nil else { return }
        collectionView.collectionViewLayout.invalidateLayout()
    }

    deinit {
        print("👉 Deinit \(type(of: self))")
    }
}

extension CardViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section][indexPath.item].cellFor(collectionView, indexPath: indexPath)
    }
}

