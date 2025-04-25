## Move-Map Format Reference

### Columns

| Column | Purpose |
|:-------|:--------|
| **Legacy File Path** | Original relative path from the legacy-website dump (e.g., `global/africa/pretoria.html`). |
| **Title** | Page title pulled from the import data (or `Unknown` if missing). |
| **Slug** | Clean URL-friendly slug (from import or inferred). |
| **Classification** | One of three values: `content_candidate`, `asset`, or `ignore`. |
| **Draft Destination Path** | Target path inside `/First100/drafts/` or `/First100/assets/`, based on classification. |
| **Reason** | Short explanation (e.g., `Real content page`, `Structural include`, `Media file`). |

---

### Example Rows

| Legacy File Path | Title | Slug | Classification | Draft Destination Path | Reason |
|:-----------------|:------|:-----|:---------------|:------------------------|:------|
| `global/africa/pretoria.html` | Pretoria | pretoria | content_candidate | `First100/drafts/global/africa/pretoria.html` | Real content page |
| `_include/peace_header.html` | The Presidents of Rotary International | the-presidents-of-rotary-international | ignore | *(none)* | Structural include |
| `_media/video1.mp4` | *(none)* | *(none)* | asset | `First100/assets/media/video1.mp4` | Media file |
| `calendar/index.html` | www.historycalendar.org | www-historycalendar-org | content_candidate | `First100/drafts/calendar/index.html` | Real content page |

---

### Notes
- Only cleaned documents will be promoted from `/First100/drafts/` into `/First100/html/`.
- Assets (e.g., media files) will go into `/First100/assets/`.
- Ignored files (`ignore`) will be logged for auditing but will not be processed into the final archive.
- Every decision must be traceable through this move-map.
