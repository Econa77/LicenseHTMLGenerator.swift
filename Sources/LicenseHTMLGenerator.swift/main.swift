import ArgumentParser
import LicenseHTMLGeneratorKit

struct Generator: ParsableCommand {

    // MARK: - Properties
    @Option(name: .shortAndLong)
    var outputPath: String = "Generated"

    @Option(name: .shortAndLong)
    var fileName: String = "license.html"

    @Option(name: .shortAndLong)
    var configPath: String = "config.yml"

    @Option(name: [.short, .customLong("template")])
    var templatePath: String?

    static var _commandName: String = "license-html-generator"

    func run() throws {
        let option = GeneratorOption(outputPath: outputPath, fileName: fileName, configPath: configPath, templatePath: templatePath)
        let generator = LicenseHTMLGenerator(option: option)
        try generator.run()
    }

}

Generator.main()
