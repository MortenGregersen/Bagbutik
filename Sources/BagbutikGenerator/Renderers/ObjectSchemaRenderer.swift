import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// A renderer which renders object schemas
public class ObjectSchemaRenderer: Renderer {
    /**
     Render a object schema

     - Parameters:
        - objectSchema: The object schema to render
        - otherSchemas: The other schemas (needed for lookup, when creating getters for included types in responses)
     - Returns: The rendered object schema
     */
    public func render(objectSchema: ObjectSchema, otherSchemas: [String: Schema]) async throws -> String {
        var rendered = ""
        var documentation: ObjectDocumentation?
        if case .object(let objectDocumentation) = try await docsLoader.resolveDocumentationForSchema(withDocsUrl: objectSchema.url),
           let abstract = objectDocumentation.abstract {
            documentation = objectDocumentation
            rendered += await renderDocumentationBlock(title: objectDocumentation.title) {
                var documentationContent = [abstract]
                if let discussion = objectDocumentation.discussion {
                    documentationContent.append(discussion)
                }
                documentationContent.append("""
                Full documentation:
                <\(objectSchema.url)>
                """)
                return documentationContent.joined(separator: "\n\n")
            } + "\n"
        }
        var protocols = ["Codable", "Sendable"]
        if objectSchema.properties.keys.contains("id") {
            protocols.append("Identifiable")
        }
        if objectSchema.name.hasSuffix("Request") {
            protocols.append("RequestBody")
        }
        if objectSchema.properties["links"]?.type == .schemaRef("PagedDocumentLinks") {
            protocols.append("PagedResponse")
        }
        protocols.append(contentsOf: objectSchema.additionalProtocols)
        rendered += try await renderStruct(named: objectSchema.name, protocols: protocols) {
            let propertiesInfo = PropertiesInfo(for: objectSchema, documentation: documentation, docsLoader: docsLoader)
            var structContent = [String]()
            if case .arrayOfSchemaRef(let schemaRef) = objectSchema.properties["data"]?.type {
                structContent.append("public typealias Data = \(schemaRef)")
            }
            structContent.append(propertiesInfo.properties.map { property in
                guard let description = property.documentation?.description, description.lengthOfBytes(using: .utf8) > 0 else { return property.rendered }
                return """
                /// \(description)
                \(property.rendered)
                """
            }.joined(separator: "\n"))
            let createInitContent = { (propertyNames: [PropertyName]) -> String in
                propertyNames.map {
                    "self.\($0.safeName) = \($0.safeName)"
                }.joined(separator: "\n")
            }
            if let deprecatedPublicInitParameters = propertiesInfo.deprecatedPublicInitParameters {
                structContent.append(renderInitializer(parameters: deprecatedPublicInitParameters, deprecated: true, content: { createInitContent(propertiesInfo.deprecatedPublicInitPropertyNames) }))
            }
            if propertiesInfo.deprecatedPublicInitParameters != propertiesInfo.publicInitParameters {
                structContent.append(renderInitializer(parameters: propertiesInfo.publicInitParameters, content: { createInitContent(propertiesInfo.publicInitPropertyNames) }))
            }
            structContent.append(renderInitializer(parameters: [.init(prefix: "from", name: "decoder", type: "Decoder")], throwing: true, content: {
                var functionContent = "let container = try decoder.container(keyedBy: AnyCodingKey.self)\n"
                functionContent += propertiesInfo.decodableProperties.map { decodableProperty in
                    if decodableProperty.clearable {
                        "\(decodableProperty.name.safeName) = try container.decodeIfPresent(Clearable<\(decodableProperty.type)>.self, forKey: \"\(decodableProperty.name.idealName)\")"
                    } else if decodableProperty.optional {
                        "\(decodableProperty.name.safeName) = try container.decodeIfPresent(\(decodableProperty.type).self, forKey: \"\(decodableProperty.name.idealName)\")"
                    } else {
                        "\(decodableProperty.name.safeName) = try container.decode(\(decodableProperty.type).self, forKey: \"\(decodableProperty.name.idealName)\")"
                    }
                }.joined(separator: "\n")
                if propertiesInfo.hasTypeConstant {
                    functionContent += #"""

                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                    """#
                }
                return functionContent
            }))
            structContent.append(renderFunction(named: "encode", parameters: [.init(prefix: "to", name: "encoder", type: "Encoder")], throwing: true, content: {
                var functionContent = "var container = encoder.container(keyedBy: AnyCodingKey.self)\n"
                functionContent += propertiesInfo.encodableProperties.map { encodableProperty in
                    if encodableProperty.clearable || encodableProperty.optional, !encodableProperty.nullCodable {
                        "try container.encodeIfPresent(\(encodableProperty.name.safeName), forKey: \"\(encodableProperty.name.idealName)\")"
                    } else {
                        "try container.encode(\(encodableProperty.name.safeName), forKey: \"\(encodableProperty.name.idealName)\")"
                    }
                }.joined(separator: "\n")
                return functionContent
            }))
            structContent.append(contentsOf: createIncludedGetters(for: objectSchema, otherSchemas: otherSchemas))

            for subSchema in objectSchema.subSchemas {
                switch subSchema {
                case .objectSchema(let objectSchema):
                    try await structContent.append(render(objectSchema: objectSchema, otherSchemas: otherSchemas))
                case .enumSchema(let enumSchema):
                    try await structContent.append(EnumSchemaRenderer(docsLoader: docsLoader).render(enumSchema: enumSchema))
                case .oneOf(let name, let oneOfSchema):
                    try await structContent.append(OneOfSchemaRenderer(docsLoader: docsLoader).render(name: name, oneOfSchema: oneOfSchema))
                }
            }
            return structContent.joined(separator: "\n\n")
        }
        return try format(rendered)
    }

    private struct PropertiesInfo {
        let properties: [RenderProperty]
        let deprecatedPublicInitParameters: [FunctionParameter]?
        let deprecatedPublicInitPropertyNames: [PropertyName]
        let publicInitParameters: [FunctionParameter]
        let publicInitPropertyNames: [PropertyName]
        let encodableProperties: [CodableProperty]
        let decodableProperties: [CodableProperty]
        let hasTypeConstant: Bool

        init(for objectSchema: ObjectSchema, documentation: ObjectDocumentation?, docsLoader: DocsLoader) {
            var objectSchema = objectSchema
            let sortedProperties = objectSchema.properties.sorted {
                // To avoid breaking the public initializer parameter order from version 2.0,
                // the `attributes` and `relationships` properties has to be last
                if $1.key == "relationships" { return true }
                else if $0.key == "relationships" { return false }
                else if $1.key == "attributes" { return true }
                else if $0.key == "attributes" { return false }
                return $0.key < $1.key
            }
            let initParameters = sortedProperties.filter { !$0.value.type.isConstant }
            properties = sortedProperties.map { property -> RenderProperty in
                let rendered: String
                switch property.value.type {
                case .constant(let value):
                    rendered = PropertyRenderer(docsLoader: docsLoader)
                        .renderConstant(id: property.key, type: "String", value: "\"\(value)\"")
                default:
                    let id = PropertyName(idealName: property.key).safeName
                    let type = property.value.type.description
                    if id == "data" && objectSchema.name.hasSuffix("LinkageRequest") {
                        // The `data` property is marked as required, it is required, but the value is really optional.
                        // It can be nil, but it still needs to be in the encoded data.
                        objectSchema.requiredProperties.removeAll(where: { $0 == property.key })
                    }
                    let isOptional = !objectSchema.requiredProperties.contains(property.key)
                    var wrapper = ""
                    if id == "data", type == "Data" || type == "[Data]" || type == "[Item]", isOptional {
                        wrapper += "@NullCodable "
                    }
                    rendered = wrapper + PropertyRenderer(docsLoader: docsLoader)
                        .renderProperty(id: id,
                                        type: type,
                                        optional: isOptional,
                                        isSimpleType: property.value.type.isSimple,
                                        deprecated: property.value.deprecated,
                                        clearable: property.value.clearable)
                }
                let propertyDocumentation = documentation?.properties[property.key]
                return RenderProperty(rendered: rendered, documentation: propertyDocumentation, deprecated: property.value.deprecated)
            }
            deprecatedPublicInitParameters = initParameters.contains(where: \.value.deprecated)
                ? Self.createFunctionParameters(from: initParameters, requiredProperties: objectSchema.requiredProperties) : nil
            deprecatedPublicInitPropertyNames = initParameters.map { PropertyName(idealName: $0.key) }
            publicInitParameters = Self.createFunctionParameters(from: initParameters.filter { !$0.value.deprecated || objectSchema.requiredProperties.contains($0.key) }, requiredProperties: objectSchema.requiredProperties)
            publicInitPropertyNames = initParameters.filter { !$0.value.deprecated }.map { PropertyName(idealName: $0.key) }
            let hasTypeConstant = sortedProperties.contains { $0.key == "type" && $0.value.type.isConstant }
            self.hasTypeConstant = hasTypeConstant
            encodableProperties = sortedProperties.map {
                let propertyName = PropertyName(idealName: $0.key)
                let type = $0.value.type.description
                return CodableProperty(
                    name: propertyName,
                    type: $0.value.type.description,
                    optional: !objectSchema.requiredProperties.contains($0.key) && $0.key != "type",
                    nullCodable: propertyName.safeName == "data" && type == "Data" || type == "[Data]" || type == "[Item]",
                    clearable: $0.value.clearable)
            }
            decodableProperties = encodableProperties.filter { !hasTypeConstant || $0.name.idealName != "type" }
        }

        private static func createFunctionParameters(from parameters: [Dictionary<String, Property>.Element], requiredProperties: [String]) -> [FunctionParameter] {
            parameters.map {
                let propertyName = PropertyName(idealName: $0.key)
                let prefix: String?
                let name: String
                if propertyName.hasDifferentSafeName {
                    prefix = propertyName.idealName
                    name = propertyName.safeName
                } else {
                    prefix = nil
                    name = propertyName.idealName
                }
                return FunctionParameter(prefix: prefix,
                                         name: name,
                                         type: $0.value.type.description.capitalizingFirstLetter(),
                                         optional: !requiredProperties.contains($0.key),
                                         clearable: $0.value.clearable)
            }
        }
    }

    private func createIncludedGetters(for objectSchema: ObjectSchema, otherSchemas: [String: Schema]) -> [String] {
        guard let includedProperty = objectSchema.properties["included"],
              let dataProperty = objectSchema.properties["data"] else { return [] }
        let dataSchemaName: String
        let parameters: [FunctionParameter]
        let isPagedGetter: Bool
        if case .arrayOfSchemaRef(let schemaName) = dataProperty.type {
            dataSchemaName = schemaName
            parameters = [.init(prefix: "for", name: dataSchemaName.lowercasedFirstLetter(), type: schemaName)]
            isPagedGetter = true
        } else if case .schemaRef(let schemaName) = dataProperty.type {
            dataSchemaName = schemaName
            parameters = []
            isPagedGetter = false
        } else {
            return []
        }
        guard case .object(let dataSchema) = otherSchemas[dataSchemaName],
              case .schema(let relationshipsSchema) = dataSchema.properties["relationships"]?.type else { return [] }
        return relationshipsSchema.properties.sorted(by: { $0.key < $1.key }).compactMap { relationship -> String? in
            guard !relationship.value.deprecated, case .schema(let relationshipPropertySchema) = relationship.value.type else { return nil }
            let pagedType = dataSchemaName.lowercasedFirstLetter()
            let relationshipDataProperty = relationshipPropertySchema.properties["data"]
            let relationshipDataSchema: ObjectSchema
            let isArrayReturnType: Bool
            if case .schema(let schema) = relationshipDataProperty?.type {
                relationshipDataSchema = schema
                isArrayReturnType = false
            } else if case .arrayOfSubSchema(let schema) = relationshipDataProperty?.type {
                relationshipDataSchema = schema
                isArrayReturnType = true
            } else {
                return nil
            }
            guard case .constant(let relationshipType) = relationshipDataSchema.properties["type"]?.type else { return nil }
            let includedSchemaName: String
            let relationshipSingular = relationship.key.singularized()
            let guardIds = if isPagedGetter {
                "guard let \(relationshipSingular)Ids = \(pagedType).relationships?.\(relationship.key)?.data?.map(\\.id)"
            } else {
                "guard let \(relationshipSingular)Ids = data.relationships?.\(relationship.key)?.data?.map(\\.id)"
            }
            let firstFilter = if isPagedGetter {
                ".first { $0.id == \(pagedType).relationships?.\(relationship.key)?.data?.id }"
            } else {
                ".first { $0.id == data.relationships?.\(relationship.key)?.data?.id }"
            }
            let functionContent: String
            if case .arrayOfSchemaRef(let includedSchemaRef) = includedProperty.type, case .arrayOfSchemaRef = dataProperty.type {
                includedSchemaName = includedSchemaRef
                if isArrayReturnType {
                    functionContent = """
                    \(guardIds) else { return [] }
                    return included?.filter { \(relationshipSingular)Ids.contains($0.id) } ?? []
                    """
                } else {
                    functionContent = """
                    included?\(firstFilter)
                    """
                }
            } else if case .arrayOfOneOf(_, let includedOneOf) = includedProperty.type {
                let includedSchemaNames = includedOneOf.options.map(\.typeName)
                guard let foundIncludedSchemaName = includedSchemaNames.compactMap({ includedSchemaName -> String? in
                    if case .object(let includedSchema) = otherSchemas[includedSchemaName],
                       case .constant(let includedType) = includedSchema.properties["type"]?.type,
                       includedType == relationshipType {
                        return includedSchemaName
                    }
                    return nil
                }).first else { return nil }
                includedSchemaName = foundIncludedSchemaName
                let includedCase = includedSchemaName.lowercasedFirstLetter()
                if isArrayReturnType {
                    functionContent = """
                    \(guardIds),
                          let \(relationship.key) = included?.compactMap({ relationship -> \(includedSchemaName)? in
                              guard case let .\(includedCase)(\(relationshipSingular)) = relationship else { return nil }
                              return \(relationshipSingular)Ids.contains(\(relationshipSingular).id) ? \(relationshipSingular) : nil
                          }) else {
                        return []
                    }
                    return \(relationship.key)
                    """
                } else {
                    functionContent = """
                    included?.compactMap { relationship -> \(includedSchemaName)? in
                        guard case let .\(includedCase)(\(relationship.key)) = relationship else { return nil }
                        return \(relationship.key)
                    }\(firstFilter)
                    """
                }
            } else {
                return nil
            }
            let functionName = "get\(relationship.key.capitalizingFirstLetter())"
            let returnType = isArrayReturnType ? "[\(includedSchemaName)]" : "\(includedSchemaName)?"
            return renderFunction(named: functionName, parameters: parameters, returnType: returnType) {
                functionContent
            }
        }
    }

    private struct RenderProperty {
        let rendered: String
        let documentation: PropertyDocumentation?
        let deprecated: Bool
    }

    private struct PropertyName {
        let idealName: String
        let safeName: String
        var hasDifferentSafeName: Bool { idealName != safeName }

        init(idealName: String) {
            self.idealName = idealName
            safeName = idealName == "self" ? "itself" : idealName
        }
    }

    private struct CodableProperty {
        let name: PropertyName
        let type: String
        let optional: Bool
        let nullCodable: Bool
        let clearable: Bool
    }
}
