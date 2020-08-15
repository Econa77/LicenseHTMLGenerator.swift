import Foundation
import PathKit

public struct GeneratorOption {

    // MARK: - Properties
    public let outputFilePath: Path
    public let configPath: Path
    public let templatePath: Path?

    // MARK: - Initialize
    public init(outputPath: String, fileName: String, configPath: String, templatePath: String?) {
        self.outputFilePath = Path("\(outputPath)/\(fileName)")
        self.configPath = Path(configPath)
        self.templatePath = templatePath.map { Path($0) }
    }

}
