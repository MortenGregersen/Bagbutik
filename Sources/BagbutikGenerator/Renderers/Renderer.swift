import BagbutikDocsCollector
import StencilSwiftKit

/// A base class for the renderes which contains a default environment for Swift code rendering
public class Renderer {
    let docsLoader: DocsLoader
    let environment = StencilSwiftKit.stencilSwiftEnvironment()

    public init(docsLoader: DocsLoader) {
        self.docsLoader = docsLoader
    }

    internal func escapeReservedKeywords(in searchString: String) -> String {
        guard Self.reservedKeywords.contains(searchString) else { return searchString }
        return "`\(searchString)`"
    }
    
    private static let reservedKeywords = [
        "associatedtype", "class", "deinit", "enum", "extension",
        "fileprivate", "func", "import", "init", "inout", "internal",
        "let", "open", "operator", "private", "protocol", "public",
        "static", "struct", "subscript", "typealias", "var", "break",
        "case", "continue", "default", "defer", "do", "else",
        "fallthrough", "for", "guard", "if", "in", "repeat", "return",
        "switch", "where", "while", "as", "Any", "catch", "false", "is",
        "nil", "rethrows", "super", "self", "Self", "throw", "throws",
        "true", "try", "associativity", "convenience", "dynamic",
        "didSet", "final", "get", "infix", "indirect", "lazy", "left",
        "mutating", "none", "nonmutating", "optional", "override",
        "postfix", "precedence", "prefix", "Protocol", "required",
        "right", "set", "Type", "unowned", "weak", "willSet"
    ]
}
