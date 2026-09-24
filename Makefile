.PHONY: lint pdf clean redline

lint:
	python3 tools/lint_governance.py
	asciidoctor --failure-level WARN -o /tmp/pci-bylaws.html governance/pci/bylaws.adoc

pdf:
	mkdir -p build
	asciidoctor-pdf -a pdf-theme=render/theme.yml -o build/pci-bylaws.pdf governance/pci/bylaws.adoc
	asciidoctor-pdf -a pdf-theme=render/theme.yml -o build/atac-bylaws-2022.pdf governance/atac/bylaws-2022.adoc
	asciidoctor-pdf -a pdf-theme=render/theme.yml -o build/certificate-amendment.pdf governance/pci/certificate-amendment.adoc
	asciidoctor-pdf -a pdf-theme=render/theme.yml -o build/voting-member-policy.pdf governance/pci/voting-member-policy.adoc
	asciidoctor-pdf -a pdf-theme=render/theme.yml -o build/annual-meeting-agenda.pdf meetings/2026-10-10/agenda.adoc
	asciidoctor-pdf -a pdf-theme=render/theme.yml -o build/annual-meeting-resolutions.pdf meetings/2026-10-10/resolutions.adoc

redline:
	python3 tools/redline.py $${BASE:-origin/main}
	asciidoctor-pdf -a pdf-theme=render/theme.yml -o build/pci-bylaws-redline.pdf build/pci-bylaws-redline.adoc

clean:
	rm -rf build
