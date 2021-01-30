import Foundation

struct Parameters {
    let fields: [FieldParameter]?
    let filters: [FilterParameter]?
    let exists: [ExistParameter]?
    let includes: [IncludeParameter]?
    let sorts: [SortParameter]?
    let limits: [LimitParameter]?
    let limit: Int?
    
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
