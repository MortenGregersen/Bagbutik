internal class PropertyRenderer: Renderer {
    func renderProperty(id: String, type: String, access: String = "public", optional: Bool, isSimpleType: Bool, deprecated: Bool = false) -> String {
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
    
    func renderConstant(id: String, type: String, access: String = "public", value: String) -> String {
        return "\(access) var \(escapeReservedKeywords(in: id)): \(type) { \(value) }"
    }
}
