public protocol AppViewModel {
    var showLoader: Bindable<Bool> { get }
    var successAlert: OptionalBindable<String> { get }
    var errorAlert: OptionalBindable<String> { get }
}

public extension AppViewModel {
    var showLoader: Bindable<Bool> { .init(false) }
    var successAlert: OptionalBindable<String> { .init(nil) }
    var errorAlert: OptionalBindable<String> { .init(nil) }
}
