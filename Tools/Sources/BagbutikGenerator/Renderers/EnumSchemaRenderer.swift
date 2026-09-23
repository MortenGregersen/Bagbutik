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
        if let url = enumSchema.url,
           case .enum(let enumDocumentation) = try await docsLoader.resolveDocumentationForSchema(withDocsUrl: url, as: .enum) {
            renderedDocumentation += await renderDocumentationBlock {
                [enumDocumentation.content, """
                Full documentation:
                <\(url)>
                """].joined(separator: "\n\n")
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
            .forEach {
                renderedEnum += "    case \($0.id)"
                if $0.id != $0.value {
                    renderedEnum += " = \"\($0.value)\""
                }
                renderedEnum += "\n"
            }
        renderedEnum += "\n"
        renderedEnum += renderInitializer(parameters: [.init(prefix: "from", name: "decoder", type: "Decoder")], throwing: true, content: {
            """
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let value = \(enumSchema.name)(rawValue: string) {
                self = value
            } else if let value = \(enumSchema.name)(rawValue: string.uppercased()) {
                self = value
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid \(enumSchema.name) value: \\(string)"
                )
            }
            """
        }).indentedLines
        renderedEnum += "\n}"
        if !renderedDocumentation.isEmpty {
            renderedEnum = [renderedDocumentation, renderedEnum].joined(separator: "\n")
        }
        return renderedEnum
    }
}
