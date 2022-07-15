import BagbutikSpecDecoder
import Foundation

public enum Documentation: Codable {
    case `enum`(EnumDocumentation)
    case object(ObjectDocumentation)

    var id: String {
        switch self {
        case .enum(let documentation):
            return documentation.id
        case .object(let documentation):
            return documentation.id
        }
    }

    var title: String {
        switch self {
        case .enum(let documentation):
            return documentation.title
        case .object(let documentation):
            return documentation.title
        }
    }

    public var abstract: String? {
        switch self {
        case .enum(let documentation):
            return documentation.abstract
        case .object(let documentation):
            return documentation.abstract
        }
    }

    var subDocumentationIds: [String] {
        switch self {
        case .enum:
            return []
        case .object(let documentation):
            return documentation.subDocumentationIds
        }
    }

    private enum CodingKeys: CodingKey {
        case identifier
        case metadata
        case abstract
        case primaryContentSections
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Identifier.self, forKey: .identifier).url
        let metadata = try container.decode(Metadata.self, forKey: .metadata)
        let abstract = try container.decodeIfPresent([Abstract].self, forKey: .abstract)?.first?.text
        let contentSections = try container.decode([ContentSection].self, forKey: .primaryContentSections)
        if metadata.symbolKind == "tdef" /* Enum */ {
            let values: [String: String] = contentSections.compactMap { contentSection in
                guard case .possibleValues(let values) = contentSection else { return nil }
                return values
            }.first ?? [:]
            self = .enum(.init(id: id, title: metadata.title, abstract: abstract, cases: values))
        } else if metadata.symbolKind == "dict" /* Object */ {
            let properties: [Property] = contentSections.compactMap { contentSection in
                guard case .properties(let properties) = contentSection else { return nil }
                return properties
            }.first ?? []
            let propertyDocumentations: [String: PropertyDocumentation] = properties.reduce(into: [:]) { partialResult, property in
                partialResult[property.name] = PropertyDocumentation(required: property.required, description: property.content?.text)
            }
            let subDocumentationIds = properties
                .filter { $0.type.kind == "typeIdentifier" }
                .compactMap(\.type.identifier)
            self = .object(.init(id: id, title: metadata.title, abstract: abstract, properties: propertyDocumentations, subDocumentationIds: subDocumentationIds))
        } else {
            throw DecodingError.dataCorruptedError(forKey: .metadata, in: container, debugDescription: "Unknown symbol kind: \(metadata.symbolKind)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .enum(let documentation):
            try container.encode(Identifier(url: documentation.id), forKey: .identifier)
            try container.encode(Metadata(title: documentation.title, symbolKind: "tdef"), forKey: .metadata)
            if let abstract = documentation.abstract {
                try container.encode([Abstract(text: abstract)], forKey: .abstract)
            }
            try container.encode([ContentSection.possibleValues(documentation.cases)], forKey: .primaryContentSections)
        case .object(let documentation):
            try container.encode(Identifier(url: documentation.id), forKey: .identifier)
            try container.encode(Metadata(title: documentation.title, symbolKind: "dict"), forKey: .metadata)
            if let abstract = documentation.abstract {
                try container.encode([Abstract(text: abstract)], forKey: .abstract)
            }
            let properties = documentation.properties.reduce(into: [Property]()) { partialResult, keyValue in
                let propertyName = keyValue.key
                let propertyDocumentation = keyValue.value
                let property = Property(name: propertyName,
                                        type: .init(kind: "text", text: "", identifier: nil),
                                        required: propertyDocumentation.required,
                                        content: .init(text: propertyDocumentation.description ?? ""))
                partialResult.append(property)
            }
            try container.encode([ContentSection.properties(properties)], forKey: .primaryContentSections)
        }
    }

    private struct Identifier: Codable {
        let url: String
    }

    private struct Metadata: Codable {
        let title: String
        let symbolKind: String
    }

    private struct Abstract: Codable {
        let text: String
    }

    private enum ContentSection: Codable {
        case possibleValues([String: String])
        case properties([Property])
        case unused

        private enum CodingKeys: CodingKey {
            case kind
            case values
            case items
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let kind = try container.decode(String.self, forKey: .kind)
            if kind == "possibleValues" {
                let values = try container
                    .decode([Value].self, forKey: .values)
                    .reduce(into: [String: String]()) { partialResult, value in
                        partialResult[value.name] = value.content?.first?.text ?? ""
                    }
                self = .possibleValues(values)
            } else if kind == "properties" {
                let properties = try container.decode([Property].self, forKey: .items)
                self = .properties(properties)
            } else if kind == "content" || kind == "declarations" {
                self = .unused
            } else {
                throw DecodingError.dataCorruptedError(forKey: .kind, in: container, debugDescription: "Unkown kind '\(kind)'")
            }
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case .possibleValues(let values):
                try container.encode("possibleValues", forKey: .kind)
                try container.encode(values.map { (key: String, value: String) in
                    Value(name: key, content: [.init(type: "text", inlineContent: [.init(text: value)])])
                }, forKey: .values)
            case .properties(let properties):
                try container.encode("properties", forKey: .kind)
                try container.encode(properties, forKey: .items)
            case .unused:
                try container.encode("content", forKey: .kind)
            }
        }

        private struct Value: Codable {
            let name: String
            let content: [Content]?
        }
    }

    struct Content: Codable {
        let type: String
        private let inlineContent: [InlineContent]
        var text: String? {
            if inlineContent.count > 1 {
                return inlineContent.compactMap { $0.text ?? $0.code }.joined(separator: " ")
            } else {
                return inlineContent.first?.text ?? inlineContent.first?.code
            }
        }

        init(text: String) {
            type = "text"
            inlineContent = [.init(text: text)]
        }

        init(type: String, inlineContent: [InlineContent]) {
            self.type = type
            self.inlineContent = inlineContent
        }

        struct InlineContent: Codable {
            let text: String?
            let code: String?

            init(text: String? = nil, code: String? = nil) {
                self.text = text
                self.code = code
            }
        }
    }

    public struct Property: Codable {
        let name: String
        let type: PropertyType
        let required: Bool
        let content: Content?

        enum CodingKeys: CodingKey {
            case name
            case type
            case required
            case content
        }

        init(name: String, type: PropertyType, required: Bool, content: Content?) {
            self.name = name
            self.type = type
            self.required = required
            self.content = content
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            let types = try container.decode([PropertyType].self, forKey: .type)
                .filter { $0.text != "[" && $0.text != "]" }
            guard types.count == 1 else { throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Multiple types for '\(name)'") }
            type = types.first!
            required = try container.decodeIfPresent(Bool.self, forKey: .required) ?? false
            let contents = (try container.decodeIfPresent([Content].self, forKey: .content) ?? [])
                .filter { $0.text != nil }
            guard contents.count <= 1 else { throw DecodingError.dataCorruptedError(forKey: .content, in: container, debugDescription: "Multiple contents for '\(name)'") }
            content = contents.first
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode([type], forKey: .type)
            try container.encode(required, forKey: .required)
            try container.encode([content], forKey: .content)
        }

        struct PropertyType: Codable {
            let kind: String
            let text: String
            let identifier: String?
        }
    }
}
