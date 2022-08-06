import BagbutikDocsCollector
import BagbutikSpecDecoder

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
    
    internal func renderStruct(named name: String, access: String = "public", protocols: [String]? = nil, content: () throws -> String) rethrows -> String {
        var protocolsString: String?
        if let protocols = protocols, protocols.count > 0 {
            protocolsString = ": " + protocols.joined(separator: ", ")
        }
        return """
        \(access) struct \(name)\(protocolsString ?? "") {
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
        var inheritanceString = ""
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
        \(access) enum \(name)\(inheritanceString) {
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
    
    internal func renderInitializer(parameters: [FunctionParameter], throwing: Bool = false, deprecated: Bool = false, content: () throws -> String) rethrows -> String {
        var rendered = ""
        if deprecated {
            rendered += #"@available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")"#
            rendered += "\n"
        }
        return rendered + """
        public init(\(parameters.formatted))\(throwing ? " throws" : "") {
            \(try content())
        }
        """
    }
    
    internal func renderFunction(named name: String, parameters: [FunctionParameter], returnType: String? = nil, static isStatic: Bool = false, throwing: Bool = false, deprecated: Bool = false, content: () throws -> String) rethrows -> String {
        var rendered = ""
        if deprecated {
            rendered += #"@available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")"#
            rendered += "\n"
        }
        var prefix = "public"
        if isStatic {
            prefix += " static"
        }
        var postfix = ""
        if throwing {
            postfix += " throws"
        }
        if let returnType = returnType {
            postfix += " -> \(returnType)"
        }
        return rendered + """
        \(prefix) func \(name.lowercasedFirstLetter())(\(parameters.formatted))\(postfix) {
            \(try content())
        }
        """
    }
    
    struct FunctionParameter {
        let prefix: String?
        let name: String
        let type: String
        let optional: Bool
        
        init(prefix: String? = nil, name: String, type: String, optional: Bool = false) {
            self.prefix = prefix
            self.name = name
            self.type = type
            self.optional = optional
        }
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

private extension Collection where Element == Renderer.FunctionParameter {
    var formatted: String {
        reduce(into: [String]()) { partialResult, parameter in
            let name: String
            if let prefix = parameter.prefix {
                name = "\(prefix) \(parameter.name)"
            } else {
                name = parameter.name
            }
            partialResult.append("\(name): \(parameter.type)\(parameter.optional ? "? = nil" : "")")
        }.joined(separator: ",\n")
    }
}
