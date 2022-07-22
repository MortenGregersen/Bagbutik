import BagbutikSpecDecoder
import Foundation

public enum Documentation: Codable {
    case `enum`(EnumDocumentation)
    case object(ObjectDocumentation)
    case operation(OperationDocumentation)

    var id: String {
        switch self {
        case .enum(let documentation):
            return documentation.id
        case .object(let documentation):
            return documentation.id
        case .operation(let documentation):
            return documentation.id
        }
    }

    var title: String {
        switch self {
        case .enum(let documentation):
            return documentation.title
        case .object(let documentation):
            return documentation.title
        case .operation(let documentation):
            return documentation.title
        }
    }

    var abstract: String? {
        switch self {
        case .enum(let documentation):
            return documentation.abstract
        case .object(let documentation):
            return documentation.abstract
        case .operation(let documentation):
            return documentation.abstract
        }
    }

    var discussion: String? {
        switch self {
        case .enum(let documentation):
            return documentation.discussion
        case .object(let documentation):
            return documentation.discussion
        case .operation(let documentation):
            return documentation.discussion
        }
    }

    var subDocumentationIds: [String] {
        switch self {
        case .enum:
            return []
        case .object(let documentation):
            return documentation.subDocumentationIds
        case .operation:
            return []
        }
    }

    private enum CodingKeys: CodingKey {
        case identifier
        case metadata
        case abstract
        case primaryContentSections
        case references
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Identifier.self, forKey: .identifier).url
        let metadata = try container.decode(Metadata.self, forKey: .metadata)
        let abstract = try container.decodeIfPresent([Abstract].self, forKey: .abstract)?.first?.text
        let references = try container.decodeIfPresent([String: Reference].self, forKey: .references)
        let formatContent: (Content?) -> String? = { content in
            content?.inlineContent.reduce(into: "") { partialResult, inlineContent in
                switch inlineContent {
                case .text(let text):
                    partialResult.append(text)
                case .reference(let identifier):
                    guard let reference = references?[identifier] else { return }
                    switch reference.role {
                    case .dictionarySymbol:
                        let formattedReference = reference.title
                            .replacingOccurrences(of: ".", with: "/")
                            .capitalizingFirstLetter()
                        partialResult.append("``\(formattedReference)``")
                    case .symbol, .article, .link:
                        partialResult.append("[\(reference.title)](\(reference.url))")
                    case .none:
                        break
                    }
                }
            }
        }
        let contentSections = try container.decode([ContentSection].self, forKey: .primaryContentSections)
        let discussion = contentSections.compactMap { contentSection -> String? in
            guard case .discussion(let contents) = contentSection else { return nil }
            return contents
                .compactMap { formatContent($0) }
                .filter { $0.lengthOfBytes(using: .utf8) > 0 }
                .joined(separator: "\n")
        }.first
        if metadata.symbolKind == "tdef" /* Enum */ {
            let values: [String: String] = contentSections.compactMap { contentSection -> [String: String]? in
                guard case .possibleValues(let values) = contentSection else { return nil }
                return values.mapValues { formatContent($0) ?? "" }
            }.first ?? [:]
            self = .enum(.init(id: id, title: metadata.title, abstract: abstract, discussion: discussion, cases: values))
        } else if metadata.symbolKind == "dict" /* Object */ {
            let properties: [Property] = contentSections.compactMap { contentSection in
                guard case .properties(let properties) = contentSection else { return nil }
                return properties
            }.first ?? []
            let propertyDocumentations: [String: PropertyDocumentation] = properties.reduce(into: [:]) { partialResult, property in
                partialResult[property.name] = PropertyDocumentation(required: property.required, description: formatContent(property.content))
            }
            let subDocumentationIds = properties
                .filter { $0.type.kind == "typeIdentifier" }
                .compactMap(\.type.identifier)
            self = .object(.init(id: id,
                                 title: metadata.title,
                                 abstract: abstract,
                                 discussion: discussion,
                                 properties: propertyDocumentations,
                                 subDocumentationIds: subDocumentationIds))
        } else if metadata.symbolKind == "operation" || metadata.symbolKind == "httpGet" || metadata.symbolKind == "httpPatch" || metadata.symbolKind == "httpPost" || metadata.symbolKind == "httpDelete" /* Operation */ {
            let pathParameters: [String: String] = (contentSections.compactMap { contentSection -> [Parameter]? in
                guard case .pathParameters(let parameters) = contentSection else { return nil }
                return parameters
            }.first ?? []).reduce(into: [:]) { partialResult, parameter in
                partialResult[parameter.name] = formatContent(parameter.content) ?? ""
            }
            let queryParameters: [String: String] = (contentSections.compactMap { contentSection -> [Parameter]? in
                guard case .queryParameters(let parameters) = contentSection else { return nil }
                return parameters
            }.first ?? []).reduce(into: [:]) { partialResult, parameter in
                partialResult[parameter.name] = formatContent(parameter.content) ?? ""
            }
            let body = contentSections.compactMap { contentSection -> String? in
                guard case .restBody(let contents) = contentSection else { return nil }
                return contents?
                    .compactMap { formatContent($0) }
                    .filter { $0.lengthOfBytes(using: .utf8) > 0 }
                    .joined(separator: "\n")
            }.first
            let responses: [Response] = contentSections.compactMap { contentSection in
                guard case .restResponses(let responses) = contentSection else { return nil }
                return responses
            }.first ?? []
            let responseDocumentations: [ResponseDocumentation] = responses.map {
                ResponseDocumentation(status: $0.status, reason: $0.reason, description: formatContent($0.content))
            }
            self = .operation(.init(id: id,
                                    title: metadata.title,
                                    abstract: abstract,
                                    discussion: discussion,
                                    pathParameters: pathParameters,
                                    queryParameters: queryParameters,
                                    body: body,
                                    responses: responseDocumentations))
        } else {
            throw DecodingError.dataCorruptedError(forKey: .metadata, in: container, debugDescription: "Unknown symbol kind: \(metadata.symbolKind)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Identifier(url: id), forKey: .identifier)
        if let abstract {
            try container.encode([Abstract(text: abstract)], forKey: .abstract)
        }
        var contentSections = [ContentSection]()
        switch self {
        case .enum(let documentation):
            try container.encode(Metadata(title: documentation.title, symbolKind: "tdef"), forKey: .metadata)
            contentSections.append(ContentSection.possibleValues(documentation.cases.mapValues { Content(text: $0) }))

        case .object(let documentation):
            try container.encode(Metadata(title: documentation.title, symbolKind: "dict"), forKey: .metadata)
            let properties = documentation.properties.reduce(into: [Property]()) { partialResult, keyValue in
                let propertyName = keyValue.key
                let propertyDocumentation = keyValue.value
                let property = Property(name: propertyName,
                                        type: .init(kind: "text", text: "", identifier: nil),
                                        required: propertyDocumentation.required,
                                        content: .init(text: propertyDocumentation.description ?? ""))
                partialResult.append(property)
            }
            contentSections.append(ContentSection.properties(properties))
        case .operation(let documentation):
            try container.encode(Metadata(title: documentation.title, symbolKind: "operation"), forKey: .metadata)
            let pathParameters = documentation.pathParameters.map { keyValue in
                Parameter(name: keyValue.key, content: .init(text: keyValue.value))
            }
            if pathParameters.count > 0 {
                contentSections.append(.pathParameters(pathParameters))
            }
            let queryParameters = documentation.queryParameters.map { keyValue in
                Parameter(name: keyValue.key, content: .init(text: keyValue.value))
            }
            if queryParameters.count > 0 {
                contentSections.append(.queryParameters(queryParameters))
            }
            if let body = documentation.body.map({ Content(text: $0) }) {
                contentSections.append(.restBody([body]))
            }
            contentSections.append(.restResponses(documentation.responses.map { response in
                let content = response.description.map { Content(text: $0) }
                return Response(status: response.status, reason: response.reason, content: content)
            }))
        }
        if let discussion {
            contentSections.append(.discussion([.init(text: discussion)]))
        }
        try container.encode(contentSections, forKey: .primaryContentSections)
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

    internal struct Reference: Codable {
        let title: String
        let url: String
        let role: Role?

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decode(String.self, forKey: .title)
            let roleString = try container.decodeIfPresent(String.self, forKey: .role)
            role = Role(rawValue: roleString ?? "")
            let url = try container.decode(String.self, forKey: .url)
            if role == .symbol || role == .article {
                self.url = "https://developer.apple.com" + url
            } else {
                self.url = url
            }
        }

        enum Role: String, Codable {
            case dictionarySymbol
            case symbol
            case article
            case link
        }
    }

    private enum ContentSection: Codable {
        case possibleValues([String: Content])
        case properties([Property])
        case discussion([Content])
        case pathParameters([Parameter])
        case queryParameters([Parameter])
        case restBody([Content]?)
        case restResponses([Response])
        case unused

        private enum CodingKeys: CodingKey {
            case kind
            case source
            case values
            case items
            case content
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let kind = try container.decode(String.self, forKey: .kind)
            if kind == "possibleValues" {
                let values = try container
                    .decode([Value].self, forKey: .values)
                    .reduce(into: [String: Content]()) { partialResult, value in
                        partialResult[value.name] = value.content.first
                    }
                self = .possibleValues(values)
            } else if kind == "properties" {
                let properties = try container.decode([Property].self, forKey: .items)
                self = .properties(properties)
            } else if kind == "content" {
                let contents = try container
                    .decode([Content].self, forKey: .content)
                    .filter { $0.type != "heading" }
                guard contents.count > 0 else {
                    throw DecodingError.dataCorruptedError(forKey: .kind, in: container, debugDescription: "Content section of kind '\(kind)' has no content")
                }
                self = .discussion(contents)
            } else if kind == "restParameters" {
                let source = try container.decode(String.self, forKey: .source)
                let parameters = try container.decode([Parameter].self, forKey: .items)
                if source == "path" {
                    self = .pathParameters(parameters)
                } else if source == "query" {
                    self = .queryParameters(parameters)
                } else {
                    throw DecodingError.dataCorruptedError(forKey: .kind, in: container, debugDescription: "Content section of kind '\(kind)' has unknown parameter source")
                }
            } else if kind == "restBody" {
                let contents = try container.decodeIfPresent([Content].self, forKey: .content)
                self = .restBody(contents)
            } else if kind == "restResponses" {
                let responses = try container.decode([Response].self, forKey: .items)
                self = .restResponses(responses)
            } else if kind == "declarations" || kind == "restEndpoint" {
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
                try container.encode(values.map { (key: String, value: Content) in
                    Value(name: key, content: [value])
                }.sorted(using: KeyPathComparator(\.name)), forKey: .values)
            case .properties(let properties):
                try container.encode("properties", forKey: .kind)
                try container.encode(properties.sorted(using: KeyPathComparator(\.name)), forKey: .items)
            case .discussion(let contents):
                try container.encode("content", forKey: .kind)
                try container.encode(contents, forKey: .content)
            case .pathParameters(let parameters):
                try container.encode("restParameters", forKey: .kind)
                try container.encode("path", forKey: .source)
                try container.encode(parameters.sorted(using: KeyPathComparator(\.name)), forKey: .items)
            case .queryParameters(let parameters):
                try container.encode("restParameters", forKey: .kind)
                try container.encode("query", forKey: .source)
                try container.encode(parameters.sorted(using: KeyPathComparator(\.name)), forKey: .items)
            case .restBody(let contents):
                try container.encode("restBody", forKey: .kind)
                try container.encode(contents ?? [], forKey: .content)
            case .restResponses(let responses):
                try container.encode("restResponses", forKey: .kind)
                try container.encode(responses.sorted(using: KeyPathComparator(\.status)), forKey: .items)
            case .unused:
                try container.encode("content", forKey: .kind)
            }
        }

        private struct Value: Codable {
            let name: String
            let content: [Content]

            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                name = try container.decode(String.self, forKey: .name)
                content = try container.decodeIfPresent([Content].self, forKey: .content) ?? []
            }

            init(name: String, content: [Content]) {
                self.name = name
                self.content = content
            }
        }
    }

    struct Content: Codable {
        let type: String
        let inlineContent: [InlineContent]

        private enum CodingKeys: CodingKey {
            case type
            case inlineContent
            case code
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            type = try container.decode(String.self, forKey: .type)
            if let inlineContent = try container.decodeIfPresent([InlineContent].self, forKey: .inlineContent) {
                self.inlineContent = inlineContent
            } else if type == "codeListing", let code = try container.decodeIfPresent([String].self, forKey: .code)?.first {
                inlineContent = [.text("```\n\(code)\n```")]
            } else {
                inlineContent = try container.decodeIfPresent([InlineContent].self, forKey: .inlineContent) ?? []
            }
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode("paragraph", forKey: .type)
            try container.encode(inlineContent, forKey: .inlineContent)
        }

        init(text: String) {
            type = "paragraph"
            inlineContent = [.text(text)]
        }

        init(type: String, inlineContent: [InlineContent]) {
            self.type = type
            self.inlineContent = inlineContent
        }

        enum InlineContent: Codable {
            case text(String)
            case reference(String)

            private enum CodingKeys: CodingKey {
                case type
                case text
                case code
                case identifier
                case inlineContent
            }

            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                let type = try container.decode(String.self, forKey: .type)
                if type == "text", let text = try container.decodeIfPresent(String.self, forKey: .text) {
                    self = .text(text)
                } else if type == "emphasis", case .text(let subContent) = try container.decode([InlineContent].self, forKey: .inlineContent).first {
                    self = .text("*\(subContent)*")
                } else if type == "codeVoice", let code = try container.decodeIfPresent(String.self, forKey: .code) {
                    self = .text("`\(code)`")
                } else if type == "reference", let identifier = try container.decodeIfPresent(String.self, forKey: .identifier) {
                    self = .reference(identifier)
                } else {
                    throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Unkown type '\(type)'")
                }
            }

            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                switch self {
                case .text(let text):
                    try container.encode("text", forKey: .type)
                    try container.encode(text, forKey: .text)
                case .reference(let identifier):
                    try container.encode("reference", forKey: .type)
                    try container.encode(identifier, forKey: .identifier)
                }
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
                .filter { $0.inlineContent.count > 0 }
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

    public struct Parameter: Codable {
        let name: String
        let content: Content?

        enum CodingKeys: CodingKey {
            case name
            case content
        }

        init(name: String, content: Content?) {
            self.name = name
            self.content = content
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            let contents = (try container.decodeIfPresent([Content].self, forKey: .content) ?? [])
                .filter { $0.inlineContent.count > 0 }
            guard contents.count <= 1 || contents.allSatisfy({ $0.type == "paragraph" }) else {
                throw DecodingError.dataCorruptedError(forKey: .content, in: container, debugDescription: "Multiple contents for '\(name)'")
            }
            if contents.count > 1 {
                content = Content(type: contents.first!.type, inlineContent: contents.flatMap(\.inlineContent))
            } else {
                content = contents.first
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode([content], forKey: .content)
        }
    }

    public struct Response: Codable {
        let status: Int
        let reason: String
        let content: Content?

        enum CodingKeys: CodingKey {
            case status
            case reason
            case content
        }

        init(status: Int, reason: String, content: Content?) {
            self.status = status
            self.reason = reason
            self.content = content
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            status = try container.decode(Int.self, forKey: .status)
            reason = try container.decode(String.self, forKey: .reason)
            let contents = (try container.decodeIfPresent([Content].self, forKey: .content) ?? [])
                .filter { $0.inlineContent.count > 0 }
            guard contents.count <= 1 else { throw DecodingError.dataCorruptedError(forKey: .content, in: container, debugDescription: "Multiple contents for '\(status)'") }
            content = contents.first
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(status, forKey: .status)
            try container.encode(reason, forKey: .reason)
            try container.encode([content], forKey: .content)
        }
    }
}
