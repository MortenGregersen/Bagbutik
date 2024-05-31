import BagbutikDocsCollector
import BagbutikSpecDecoder

/// A renderer which renders enum schemas
public class EnumSchemaRenderer: Renderer {
    /**
     Render an enum schema

     - Parameters:
        - enumSchema: The enum schema to render
        - additionalProtocol: Any additional protocol the enum should conform to
     - Returns: The rendered enum schema
     */
    public func render(enumSchema: EnumSchema) throws -> String {
        var rendered = ""
        var documentation: EnumDocumentation?
        if let url = enumSchema.url,
           case .enum(let enumDocumentation) = try docsLoader.resolveDocumentationForSchema(withDocsUrl: url),
           let abstract = enumDocumentation.abstract {
            documentation = enumDocumentation
            rendered += renderDocumentationBlock(title: enumDocumentation.title) {
                var documentationContent = abstract
                if let discussion = enumDocumentation.discussion {
                    documentationContent += "\n\n\(discussion)"
                }
                documentationContent += "\n\nFull documentation:\n<\(url)>"
                return documentationContent
            } + "\n"
        }
        let protocols = enumSchema.additionalProtocols
            .union(["Codable", "CaseIterable"])
            .sorted()
            .reversed()
            .joined(separator: ", ")
        rendered += "public enum \(enumSchema.name): \(enumSchema.type.capitalized), \(protocols) {\n"
        enumSchema.cases
            .sorted(by: { $0.id < $1.id })
            .map { enumCase -> EnumCase in
                var enumCase = enumCase
                enumCase.documentation = documentation?.cases[enumCase.value]
                return enumCase
            }
            .forEach {
                if let caseDocumentation = $0.documentation {
                    rendered += "///\(caseDocumentation)\n"
                }
                rendered += "case \($0.id) = \"\($0.value)\"\n"
            }
        rendered += "}"
        return try format(rendered)
    }
}
