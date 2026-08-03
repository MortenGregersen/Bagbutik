import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// A base class for the renderes which contains a default environment for Swift code rendering
public class Renderer {
    let docsLoader: DocsLoader
    let shouldFormat: Bool
    
    public init(docsLoader: DocsLoader, shouldFormat: Bool = false) {
        self.docsLoader = docsLoader
        self.shouldFormat = shouldFormat
    }

    func escapeReservedKeywords(in searchString: String) -> String {
        guard Self.reservedKeywords.contains(searchString) else { return searchString }
        return "`\(searchString)`"
    }
    
    func renderStruct(named name: String, access: String = "public", protocols: [String]? = nil, content: () async throws -> String) async rethrows -> String {
        var protocolsString: String?
        if let protocols, !protocols.isEmpty {
            protocolsString = ": " + protocols.joined(separator: ", ")
        }
        return try await """
        \(access) struct \(name)\(protocolsString ?? "") {
        \(content().indentedLines)
        }
        """
    }
    
    func renderEnum(named name: String, access: String = "public", rawType: String? = nil, protocols: [String]? = nil, cases: [EnumCase], caseValueIsAssociated: Bool = false, content: String? = nil) -> String {
        var inheritance = [String]()
        if let rawType {
            inheritance.append(rawType)
        }
        if let protocols {
            inheritance.append(contentsOf: protocols)
        }
        var inheritanceString = ""
        if !inheritance.isEmpty {
            inheritanceString = ": " + inheritance.joined(separator: ", ")
        }
        var casesAndContent = cases
            .sorted(by: { $0.id < $1.id })
            .map { enumCase in
                var formattedCase = [String]()
                if let documentation = enumCase.documentation, !documentation.isEmpty {
                    formattedCase.append("/// \(documentation)")
                }
                if enumCase.deprecated {
                    formattedCase.append(#"@available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")"#)
                }
                var caseLine = "case \(enumCase.id)"
                if caseValueIsAssociated {
                    caseLine += "(\(enumCase.value))"
                } else if !(rawType == "String" && enumCase.id == enumCase.value) {
                    caseLine += " = \"\(enumCase.value)\""
                }
                formattedCase.append(caseLine)
                return formattedCase.joined(separator: "\n")
            }
            .joined(separator: "\n")
        if let content {
            casesAndContent += "\n\n\(content)"
        }
        return """
        \(access) enum \(name)\(inheritanceString) {
        \(casesAndContent.indentedLines.trimmingCharacters(in: .newlines))
        }
        """
    }
    
    func renderEnumWrapper(named name: String, access: String = "public", content: () async throws -> String) async rethrows -> String {
        return try await """
        \(access) enum \(name) {
        \(content().indentedLines)
        }
        """
    }
    
    func renderExtension(on extendedType: String, access: String = "public", content: () async throws -> String) async rethrows -> String {
        try await """
        \(access) extension \(extendedType) {
        \(content().indentedLines)
        }
        """
    }
    
    func renderDocumentationBlock(content: () async throws -> String) async rethrows -> String {
        try await """
        /**
        \(content().indented(bySpaces: 1))
         */
        """
    }
    
    func renderDocumentationBlock(title: String, content: () async throws -> String) async rethrows -> String {
        try await renderDocumentationBlock {
            try await """
            # \(title)
            \(content())
            """
        }
    }
    
    func renderDocumentationParameterLine(name: String, description: String) -> String {
        "- Parameter \(name): \(description.capitalizingFirstLetter())"
    }
    
    func renderInitializer(parameters: [FunctionParameter], throwing: Bool = false, deprecated: Bool = false, content: () throws -> String) rethrows -> String {
        var rendered = ""
        if deprecated {
            rendered += #"@available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")"#
            rendered += "\n"
        }
        let formattedParameters = parameters
            .formatted(subsequentLinesIndentedBySpaces: "public init(".lengthOfBytes(using: .utf8))
        rendered += "public init(\(formattedParameters))\(throwing ? " throws" : "")"
        let content = try content()
        if content.isEmpty {
            rendered += " {}"
        } else {
            if parameters.count > 1 {
                rendered += "\n{\n"
            } else {
                rendered += " {\n"
            }
            rendered += content.indentedLines
            rendered += "\n}"
        }
        return rendered
    }
    
    func renderFunction(named name: String, parameters: [FunctionParameter], returnType: String? = nil, static isStatic: Bool = false, addAccessibilityModifier: Bool = true, throwing: Bool = false, deprecated: Bool = false, content: () throws -> String) rethrows -> String {
        var rendered = ""
        if deprecated {
            rendered += #"@available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")"#
            rendered += "\n"
        }
        var prefix = [String]()
        if addAccessibilityModifier {
            prefix.append("public")
        }
        if isStatic {
            prefix.append("static")
        }
        var postfix = ""
        if throwing {
            postfix += " throws"
        }
        if let returnType {
            postfix += " -> \(returnType)"
        }
        let functionDeclarationStart = "\(prefix.joined(separator: " ")) func \(name.lowercasedFirstLetter())("
        let formattedParameters = parameters
            .formatted(subsequentLinesIndentedBySpaces: functionDeclarationStart.lengthOfBytes(using: .utf8))
        let content = try content()
        rendered += "\(functionDeclarationStart)\(formattedParameters))\(postfix) {"
        if content.isEmpty {
            return rendered + "}"
        } else {
            return rendered + "\n\(content.indentedLines)\n}"
        }
    }
    
    struct FunctionParameter: Equatable {
        let prefix: String?
        let name: String
        let type: String
        let optional: Bool
        let clearable: Bool
        
        init(prefix: String? = nil, name: String, type: String, optional: Bool = false, clearable: Bool = false) {
            self.prefix = prefix
            self.name = name
            self.type = type
            self.optional = optional
            self.clearable = clearable
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

private extension Collection<Renderer.FunctionParameter> {
    func formatted(subsequentLinesIndentedBySpaces spacesAmount: Int) -> String {
        reduce(into: [String]()) { partialResult, parameter in
            let name: String
            let type: String
            if let prefix = parameter.prefix {
                name = "\(prefix) \(parameter.name)"
            } else {
                name = parameter.name
            }
            if parameter.clearable {
                type = "Clearable<\(parameter.type)>"
            } else {
                type = parameter.type
            }
            let formattedParameter = "\(name): \(type)\(parameter.optional ? "? = nil" : "")"
            if partialResult.isEmpty {
                partialResult.append(formattedParameter)
            } else {
                partialResult.append(formattedParameter.indented(bySpaces: spacesAmount))
            }
        }.joined(separator: ",\n")
    }
}

extension String {
    var indentedLines: String {
        indented(bySpaces: 4)
    }
    
    func indented(bySpaces amount: Int) -> String {
        let indention = String(repeating: " ", count: amount)
        return components(separatedBy: "\n")
            .map {
                guard !$0.isEmpty else { return $0 }
                return "\(indention)\($0)"
            }
            .joined(separator: "\n")
    }
}
