# LicenseHTMLGenerator.swift

[Download Latest Release](https://github.com/Econa77/LicenseHTMLGenerator.swift/releases/latest/download/portable_license_html_generator.zip)

## Usage
```
$ license-html-generator
```

### Options
You can see options by `license-html-generator --help`.

#### `--output-path`

- Default: `Generated`

#### `--file-name`

- Default: `license.html`

#### `--config-path`

- Default: `config.yml`

#### `--template`

- Default: None.

### Templates
The generated HTML can be customized using [stencil](https://github.com/stencilproject/Stencil). [This template](https://github.com/Econa77/LicenseHTMLGenerator.swift/blob/9bae1888158fd7f5d5fa0527a4c9856f43c7db62/Sources/LicenseHTMLGeneratorKit/HTMLTemplate.swift#L6-L24) is used by default.

The elements that can be used in a template are as follows.

#### `licenses`
The license list is stored in an array.

##### `licenses[0].name`
##### `licenses[0].url`
##### `licenses[0].body`
