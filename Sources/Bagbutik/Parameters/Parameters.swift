import Foundation

public struct Parameters {
    public let fields: [FieldParameter]?
    public let filters: [FilterParameter]?
    public let exists: [ExistParameter]?
    public let includes: [IncludeParameter]?
    public let sorts: [SortParameter]?
    public let limits: [LimitParameter]?
    public let limit: Int?
    
    public init(fields: [FieldParameter]? = nil,
                filters: [FilterParameter]? = nil,
                exists: [ExistParameter]? = nil,
                includes: [IncludeParameter]? = nil,
                sorts: [SortParameter]? = nil,
                limits: [LimitParameter]? = nil,
                limit: Int? = nil) {
        self.fields = fields
        self.filters = filters
        self.exists = exists
        self.includes = includes
        self.sorts = sorts
        self.limits = limits
        self.limit = limit
    }
}
