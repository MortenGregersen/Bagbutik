import Foundation

/// The parameters for a `Request`.
public struct Parameters {
    /// Fields to return for included related types.
    public let fields: [FieldParameter]?
    /// Attributes, relationships, and IDs by which to filter
    public let filters: [FilterParameter]?
    /// Attributes, relationships, and IDs to check for existence
    public let exists: [ExistParameter]?
    /// Relationship data to include in the response
    public let includes: [IncludeParameter]?
    /// Attributes by which to sort
    public let sorts: [SortParameter]?
    /// Number of resources to return
    public let limits: [LimitParameter]?
    /// Number of resources to return
    public let limit: Int?
    /// Custom parameters for an operation
    public let customs: [String: String]?

    /**
     Create a new `Parameters` with the specified parameters.

     - Parameters:
        - fields: Fields to return for included related types.
        - filters: Attributes, relationships, and IDs by which to filter
        - exists: Attributes, relationships, and IDs to check for existence
        - includes: Relationship data to include in the response
        - sorts: Attributes by which to sort
        - limits: Number of resources to return
        - limit: Number of resources to return
        - customs: Custom parameters for an operation
     */
    public init(fields: [FieldParameter]? = nil,
                filters: [FilterParameter]? = nil,
                exists: [ExistParameter]? = nil,
                includes: [IncludeParameter]? = nil,
                sorts: [SortParameter]? = nil,
                limits: [LimitParameter]? = nil,
                limit: Int? = nil,
                customs: [String: String]? = nil) {
        self.fields = fields
        self.filters = filters
        self.exists = exists
        self.includes = includes
        self.sorts = sorts
        self.limits = limits
        self.limit = limit
        self.customs = customs
    }
}
