import BagbutikDocsCollector
import BagbutikSpecDecoder
import StencilSwiftKit

/// A base class for the renderes which contains a default environment for Swift code rendering
public class Renderer {
    let docsLoader: DocsLoader
    
    public init(docsLoader: DocsLoader) {
        self.docsLoader = docsLoader
    }

    internal func escapeReservedKeywords(in searchString: String) -> String {
        guard Self.reservedKeywords.contains(searchString) else { return searchString }
        return "`\(searchString)`"
    }
    
    internal func renderStruct(named name: String, access: String = "public", content: () throws -> String) rethrows -> String {
        """
        \(access) struct \(name) {
            \(try content())
        }
        """
    }
    
    internal func renderEnum(named name: String, access: String = "public", rawType: String? = nil, protocols: [String]? = nil, cases: [EnumCase], caseValueIsAssociated: Bool = false, content: String? = nil) -> String {
        var inheritance = [String]()
        if let rawType = rawType {
            inheritance.append(rawType)
        }
        if let protocols = protocols {
            inheritance.append(contentsOf: protocols)
        }
        var inheritanceString: String?
        if inheritance.count > 0 {
            inheritanceString = ": " + inheritance.joined(separator: ", ")
        }
        var casesAndContent = cases
            .sorted(by: { $0.id < $1.id })
            .map { enumCase in
                var formattedCase = [String]()
                if let documentation = enumCase.documentation {
                    formattedCase.append("/// \(documentation)")
                }
                if enumCase.deprecated {
                    formattedCase.append(#"@available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")"#)
                }
                var caseLine = "case \(enumCase.id)"
                if caseValueIsAssociated {
                    caseLine += "(\(enumCase.value))"
                } else {
                    caseLine += " = \"\(enumCase.value)\""
                }
                formattedCase.append(caseLine)
                return formattedCase.joined(separator: "\n")
            }
            .joined(separator: "\n")
        if let content = content {
            casesAndContent += "\n\n\(content)"
        }
        return """
        \(access) enum \(name)\(inheritanceString ?? "") {
            \(casesAndContent)
        }
        """
    }
    
    internal func renderExtension(on extendedType: String, access: String = "public", content: () throws -> String) rethrows -> String {
        """
        \(access) extension \(extendedType) {
            \(try content())
        }
        """
    }
    
    internal func renderDocumentationBlock(content: () throws -> String) rethrows -> String {
        """
        /**
        \(try content())
        */
        """
    }
    
    internal func renderDocumentationBlock(title: String, content: () throws -> String) rethrows -> String {
        try renderDocumentationBlock {
            """
            # \(title)
            \(try content())
            """
        }
    }
    
    internal func renderDocumentationParameterLine(name: String, description: String) -> String {
        "- Parameter \(name): \(description)"
    }
    
    internal func renderFunction(named name: String, parameters: [FunctionParameter], returnType: String, deprecated: Bool, content: () throws -> String) rethrows -> String {
        var rendered = ""
        if deprecated {
            rendered += #"@available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")"#
            rendered += "\n"
        }
        let parameters = parameters.reduce(into: [String]()) { partialResult, parameter in
            partialResult.append("\(parameter.name): \(parameter.type)\(parameter.optional ? "? = nil" : "")")
        }
        return rendered + """
        public static func \(name.lowercasedFirstLetter())(\(parameters.joined(separator: ",\n"))) -> \(returnType) {
            \(try content())
        }
        """
    }
    
    struct FunctionParameter {
        let name: String
        let type: String
        let optional: Bool
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
