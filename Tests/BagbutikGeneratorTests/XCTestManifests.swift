import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AttributesSchemaRendererTests.allTests),
        testCase(EnumSchemaRendererTests.allTests),
        testCase(ObjectSchemaRendererTests.allTests),
        testCase(OneOfSchemaRendererTests.allTests),
        testCase(OperationRendererTests.allTests),
        testCase(PropertyRendererTests.allTests),
        testCase(GeneratorTests.allTests),
    ]
}
#endif
