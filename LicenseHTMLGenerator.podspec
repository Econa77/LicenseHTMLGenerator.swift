Pod::Spec.new do |s|
  s.name        = 'LicenseHTMLGenerator'
  s.version     = '0.1.0
  s.summary     = 'A generator of license lists in specified HTML format.'
  s.homepage    = 'https://github.com/Econa77/LicenseHTMLGenerator.swift'
  s.license     = { :type => 'MIT', :file => 'LICENSE' }
  s.author      = 'Econa77'
  s.source      = { :http => "#{s.homepage}/releases/download/v#{s.version.to_s}/portable_license_html_generator.zip" }
  s.preserve_paths = '*'
  s.exclude_files  = '**/file.zip'
end
