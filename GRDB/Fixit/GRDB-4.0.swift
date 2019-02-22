import Dispatch

// Fixits for changes introduced by GRDB 4.0.0

extension Cursor {
    @available(*, unavailable, renamed: "compactMap")
    public func flatMap<ElementOfResult>(_ transform: @escaping (Element) throws -> ElementOfResult?) -> MapCursor<FilterCursor<MapCursor<Self, ElementOfResult?>>, ElementOfResult> { preconditionFailure() }
}

extension DatabaseWriter {
    @available(*, unavailable, message: "Use concurrentRead instead")
    public func readFromCurrentState(_ block: @escaping (Database) -> Void) throws { preconditionFailure() }
}

extension ValueObservation {
    @available(*, unavailable, message: "Provide the reducer in a (Database) -> Reducer closure")
    public static func tracking(_ regions: DatabaseRegionConvertible..., reducer: Reducer) -> ValueObservation { preconditionFailure() }
    
    @available(*, unavailable, message: "Use distinctUntilChanged() instead")
    public static func tracking<Value>(_ regions: DatabaseRegionConvertible..., fetchDistinct fetch: @escaping (Database) throws -> Value) -> ValueObservation<DistinctUntilChangedValueReducer<RawValueReducer<Value>>> where Value: Equatable { preconditionFailure() }
}

@available(*, unavailable, renamed: "FastDatabaseValueCursor")
public typealias ColumnCursor<Value: DatabaseValueConvertible & StatementColumnConvertible> = FastDatabaseValueCursor<Value>

@available(*, unavailable, renamed: "FastNullableDatabaseValueCursor")
public typealias NullableColumnCursor<Value: DatabaseValueConvertible & StatementColumnConvertible> = FastNullableDatabaseValueCursor<Value>

extension Database {
    @available(*, unavailable, renamed: "execute(sql:arguments:)")
    public func execute(_ sql: String, arguments: StatementArguments? = nil) throws { preconditionFailure() }
    
    @available(*, unavailable, renamed: "makeSelectStatement(sql:)")
    public func makeSelectStatement(_ sql: String) throws -> SelectStatement { preconditionFailure() }
    
    @available(*, unavailable, renamed: "cachedSelectStatement(sql:)")
    public func cachedSelectStatement(_ sql: String) throws -> SelectStatement { preconditionFailure() }
    
    @available(*, unavailable, renamed: "makeUpdateStatement(sql:)")
    public func makeUpdateStatement(_ sql: String) throws -> UpdateStatement { preconditionFailure() }
    
    @available(*, unavailable, renamed: "cachedUpdateStatement(sql:)")
    public func cachedUpdateStatement(_ sql: String) throws -> UpdateStatement { preconditionFailure() }
}

extension DatabaseValueConvertible {
    @available(*, unavailable, renamed: "fetchCursor(_:sql:arguments:adapter:)")
    public static func fetchCursor(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> DatabaseValueCursor<Self> { preconditionFailure() }
    
    @available(*, unavailable, renamed: "fetchAll(_:sql:arguments:adapter:)")
    public static func fetchAll(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> [Self] { preconditionFailure() }
    
    @available(*, unavailable, renamed: "fetchOne(_:sql:arguments:adapter:)")
    public static func fetchOne(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> Self? { preconditionFailure() }
}

extension Optional where Wrapped: DatabaseValueConvertible {
    @available(*, unavailable, renamed: "fetchCursor(_:sql:arguments:adapter:)")
    public static func fetchCursor(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> NullableDatabaseValueCursor<Wrapped> { preconditionFailure() }
    
    @available(*, unavailable, renamed: "fetchAll(_:sql:arguments:adapter:)")
    public static func fetchAll(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> [Wrapped?] { preconditionFailure() }
}

extension Row {
    @available(*, unavailable, renamed: "fetchCursor(_:sql:arguments:adapter:)")
    public static func fetchCursor(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> RowCursor { preconditionFailure() }
    
    @available(*, unavailable, renamed: "fetchAll(_:sql:arguments:adapter:)")
    public static func fetchAll(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> [Row] { preconditionFailure() }
    
    @available(*, unavailable, renamed: "fetchOne(_:sql:arguments:adapter:)")
    public static func fetchOne(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> Row? { preconditionFailure() }
}

extension DatabaseValueConvertible where Self: StatementColumnConvertible {
    @available(*, unavailable, renamed: "fetchCursor(_:sql:arguments:adapter:)")
    public static func fetchCursor(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> FastDatabaseValueCursor<Self> { preconditionFailure() }
}

extension Optional where Wrapped: DatabaseValueConvertible & StatementColumnConvertible {
    @available(*, unavailable, renamed: "fetchCursor(_:sql:arguments:adapter:)")
    public static func fetchCursor(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> FastNullableDatabaseValueCursor<Wrapped> { preconditionFailure() }
}

extension FetchableRecord {
    @available(*, unavailable, renamed: "fetchCursor(_:sql:arguments:adapter:)")
    public static func fetchCursor(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> RecordCursor<Self> { preconditionFailure() }
    
    @available(*, unavailable, renamed: "fetchAll(_:sql:arguments:adapter:)")
    public static func fetchAll(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> [Self] { preconditionFailure() }
    
    @available(*, unavailable, renamed: "fetchOne(_:sql:arguments:adapter:)")
    public static func fetchOne(_ db: Database, _ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil) throws -> Self? { preconditionFailure() }
}

extension SQLRequest {
    @available(*, unavailable, renamed: "init(sql:arguments:adapter:cached:)")
    public init(_ sql: String, arguments: StatementArguments? = nil, adapter: RowAdapter? = nil, cached: Bool = false) { preconditionFailure() }
}

extension SQLExpressionLiteral {
    @available(*, unavailable, renamed: "init(sql:arguments:)")
    public init(_ sql: String, arguments: StatementArguments? = nil) { preconditionFailure() }
}

extension SQLExpression {
    @available(*, unavailable, message: "Use sqlLiteral property instead")
    public var literal: SQLExpressionLiteral { preconditionFailure() }
}