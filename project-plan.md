# First100 Content Recovery Project

## Project Overview

This project involves recovering, cleaning, and structuring the contents of a legacy website (originally built using FrontPage) into a clean, modern, technology-agnostic archive of semantic HTML documents.

## Current State of Legacy Site

- **legacy-website/** contains a dumped copy of the original site.
- The site includes real content, structural includes, and media files.
- Many pages are structured poorly by modern standards, with hard-coded links, poorly-written HTML, and non-semantic markup.

## Folder Purposes (Legacy Site)

| Folder        | Purpose                                                       | Action |
|:--------------|:---------------------------------------------------------------|:-------|
| `_include/`   | Structural partials (headers, footers, navigation)              | **Ignore for content extraction**; optional reference only. |
| `_media/`     | Static assets (videos, PDFs, audio) and a basic index page       | **Move to `assets/media/`**. Not part of content corpus. |
| Other folders | Actual site content (e.g., `global/`, `calendar/`, `711/`, etc.) | **Extract and clean into structured documents**. |

## Working Directory Structure (Project Root)

```bash
/project-root/
  ├── legacy-website/        # Original dump (read-only reference)
  ├── First100/
  │    ├── drafts/           # Raw extracted files awaiting cleanup
  │    │    ├── global/
  │    │    ├── calendar/
  │    │    └── etc.
  │    ├── html/             # Only clean, structured, final HTML documents
  │    ├── assets/
  │    │    ├── media/       # PDFs, videos, MP3s, etc.
  │    ├── project-docs/     # Markdown documentation of relationships, taxonomy
  │    └── scripts/          # Data extraction and cleanup tools
  ├── README.md
```

## Process and Workflow

### Phase 1: Extraction
- Pull real content into `First100/drafts/`.
- Pull static media files into `First100/assets/media/`.
- _includes files are not treated as content but retained for optional reference.

### Phase 2: Cleaning
- Rewrite all content to be valid, semantic HTML5.
- Remove inline styles, deprecated tags, hardcoded structural garbage.
- Use `<header>`, `<footer>`, `<section>`, `<article>`, etc. appropriately.
- Preserve original meaning and flow without technology lock-in.

### Phase 3: Organization
- Place cleaned documents into `First100/html/`.
- Maintain a logical, simplified folder structure based on subject/context.
- Track document relationships and intended taxonomy separately in `project-docs/`.

### Phase 4: Documentation
- **relationships.md**: maps subject relationships between pages.
- **taxonomy-plan.md**: early planning for WordPress taxonomy or CMS design.
- **source-map.md**: maps legacy file paths to new clean destinations.

## Future Goals

- Build a clean, portable archive that could be loaded into:
  - A WordPress site.
  - A static site generator.
  - A headless CMS.
  - A database-backed search/index engine.
- Establish semantic relationships to support future taxonomy without hardcoding them into documents.
- Maintain 100% separation between content and presentation.

## Key Principles

- **Clean structured HTML** only.
- **No dependencies** on WordPress, FrontPage, PHP, or any other framework.
- **Semantics over styling**: Use correct HTML5 structure.
- **Preserve meaning, not legacy mess**: Logical context matters.
- **Surgical curation**: Not everything moves forward—only quality content.

---

# Next Steps

- Generate a [move-map CSV](move-map.md) classifying each legacy file.
- Extract content candidates into `drafts/`.
- Clean drafts into structured HTML5.
- Build relationship and taxonomy maps as we go.
- Promote finalized documents into `html/`.

---

**This document is the primary reference for all decisions moving forward.**

(Last updated: April 25, 2025)

