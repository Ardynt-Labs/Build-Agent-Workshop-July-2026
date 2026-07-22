# Build Agent Workshop — GitBook repo

This repo hosts GitBook spaces via git sync. Each space is one top-level folder
(e.g. `build-agent/`, later `build-anywhere/`), each with its own `.gitbook.yaml`
pointing at a `README.md` + `SUMMARY.md` inside that folder. In the GitBook web
UI, each space's **Project directory** setting is pointed at its folder — that's
how one repo serves multiple spaces without cross-contamination.

## Workflow: converting a new docx draft

The user will hand over an updated `.docx` lab guide periodically (v0.5, v0.6, ...).
Each time:

1. **Convert to raw markdown for review** — don't edit blind:
   ```bash
   ./scripts/docx-to-raw.sh /path/to/the.docx
   ```
   This drops the pandoc output at `/tmp/docx-raw/raw.md`. Read the whole thing
   before touching any space's files — lab numbering, order, and even which labs
   exist can shift between drafts. (v0.5's real lab order was Scaffold → Catalog
   Item → Load Backlog → Ship a Story → Document, which did NOT match an earlier
   sketch that had Catalog Item last — don't assume the previous file layout is
   still right.)

2. **Map content into per-lab files** in the relevant space folder, following the
   naming pattern already in use: `lab-N-slug.md`, `appendix-X-slug.md`. Number
   files to match what the doc itself calls each lab. If the new draft reorders
   labs relative to the current files, flag it to the user rather than silently
   renumbering.

3. **Apply the styling conventions below.** Don't invent new ones without a reason.

4. **Update `SUMMARY.md`** in that space to match the new file list/order.

5. **Commit and push to `main`.**
   ```bash
   git add <space>/
   git commit -m "..."
   git push origin main
   ```
   `gh` is authenticated on this machine (`gh auth status` to confirm) and
   `gh auth setup-git` has already wired git's credential helper — push should
   just work without re-authenticating.

## Styling conventions (established in the first conversion, keep consistent)

GitBook git-sync renders a specific block syntax from markdown; there is no
custom CSS available from the repo side. Space-level appearance (theme color,
logo, custom domain) is configured in the GitBook web UI, not here.

- **Callout boxes** → GitBook hint blocks:
  - `{% hint style="info" %}` — tips, "good to know" notes, optional/aside info
  - `{% hint style="warning" %}` — things that can trip you up (scope questions,
    prerequisite/dependency checks, fallback triggers)
  - `{% hint style="success" %}` — "Feature Spotlight" / teaching-moment callouts
- **Prompts** meant to be copy-pasted verbatim into Build Agent → fenced
  ` ```text ` code blocks, each under its own `### Prompt N` heading.
- **Placeholders** like `<YOUR FIRST NAME>` or `[PLUGIN NAME — confirm]` → wrap
  in inline code (`` `<YOUR FIRST NAME>` ``) so GitBook's markdown parser
  doesn't treat angle brackets as HTML and silently drop them.
- **Screenshot placeholders** (no image yet) → `> 🖼️ *Screenshot: description*`
  blockquote.
- **ASCII flow diagrams** (box-and-arrow figures in the docx) → fenced plain
  code blocks, preserved as monospace art.
- Plain tables → convert straight to GFM tables.

## Local machine setup (already done, note for a future fresh session)

- Homebrew, `gh`, and `pandoc` are installed.
- `gh` is authenticated as `andreeagrecu-ardynt`; `gh auth setup-git` has wired
  git's credential helper so `git push`/`git pull` over HTTPS just work.
- This directory (`~/Claude/Projects/ServiceNow/Build-Agent-Workshop-July-2026`)
  is a persistent clone — `git pull` before editing, `git push` when done. Don't
  redo the conversion from scratch in a scratchpad/tmp dir; work here so history
  accumulates normally.

## Repo layout

```
build-agent/
  .gitbook.yaml       # root: ./, points to README.md + SUMMARY.md
  README.md
  SUMMARY.md
  lab-0-setup.md
  lab-1-scaffold.md
  lab-2-catalog-item.md
  lab-3-load-backlog.md
  lab-4-ship-a-story.md
  lab-5-document-the-app.md
  appendix-a-paste-fallback.md
build-anywhere/       # added later — same pattern, separate GitBook space
scripts/
  docx-to-raw.sh      # pandoc wrapper, mechanical first step of a conversion
```
