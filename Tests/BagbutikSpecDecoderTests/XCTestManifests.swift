import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DynamicCodingKeysTests.allTests),
        testCase(StringCasingTests.allTests),
        testCase(OperationTests.allTests),
        testCase(ParameterTests.allTests),
        testCase(PathTests.allTests),
        testCase(EnumCaseTests.allTests),
        testCase(EnumSchemaTests.allTests),
        testCase(ObjectSchemaTests.allTests),
        testCase(OneOfOptionTests.allTests),
        testCase(PropertyTypeTests.allTests),
        testCase(SchemaTests.allTests),
        testCase(SimplePropertyTypeTests.allTests),
        testCase(SpecTests.allTests),
    ]
}
#endif
