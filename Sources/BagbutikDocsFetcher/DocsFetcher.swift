import BagbutikSpecDecoder
import Foundation

/**
 A file manager which can perform the operations needed by the DocsFetcher

 This is just an interface already implemented by Foundation's FileManager, needed to enable unit testing.

 # Reference
 <https://developer.apple.com/documentation/foundation/filemanager>
 */
public protocol DocsFetcherFileManager {
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1415371-createdirectory>
    func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey: Any]?) throws
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1410695-createfile>
    func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey: Any]?) -> Bool
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1413590-removeitem>
    func removeItem(at URL: URL) throws
}

extension FileManager: DocsFetcherFileManager {}

/// Errors that can occur when generating
public enum DocsFetcherError: Error {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The schema has no documentation URL
    case noDocumentationUrl(String)
    /// The file could not be created
    case couldNotCreateFile(String)

    /// The type of the file URL
    public enum FileURLType {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the output directory
        case outputDirURL
    }
}

extension DocsFetcherError: Equatable {}

/**
 An alias for a function loading a spec from a file URL

 - Parameter fileUrl: The file URL to load the spec from
 - Returns: A decoded Spec
 */
internal typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

public class DocsFetcher {
    private let loadSpec: LoadSpec
    private let fileManager: DocsFetcherFileManager
    private let print: (String) -> Void

    /// Initialize a new generator
    public convenience init() {
        let loadSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
            try spec.applyAllFixups()
            return spec
        }
        self.init(loadSpec: loadSpec, fileManager: FileManager.default, print: { Swift.print($0) })
    }

    internal init(loadSpec: @escaping LoadSpec, fileManager: DocsFetcherFileManager, print: @escaping (String) -> Void) {
        self.loadSpec = loadSpec
        self.fileManager = fileManager
        self.print = print
    }

    public func fetchAllDocs(specFileURL: URL) async throws {
        guard specFileURL.isFileURL else { throw DocsFetcherError.notFileUrl(.specFileURL) }
        print("🔍 Loading spec \(specFileURL)...")
        let spec = try loadSpec(specFileURL)

        var identifierBySchemaName = [String: String]()
        var documentationById = [String: Documentation]()
        for schemaName in ["App"] { // }, "AppResponse"] {
            guard let schema = spec.components.schemas[schemaName] else { return }
            let documentation = try await fetchDocs(for: schema)
            identifierBySchemaName[schemaName] = documentation.id
            documentationById[documentation.id] = documentation
            let subDocumentations = try await fetchDocs(for: documentation.subDocumentationIds)
            for subDocumentation in subDocumentations {
                documentationById[subDocumentation.id] = subDocumentation
            }
        }
        Swift.print(identifierBySchemaName)
        Swift.print(documentationById)
    }

    private func fetchDocs(for schema: Schema) async throws -> Documentation {
        guard let urlString = schema.url else {
            throw DocsFetcherError.noDocumentationUrl(schema.name)
        }
        let jsonUrlString = createJsonDocumentationUrl(fromUrl: urlString)
        let url = URL(string: jsonUrlString)!
        Swift.print("Fetching documentation from: ", url)
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Documentation.self, from: data)
    }

    private func fetchDocs(for documentationIds: [String]) async throws -> [Documentation] {
        var documentations = [Documentation]()
        for documentationId in documentationIds {
            let jsonUrlString = createJsonDocumentationUrl(fromId: documentationId)
            let url = URL(string: jsonUrlString)!
            Swift.print("Fetching documentation from: ", url)
            let (data, _) = try await URLSession.shared.data(from: url)
            let documentation = try JSONDecoder().decode(Documentation.self, from: data)
            documentations.append(documentation)
        }
        return documentations
    }

    private func createJsonDocumentationUrl(fromUrl url: String) -> String {
        url.replacingOccurrences(
            of: "/documentation/",
            with: "/tutorials/data/documentation/")
            .appending(".json")
    }

    private func createJsonDocumentationUrl(fromId id: String) -> String {
        id.replacingOccurrences(
            of: "doc://com.apple.documentation/documentation",
            with: "https://developer.apple.com/tutorials/data/documentation")
            .appending(".json")
    }
}

enum Documentation: Decodable {
    case `enum`(id: String, title: String, abstract: String, values: [String: String])
    case object(id: String, title: String, abstract: String, properties: [Property])

    var id: String {
        switch self {
        case .enum(let id, _, _, _):
            return id
        case .object(let id, _, _, _):
            return id
        }
    }

    var subDocumentationIds: [String] {
        switch self {
        case .enum:
            return []
        case .object(_, _, _, let properties):
            return properties
                .filter { $0.type.kind == "typeIdentifier" }
                .compactMap(\.type.identifier)
        }
    }

    private enum CodingKeys: CodingKey {
        case identifier
        case metadata
        case abstract
        case primaryContentSections
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Identifier.self, forKey: .identifier).url
        let metadata = try container.decode(Metadata.self, forKey: .metadata)
        let abstract = try container.decode([Abstract].self, forKey: .abstract).first!.text
        let contentSections = try container.decode([ContentSection].self, forKey: .primaryContentSections)
        if metadata.symbolKind == "tdef" /* Enum */,
           let values: [String: String] = contentSections.compactMap({ contentSection in
               guard case .possibleValues(let values) = contentSection else { return nil }
               return values
           }).first {
            self = .enum(id: id, title: metadata.title, abstract: abstract, values: values)
        } else if metadata.symbolKind == "dict" /* Object */,
                  let properties: [Property] = contentSections.compactMap({ contentSection in
                      guard case .properties(let properties) = contentSection else { return nil }
                      return properties
                  }).first {
            self = .object(id: id, title: metadata.title, abstract: abstract, properties: properties)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .metadata, in: container, debugDescription: "Unknown symbol kind: \(metadata.symbolKind)")
        }
    }

    private struct Identifier: Decodable {
        let url: String
    }

    private struct Metadata: Decodable {
        let title: String
        let symbolKind: String
    }

    private struct Abstract: Decodable {
        let text: String
    }

    private enum ContentSection: Decodable {
        case possibleValues([String: String])
        case properties([Property])
        case unknown

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
                        guard let text = value.content.first?.text else { return }
                        partialResult[value.name] = text
                    }
                self = .possibleValues(values)
            } else if kind == "properties" {
                let properties = try container.decode([Property].self, forKey: .items)
                self = .properties(properties)
            } else {
                self = .unknown
            }
        }

        private struct Value: Decodable {
            let name: String
            let content: [Content]
        }
    }

    struct Content: Decodable {
        let type: String
        var text: String { inlineContent.first!.text }
        private let inlineContent: [InlineContent]

        private struct InlineContent: Decodable {
            let text: String
        }
    }

    struct Property: Decodable {
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

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: CodingKeys.name)
            let types = try container.decode([PropertyType].self, forKey: CodingKeys.type)
            guard types.count == 1 else { throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Multiple types for '\(name)'") }
            self.type = types.first!
            self.required = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.required) ?? false
            let contents = try container.decodeIfPresent([Content].self, forKey: CodingKeys.content) ?? []
            guard contents.count <= 1 else { throw DecodingError.dataCorruptedError(forKey: .content, in: container, debugDescription: "Multiple contents for '\(name)'") }
            self.content = contents.first
        }

        struct PropertyType: Decodable {
            let kind: String
            let identifier: String?
        }
    }
}
