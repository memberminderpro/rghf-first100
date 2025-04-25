# Legacy Navigation Extraction

## Purpose

The file [`/legacy-website/legacy-docs/LEGACY-NAVIGATION.md`](../../legacy-website/legacy-docs/LEGACY-NAVIGATION-deduped.md) documents the original internal link structure of the legacy website.  
It was created to:

- Capture all `<a href="...">` links present in legacy HTML files.
- Preserve original navigation relationships separately from content.
- Support future analysis of:
  - Subject relationships
  - Broken links
  - Orphan pages
  - Redundant or cyclic navigation

This navigation map is for **reference only**.  
**It is not part of the new clean archive** being built inside `First100/html/`.

---

## How `LEGACY-NAVIGATION.md` Was Created

The navigation file was generated using a [Bash script](../scripts/legacy-navigation.sh) that:

1. Recursively searches all `.html` files inside the `legacy-website/first100/` directory.
2. Extracts all `href` values from `<a>` tags.
3. Records each original HTML filename as a Markdown subheader.
4. Lists all extracted links in Markdown format under each header.



Example output structure:

```markdown
## 9000.htm
- [../../../districts/9000.htm](../../../districts/9000.htm)

## thomson.htm
- [../../../historians/thomson.htm](../../../historians/thomson.htm)

## australia.htm
- [../../../library/archives/australia.htm#Zealand](../../../library/archives/australia.htm#Zealand)
