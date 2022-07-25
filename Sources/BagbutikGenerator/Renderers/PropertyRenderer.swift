internal class PropertyRenderer: Renderer {
    func render(id: String, type: String, optional: Bool, isSimpleType: Bool, deprecated: Bool = false) throws -> String {
        var rendered = ""
        if deprecated {
            rendered += #"@available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")"#
            rendered += "\n"
        }
        if id == "data" && (type == "Data" || type == "[Data]") && optional {
            rendered += "@NullCodable "
        }
        let propertyType = deprecated || optional ? "var" : "let"
        rendered += "public \(propertyType) \(escapeReservedKeywords(in: id)): \(type.capitalizingFirstLetter())"
        if optional {
            rendered += "?"
        }
        if deprecated {
            rendered += " = nil"
        }
        return rendered
    }
}
