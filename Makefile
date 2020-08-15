PREFIX?=/usr/local

TEMPORARY_FOLDER=./tmp_portable_license_html_generator

build:
	swift build --disable-sandbox -c release

test:
	swift test

clean:
	swift package clean

xcode:
	swift package generate-xcodeproj

portable_zip: build
	mkdir -p "$(TEMPORARY_FOLDER)"
	cp -f ".build/release/license-html-generator" "$(TEMPORARY_FOLDER)/license-html-generator"
	cp -f "LICENSE" "$(TEMPORARY_FOLDER)"
	(cd $(TEMPORARY_FOLDER); zip -yr - "LICENSE" "license-html-generator") > "./portable_license_html_generator.zip"
	rm -r "$(TEMPORARY_FOLDER)"
