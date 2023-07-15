import Foundation

public func DelayedMainThread(second: Double = 5, _ action: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + second) {
        action()
    }
}

public func BackgroundThread(qos: DispatchQoS.QoSClass = .userInitiated, _ action: @escaping () -> ()) {
    DispatchQueue.global(qos: qos).async {
        action()
    }
}

public func MainThread(_ action: @escaping () -> ()) {
    DispatchQueue.main.async(execute: action)
}
