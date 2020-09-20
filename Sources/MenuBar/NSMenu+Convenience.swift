
import AppKit.NSMenu

extension NSMenu {

    public func clear() {
        items.forEach { item in
            item.submenu?.clear()
            removeItem(item)
        }
    }

    public convenience init(descriptors: [Descriptor]) {
        self.init()
        autoenablesItems = false

        descriptors.forEach { descriptor in
            let item = descriptor.item()

            addItem(item)

            if let menu = descriptor.menu() {
                setSubmenu(menu, for: item)
            }
        }
    }
}
