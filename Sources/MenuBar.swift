
import AppKit.NSMenu

open class MenuBar {

    open var descriptors: [Descriptor] {
        didSet {
            update()
        }
    }

    open var image: NSImage? {
        didSet {
            if #available(macOS 10.14, *) {
                statusItem.button?.image = image
            } else {
                statusItem.image = image
            }
            update()
        }
    }

    open var title: String = "" {
        didSet {
            if #available(macOS 10.14, *) {
                statusItem.button?.title = title
            } else {
                statusItem.title = title
            }
            update()
        }
    }

    private let statusItem: NSStatusItem

    public init(
        statusItem: NSStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength),
        descriptors: [Descriptor]
    ) {
        self.statusItem = statusItem
        self.descriptors = descriptors
    }

    deinit {
        clear()
    }

    public func update() {
        clear()
        render()
    }

    private func render() {
        statusItem.menu = NSMenu(descriptors: descriptors)
    }

    private func clear() {
        statusItem.menu?.clear()
    }
}

extension NSMenu {

    internal func clear() {
        items.forEach { item in
            item.submenu?.clear()
            removeItem(item)
        }
    }

    internal convenience init(descriptors: [Descriptor]) {
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
