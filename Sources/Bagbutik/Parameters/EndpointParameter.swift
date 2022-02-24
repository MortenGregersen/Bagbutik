/// Parameter for endpoint
public protocol EndpointParameter {
    var caseName: String { get }
}

extension EndpointParameter {
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

public protocol AssociatedValueParameter: EndpointParameter {
    var value: String { get }
}

extension AssociatedValueParameter {
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

///
public protocol FieldParameter: AssociatedValueParameter {}
public protocol FilterParameter: AssociatedValueParameter {}
public protocol IncludeParameter: EndpointParameter {}

public protocol ExistParameter: EndpointParameter {
    var value: Bool { get }
}

extension ExistParameter {
    public var value: Bool {
        return Mirror(reflecting: self).children.first!.value as! Bool
    }
}

public protocol SortParameter: EndpointParameter {
    var value: String { get }
    var rawValue: String { get }
}

extension SortParameter {
    public var value: String { rawValue }
}

public protocol LimitParameter: EndpointParameter {
    var value: Int { get }
}

extension LimitParameter {
    public var value: Int {
        return Mirror(reflecting: self).children.first!.value as! Int
    }
}
