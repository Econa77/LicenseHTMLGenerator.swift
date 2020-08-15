import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LicenseHTMLGenerator_swiftTests.allTests),
    ]
}
#endif
