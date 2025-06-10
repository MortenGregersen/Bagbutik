import BagbutikDocsCollector
import BagbutikSpecDecoder

/// A renderer which renders enum schemas
public class EnumSchemaRenderer: Renderer {
    /**
     Render an enum schema

     - Parameters:
        - enumSchema: The enum schema to render
     - Returns: The rendered enum schema
     */
    public func render(enumSchema: EnumSchema) async throws -> String {
        var renderedDocumentation = ""
        var documentation: EnumDocumentation?
        if let url = enumSchema.url,
           case .enum(let enumDocumentation) = try await docsLoader.resolveDocumentationForSchema(withDocsUrl: url),
           let abstract = enumDocumentation.abstract {
            documentation = enumDocumentation
            renderedDocumentation += await renderDocumentationBlock(title: enumDocumentation.title) {
                var documentationContent = [abstract]
                if let discussion = enumDocumentation.discussion {
                    documentationContent.append(discussion)
                }
                documentationContent.append("""
                Full documentation:
                <\(url)>
                """)
                return documentationContent.joined(separator: "\n\n")
            }
        }
        let protocols = enumSchema.additionalProtocols
            .union(["Codable", "CaseIterable", "Sendable"])
            .sorted()
            .reversed()
            .joined(separator: ", ")
        var renderedEnum = "public enum \(enumSchema.name): \(enumSchema.type.capitalized), \(protocols) {\n"
        enumSchema.cases
            .sorted(by: { $0.id < $1.id })
            .map { enumCase -> EnumCase in
                var enumCase = enumCase
                enumCase.documentation = documentation?.cases[enumCase.value]
                return enumCase
            }
            .forEach {
                if let caseDocumentation = $0.documentation {
                    renderedEnum += "    /// \(caseDocumentation)\n"
                }
                renderedEnum += "    case \($0.id)"
                if $0.id != $0.value {
                    renderedEnum += " = \"\($0.value)\""
                }
                renderedEnum += "\n"
            }
        renderedEnum += "}"
        if !renderedDocumentation.isEmpty {
            renderedEnum = [renderedDocumentation, renderedEnum].joined(separator: "\n")
        }
        return renderedEnum
    }
}
