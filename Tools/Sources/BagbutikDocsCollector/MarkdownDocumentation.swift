import Foundation

public enum DocumentationKind: Sendable {
    case `enum`
    case `typealias`
    case object
    case operation
}

enum MarkdownDocumentationError: Error, Equatable {
    case invalidText
    case missingMetadata
    case invalidMetadata
    case unsupportedIdentifier(String)
}

struct MarkdownDocumentation {
    private struct Metadata: Decodable {
        let identifier: String
        let title: String
    }

    static func parse(_ data: Data, as kind: DocumentationKind) throws -> Documentation {
        guard let source = String(data: data, encoding: .utf8) else { throw MarkdownDocumentationError.invalidText }
        let metadata = try parseMetadata(from: source)
        guard metadata.identifier.hasPrefix("/documentation/") else { throw MarkdownDocumentationError.unsupportedIdentifier(metadata.identifier) }
        let identifier = "doc://com.apple.appstoreconnectapi" + metadata.identifier
        let body = sourceAfterMetadata(in: source)
        let abstract = firstProseBlock(afterTopLevelHeadingIn: body)
        let discussion = section(named: "Discussion", in: body)
        switch kind {
        case .enum: return .enum(.init(id: identifier, title: metadata.title, abstract: abstract, discussion: discussion))
        case .typealias: return .typealias(.init(id: identifier, title: metadata.title, abstract: abstract, discussion: discussion))
        case .object: return .object(.init(id: identifier, title: metadata.title, abstract: abstract, discussion: discussion))
        case .operation: return .operation(.init(id: identifier, title: metadata.title, abstract: abstract, discussion: discussion))
        }
    }

    private static func parseMetadata(from source: String) throws -> Metadata {
        guard source.hasPrefix("<!--"), let end = source.range(of: "-->") else { throw MarkdownDocumentationError.missingMetadata }
        let json = source[source.index(source.startIndex, offsetBy: 4)..<end.lowerBound]
        guard let data = String(json).data(using: .utf8) else { throw MarkdownDocumentationError.invalidMetadata }
        do { return try JSONDecoder().decode(Metadata.self, from: data) }
        catch { throw MarkdownDocumentationError.invalidMetadata }
    }

    private static func sourceAfterMetadata(in source: String) -> Substring {
        guard let end = source.range(of: "-->") else { return Substring(source) }
        return source[end.upperBound...]
    }

    private static func firstProseBlock(afterTopLevelHeadingIn source: Substring) -> String? {
        let lines = source.split(separator: "\n", omittingEmptySubsequences: false)
        guard let headingIndex = lines.firstIndex(where: { $0.hasPrefix("# ") }) else { return nil }
        return proseBlock(in: lines.dropFirst(headingIndex + 1))
    }

    private static func section(named name: String, in source: Substring) -> String? {
        let lines = source.split(separator: "\n", omittingEmptySubsequences: false)
        guard let headingIndex = lines.firstIndex(where: { $0 == "## \(name)" }) else { return nil }
        return proseBlock(in: lines.dropFirst(headingIndex + 1), stopsAtHeading: true)
    }

    private static func proseBlock<S: Collection>(in lines: S, stopsAtHeading: Bool = false) -> String? where S.Element == Substring {
        var result = [Substring]()
        var isInCodeBlock = false
        for line in lines {
            if line.hasPrefix("```") {
                isInCodeBlock.toggle()
                if result.isEmpty { continue }
                break
            }
            if isInCodeBlock { continue }
            if line == "---" || (stopsAtHeading && line.hasPrefix("## ")) { break }
            if line.isEmpty {
                if !result.isEmpty { break }
                continue
            }
            if line.hasPrefix("#") {
                if result.isEmpty { continue }
                break
            }
            result.append(line)
        }
        let prose = result.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines)
        return prose.isEmpty ? nil : prose
    }
}
