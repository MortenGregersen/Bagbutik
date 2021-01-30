/// Parameter for endpoint
protocol Parameter {
    var caseName: String { get }
}

extension Parameter {
    var caseName: String {
        // If the case has an associated value, take the name of the case
        guard let rawName = Mirror(reflecting: self).children.first?.label else {
            // Take the name of the case
            return String(describing: self)
        }
        // Reverse the replacement of '.' in parameter names
        return rawName.replacingOccurrences(of: "_", with: ".")
    }
}

// MARK: - Parameter with associated (string) value

protocol AssociatedValueParameter: Parameter {
    var value: String { get }
}

extension AssociatedValueParameter {
    var value: String {
        // Join the string values by commas
        let stringValues: [String]
        if let parameterValues = Mirror(reflecting: self).children.first!.value as? [ParameterValue] {
            stringValues = parameterValues.map(\.rawValue)
        } else {
            stringValues = Mirror(reflecting: self).children.first!.value as! [String]
        }
        return stringValues.joinedByCommas()
    }
}

protocol ParameterValue {
    var rawValue: String { get }
}

// MARK: - Parameter types

///
protocol FieldParameter: AssociatedValueParameter {}
protocol FilterParameter: AssociatedValueParameter {}
protocol IncludeParameter: Parameter {}

protocol ExistParameter: Parameter {
    var value: Bool { get }
}

extension ExistParameter {
    var value: Bool {
        return Mirror(reflecting: self).children.first!.value as! Bool
    }
}

protocol SortParameter: Parameter {
    var value: String { get }
    var rawValue: String { get }
}

extension SortParameter {
    var value: String { rawValue }
}

protocol LimitParameter: Parameter {
    var value: Int { get }
}

extension LimitParameter {
    var value: Int {
        return Mirror(reflecting: self).children.first!.value as! Int
    }
}
