
import AppKit.NSMenuItem

internal final class Item: NSMenuItem {

    private var _action: (() -> Void)?

    @objc private func performAction() {
        _action?()
    }

    internal static func item(parameters: [Parameter]) -> NSMenuItem {
        let item = Item()

        parameters.forEach { parameter in
            switch parameter {
            case .action(let action):
                item.action = #selector(performAction)
                item._action = action
                item.target = item
            case .enabled(let isEnabled):
                item.isEnabled = isEnabled
            case .state(let state):
                item.state = state
            case .title(let title):
                item.title = title
            }
        }

        return item
    }
}
