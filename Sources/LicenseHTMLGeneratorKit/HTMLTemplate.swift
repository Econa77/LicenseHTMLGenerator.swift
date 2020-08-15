import Foundation

struct HTMLTemplate {
    static var basicTemplate: String {
        return """
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Acknowledgements</title>
    </head>
    <body>
        <h1>Acknowledgements</h1>
        <p>
            This project makes use of the following third party libraries:
        </p>

        {% for license in licenses %}
        <h2>{{ license.name }}</h2>
        <pre>{{ license.body }}</pre>
        {% endfor %}

    </body>
</html>
"""
    }
}
