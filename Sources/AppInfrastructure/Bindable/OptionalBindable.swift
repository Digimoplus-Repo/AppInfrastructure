import Foundation

public class OptionalBindable<T> {
    private var listener: ((T?) -> Void)?

    public var value: T? {
        didSet {
            respondeToListener()
        }
    }

    public init(_ value: T? = nil) {
        self.value = value
    }

    public func bind(_ closure: @escaping (T?) -> Void) {
        listener = closure
    }

    public func bindAndApply(_ closure: @escaping (T?) -> Void) {
        bind(closure)
        respondeToListener()
    }

    private func respondeToListener() {
        DispatchQueue.main.async {
            self.listener?(self.value)
        }
    }
}
