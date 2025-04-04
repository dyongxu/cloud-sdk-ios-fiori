// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

protocol TextInputInfoViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TextInputInfoViewConfiguration) -> Body
}

struct AnyTextInputInfoViewStyle: TextInputInfoViewStyle {
    let content: (TextInputInfoViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TextInputInfoViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

struct TextInputInfoViewConfiguration {
    public var componentIdentifier: String = "fiori_textinputinfoview_component"
    public let icon: Icon
    public let description: Description
    public let counter: Counter

    public typealias Icon = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Counter = ConfigurationViewWrapper
}

extension TextInputInfoViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct TextInputInfoViewFioriStyle: TextInputInfoViewStyle {
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(IconFioriStyle(textInputInfoViewConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(textInputInfoViewConfiguration: configuration))
            .counterStyle(CounterFioriStyle(textInputInfoViewConfiguration: configuration))
            .informationViewStyle(InformationViewFioriStyle(textInputInfoViewConfiguration: configuration))
    }
}
