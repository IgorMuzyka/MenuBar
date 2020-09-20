
import AppKit.NSMenu

public enum Descriptor {

    case menu([Parameter], [Descriptor])
    case item([Parameter])
    case separator

    internal func item() -> NSMenuItem {
        switch self {
        case .menu(let parameters, _): return Item.item(parameters: parameters)
        case .item(let parameters): return Item.item(parameters: parameters)
        case .separator: return .separator()
        }
    }

    internal func menu() -> NSMenu? {
        switch self {
        case .menu(_, let descriptors): return NSMenu(descriptors: descriptors)
        default: return nil
        }
    }
}
