# Lucee Spreadsheet Extension

An updated version of the legacy [cfspreadsheet](https://github.com/Leftbower/cfspreadsheet-lucee-5) spreadsheet extension powered by the [spreadsheet-cfml](https://github.com/cfsimplicity/spreadsheet-cfml) library.

For new development it is recommended to use spreadsheet-cfml directly, but for legacy code which requires the `<cfspreadsheet>` tag and/or`SpreadsheetX()` functions this extension provides an interim solution which does not rely on out-dated versions of the Apache POI library and is compatible with current versions of Lucee.

## Versioning

The extension version tracks the bundled [Apache POI](https://poi.apache.org/) version with an extra patch component:

```text
<poi-major>.<poi-minor>.<poi-patch>.<extension-patch>
```

- `5.5.1.0` — POI 5.5.1, extension patch 0
- `5.5.1.1` — POI 5.5.1, extension patch 1 (any extension-side change without bumping POI)

When a new POI version is bundled, the extension patch resets to `.0`.

## Supported Lucee versions

POI and its transitive dependencies are loaded via the manifest `maven:` field — no bundled OSGi jar — so support depends on the extension classloader plumbing in each Lucee branch:

| Lucee | Status |
| --- | --- |
| 7.0+ / 7.1+ | Supported. Hot install and restart both work. |
| 6.2.x with [LDEV-6297](https://luceeserver.atlassian.net/browse/LDEV-6297) (WIP) | Supported once shipped. Hot install and restart both work. Minimum patched version TBC. |
| 6.2.x without LDEV-6297 | **Not supported.** Extension installs cleanly but POI classes are not reachable through the RPC classloader; `createObject("java", ...)` for POI types will throw `ClassNotFoundException`. |
| 6.x earlier | Not supported. |

[LDEV-6297](https://luceeserver.atlassian.net/browse/LDEV-6297) is currently **work in progress** on the Lucee 6.2 branch — once it ships in a 6.2.x maintenance release, the extension will work hot-installed on 6.2 with no restart required. The manifest declares `lucee-core-version: 6.2.0.300` as the minimum but a release carrying LDEV-6297 is required for runtime functionality on the 6.2 branch.

## Distributions

This is a maven-based extension — POI and its transitive dependencies are declared via the manifest `maven:` field. The extension is published in two variants:

### Full Version - 33Mb

Bundles POI and its full transitive dependency tree (18 jars) inside the `.lex` under `maven/<g>/<a>/<v>/...`. Lucee extracts these into the local maven directory at install time, so first-use class lookups resolve locally with no network round-trip. Suitable for offline / air-gapped / firewalled deployments.

### Lite Version - 24Kb

Ships only the CFML wrappers and the manifest `maven:` declaration — no bundled jars. On install (or first warmup), Lucee fetches POI and the transitive deps from Maven Central. Tiny download, but requires outbound network access at install or warmup. Once resolved, deps are cached locally, so subsequent class lookups are local.

## Supported tag

### `<cfspreadsheet>`

Actions: `read`, `write`, `update`.

Attributes:

| Attribute | Notes |
| --- | --- |
| `action` | required: `read` / `write` / `update` |
| `name` | variable name for the result (object / query / string) |
| `query` | query variable for read/write |
| `src` | path to read |
| `filename` | path to write or update |
| `format` | `csv` / `html` for read, `csv` for write |
| `sheet` | sheet number to read |
| `sheetName` | sheet name |
| `sheetNameConflict` | `error` / `overwrite` (Lucee-specific) |
| `overwrite` | overwrite target file |
| `headerRow` | row number containing column headers |
| `excludeHeaderRow` | exclude the header row from output |
| `rows` | row range filter |
| `columns` | column range filter |
| `columnNames` | explicit column-name list |
| `columnFormats` | column format definitions, requires `query` (Lucee-specific) |
| `autosize` | autosize columns on write |
| `password` | password for password-protected workbooks |

## Supported BIFs

47 functions, grouped below. ACF parity covers the 42 documented [Adobe ColdFusion spreadsheet BIFs](https://helpx.adobe.com/coldfusion/cfml-reference/coldfusion-functions/functions-by-category/spreadsheet-functions.html); the Lucee extension adds a handful of helpers beyond ACF (marked *Lucee-only*).

### Workbook lifecycle

- `SpreadsheetNew`
- `SpreadsheetRead`
- `SpreadsheetReadBinary`
- `SpreadsheetWrite`
- `SpreadsheetInfo`
- `SpreadsheetAddInfo`
- `IsSpreadsheetObject`
- `IsSpreadsheetFile`

### Sheets

- `SpreadsheetCreateSheet`
- `SpreadsheetRemoveSheet`
- `SpreadsheetRemoveSheetNumber` *(Lucee-only)*
- `SpreadsheetSetActiveSheet`
- `SpreadsheetSetActiveSheetNumber`
- `SpreadsheetGetColumnCount`

### Rows

- `SpreadsheetAddRow`
- `SpreadsheetAddRows`
- `SpreadsheetDeleteRow`
- `SpreadsheetDeleteRows`
- `SpreadsheetShiftRows`
- `SpreadsheetSetRowHeight`

### Columns

- `SpreadsheetAddColumn`
- `SpreadsheetDeleteColumn`
- `SpreadsheetDeleteColumns`
- `SpreadsheetShiftColumns`
- `SpreadsheetSetColumnWidth`
- `SpreadsheetAutoSizeColumn` *(Lucee-only)*

### Cells

- `SpreadsheetGetCellValue`
- `SpreadsheetSetCellValue`
- `SpreadsheetGetCellFormula`
- `SpreadsheetSetCellFormula`
- `SpreadsheetGetCellComment`
- `SpreadsheetSetCellComment`
- `SpreadsheetMergeCells`
- `SpreadsheetClearCellRange` *(Lucee-only)*

### Formatting

- `SpreadsheetFormatCell`
- `SpreadsheetFormatCellRange`
- `SpreadsheetFormatColumn`
- `SpreadsheetFormatColumns`
- `SpreadsheetFormatRow`
- `SpreadsheetFormatRows`

### Layout, images, autofilter, page breaks

- `SpreadsheetAddFreezePane`
- `SpreadsheetAddSplitPane`
- `SpreadsheetAddImage`
- `SpreadsheetAddAutofilter`
- `SpreadsheetAddPageBreaks`
- `SpreadsheetSetHeader`
- `SpreadsheetSetFooter`

ACF 2025's streaming BIFs (`StreamingSpreadsheetNew` / `Read` / `Process` / `Cleanup`) are **not** exposed under those names yet — equivalent SXSSF functionality is available via `SpreadsheetNew(..., streamingXml=true, streamingWindowSize=...)` and the underlying CFC API.
