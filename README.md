# gadgets-htmldocs

HTMLDocs for the gadgets of [polpo](https://github.com/polpo-system/polpo): HTML pages as Oberon documents, with headings, paragraphs, lists, fonts and links. Tables, forms and images are plugins of their own (gadgets-htmltables, gadgets-htmlforms, gadgets-htmlimages, found through the section HTMLTags of Oberon.Text); pages from the web come with gadgets-httpdocs.

```
portia.Install gadgets-htmldocs
```

## Using

    Desktops.OpenDoc page.html       a page (`html = HTMLDocs.NewDoc` in the section Documents)

## What is here

    src/HTTPDocs0.Mod        the part of the documents shared with HTTP
    src/HTMLDocs.Mod         the HTML documents
    tools/HTMLDocs.Tool
    test/HTMLDocsTest.Mod

HTMLDocs is by Emil Zeller. The sources come from ETH Linux Oberon (OLR, 2017-06-18), converted from Oberon texts to plain
text; the first commit has them unchanged. They compile unchanged with all five of polpo's compilers
(x86, ARM, ARMv7, RISC-V, MIPS).

## Tests

    HTMLDocsTest.Run      2 checks: a small page parsed as an HTML document; it needs the
                          desktop's display

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
