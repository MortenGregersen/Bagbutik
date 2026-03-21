/// A parameter type that can be converted into the query key expected by an endpoint.
public protocol EndpointParameter: Sendable {
    /// The name of the case to use as value for the parameter.
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

/// A parameter whose associated value becomes the query value.
public protocol AssociatedValueParameter: EndpointParameter {
    /// The comma separated list values to use as value for the parameter.
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

/// A string backed value that can be encoded into a query parameter.
public protocol ParameterValue {
    /// The raw value for the parameter value.
    var rawValue: String { get }
}

// MARK: - Parameter types

/// Parameter for selecting which fields to return for included related resources.
public protocol FieldParameter: AssociatedValueParameter {}
/// Parameter describing which attributes, relationships, or IDs to filter by.
public protocol FilterParameter: AssociatedValueParameter {}
/// Parameter for which relationship data to include in the response.
public protocol IncludeParameter: EndpointParameter {}

/// Parameter for including/excluding where a value exists.
public protocol ExistParameter: EndpointParameter {
    /// The value for the parameter.
    var value: Bool { get }
}

extension ExistParameter {
    /// The value for the parameter.
    public var value: Bool {
        return Mirror(reflecting: self).children.first!.value as! Bool
    }
}

/// Parameter describing how the response should be sorted.
public protocol SortParameter: EndpointParameter {
    /// The value for the parameter.
    var value: String { get }
    /// The raw value for the parameter value.
    var rawValue: String { get }
}

extension SortParameter {
    /// The value for the parameter.
    public var value: String { rawValue }
}

/// Parameter describing a limit value for the response.
public protocol LimitParameter: EndpointParameter {
    /// The value for the parameter.
    var value: Int { get }
}

extension LimitParameter {
    /// The value for the parameter.
    public var value: Int {
        return Mirror(reflecting: self).children.first!.value as! Int
    }
}
