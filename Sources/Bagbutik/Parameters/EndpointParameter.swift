/// Parameter for an endpoint
public protocol EndpointParameter {
    var caseName: String { get }
}

extension EndpointParameter {
    /// The name of the case to use as value for the parameter.
    public var caseName: String {
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

/// Parameter with an associated (string) value.
public protocol AssociatedValueParameter: EndpointParameter {
    var value: String { get }
}

extension AssociatedValueParameter {
    /// The comma separated list values to use as value for the parameter.
    public var value: String {
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

/// Parameter for selecting which fields to return for included related types.
public protocol FieldParameter: AssociatedValueParameter {}
/// Parameter for by which attributes, relationships, and IDs to filter.
public protocol FilterParameter: AssociatedValueParameter {}
/// Parameter for which relationship data to include in the response.
public protocol IncludeParameter: EndpointParameter {}

/// Parameter for including/excluding where a value exists.
public protocol ExistParameter: EndpointParameter {
    var value: Bool { get }
}

extension ExistParameter {
    /// The value to for the parameter.
    public var value: Bool {
        return Mirror(reflecting: self).children.first!.value as! Bool
    }
}

/// Parameter for by which attributes to sort.
public protocol SortParameter: EndpointParameter {
    var value: String { get }
    var rawValue: String { get }
}

extension SortParameter {
    /// The value to for the parameter.
    public var value: String { rawValue }
}

/// Parameter for number of resources to return.
public protocol LimitParameter: EndpointParameter {
    var value: Int { get }
}

extension LimitParameter {
    /// The value to for the parameter.
    public var value: Int {
        return Mirror(reflecting: self).children.first!.value as! Int
    }
}
