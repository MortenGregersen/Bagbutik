import BagbutikSpecDecoder
import Foundation
import PathKit

public class Generator {
    public static func generateAll(specPath: String, outputPath: String) throws {
        let generator = Generator()
        let spec = try generator.loadSpec(specPath: specPath)
        let outputDir = PathKit.Path(outputPath)
        let endpointsDirPath = outputDir + PathKit.Path("Endpoints")
        try endpointsDirPath.deleteChildren()
        try spec.paths.values.sorted(by: { $0.path < $1.path }).forEach { path in
            try generator.generateEndpoints(for: path, endpointsDirPath: endpointsDirPath)
        }
        let modelsDirPath = outputDir + PathKit.Path("Models")
        try modelsDirPath.deleteChildren()
        try spec.components.schemas.values.sorted(by: { $0.name < $1.name }).forEach { schema in
            let includesFixUps = spec.includesFixUps[schema.name] ?? []
            try generator.generateModel(for: schema, includesFixUps: includesFixUps, modelsDirPath: modelsDirPath)
        }
        let operationsCount = spec.paths.reduce(into: 0) { $0 += $1.value.operations.count }
        print("🎉 Finished generating \(operationsCount) endpoints and \(spec.components.schemas.count) models! 🎉")
    }

    private func loadSpec(specPath: String) throws -> Spec {
        let specUrl = URL(fileURLWithPath: specPath)
        let specData = try Data(contentsOf: specUrl)
        return try JSONDecoder().decode(Spec.self, from: specData)
    }

    private func generateEndpoints(for path: BagbutikSpecDecoder.Path, endpointsDirPath: PathKit.Path) throws {
        let dirPath = endpointsDirPath + PathKit.Path(path.info.mainType)
        try path.operations.forEach { operation in
            var operationDirPath = dirPath
            if path.info.isRelationship {
                operationDirPath = operationDirPath + PathKit.Path("Relationships")
            }
            let filePath = operationDirPath + PathKit.Path("\(operation.name.capitalizingFirstLetter()).swift")
            print("⚡️ Generating endpoint \(operation.name.capitalizingFirstLetter())...")
            try operationDirPath.mkpath()
            let renderedOperation = try OperationRenderer().render(operation: operation, in: path)
            try filePath.write(renderedOperation)
        }
    }

    private func generateModel(for schema: Schema, includesFixUps: [String], modelsDirPath: PathKit.Path) throws {
        let filePath = modelsDirPath + PathKit.Path("\(schema.name).swift")
        print("⚡️ Generating model \(schema.name)...")
        try modelsDirPath.mkdirIfNotExists()
        let renderedSchema: String
        switch schema {
        case .enum(let enumSchema):
            renderedSchema = try EnumSchemaRenderer().render(enumSchema: enumSchema)
        case .object(let objectSchema):
            renderedSchema = try ObjectSchemaRenderer().render(objectSchema: objectSchema, includesFixUps: includesFixUps)
        }
        let fileContents = """
        import Foundation

        \(renderedSchema)
        """
        try filePath.write(fileContents)
    }
}

extension PathKit.Path {
    func deleteChildren() throws {
        try delete()
        try mkdir()
    }

    func mkdirIfNotExists() throws {
        if !exists { try mkdir() }
    }
}
