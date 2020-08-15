import Foundation
import Yaml
import PathKit
import Stencil

public class LicenseHTMLGenerator {

    // MARK: - Properties
    private let option: GeneratorOption

    // MARK: - Initialize
    public init(option: GeneratorOption) {
        self.option = option
    }

    // MARK: - Run
    public func run() throws {
        let yaml = try Yaml.load(option.configPath.read())
        let licenses = try yaml["licenses"].array?.compactMap { try License.load(with: $0) }.sorted(by: { $0.name < $1.name }) ?? []
        let rendered = try renderTemplate(with: licenses)
        try write(with: rendered, path: option.outputFilePath)
    }

    private func renderTemplate(with licenses: [License]) throws -> String {
        guard let templatePath = option.templatePath else {
            let template = Template(templateString: HTMLTemplate.basicTemplate)
            return try template.render(["licenses": licenses])
        }
        let environment = Environment(loader: FileSystemLoader(paths: [templatePath.parent()]))
        return try environment.renderTemplate(name: templatePath.lastComponent, context: ["licenses": licenses])
    }

    private func write(with html: String, path: Path) throws {
        if !path.parent().exists {
            try path.parent().mkdir()
        }
        if path.exists {
            try path.delete()
        }
        try path.write(html, encoding: .utf8)
    }

}
