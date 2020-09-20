
import AppKit.NSCell

public enum Parameter {

    case action(() -> Void)
    case title(String)
    case enabled(Bool)
    case state(NSControl.StateValue)
}
