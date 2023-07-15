import SwiftUI
import UIKit

public extension View {
    @ViewBuilder
    func addShadowToTop(radius: CGFloat = 5) -> some View {
        background(Color.white.shadow(color: Color.black, radius: radius, x: 0, y: 0))
    }
}


// MARK: - Conditional View Modifier
public extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

// MARK: - UIKit Related
public extension View {
    func getVC() -> UIViewController {
        return UIHostingController(rootView: self)
    }
}

public extension View {
    @ViewBuilder
    func ToolbarButton(title: String, _ action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            Text(title)
        }
    }
    
    @ViewBuilder
    func CircleShape(color: Color = .blue, size: CGFloat = 30) -> some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
    }
}
