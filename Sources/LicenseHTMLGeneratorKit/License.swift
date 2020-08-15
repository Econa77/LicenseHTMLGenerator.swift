import Foundation
import Yaml

struct License {

    // MARK: - Properties
    let url: String
    let name: String
    let body: String

    static let urlSession = URLSession(configuration: .default)

    // MARK: - Initialize
    static func load(with yaml: Yaml) throws -> License? {
        guard let url = yaml["url"].string else { return nil }
        guard let name = yaml["name"].string else { return nil }
        var license: License?
        if let body = yaml["body"].string {
            return License(url: url, name: name, body: body)
        } else if let licenseURLString = yaml["license_url"].string, let licenseURL = URL(string: licenseURLString) {
            let semaphore = DispatchSemaphore(value: 0)
            let task = urlSession.dataTask(with: licenseURL) { data, a, b in
                guard let data = data, let body = String(data: data, encoding: .utf8) else {
                    fatalError("Failed to load the license text.")
                }
                license = License(url: url, name: name, body: body)
                semaphore.signal()
            }
            task.resume()
            semaphore.wait()
            return license
        }
        return nil
    }

}
