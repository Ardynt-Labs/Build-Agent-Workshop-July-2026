---
hidden: true
---

# Build Agent Workshop — GitBook repo

This repo hosts GitBook spaces via git sync. Each space is one top-level folder (`build-agent/`, `build-anywhere/`), each with its own `.gitbook.yaml` pointing at a `README.md` + `SUMMARY.md` inside that folder. In the GitBook web UI, each space's **Project directory** setting is pointed at its folder — that's how one repo serves multiple spaces without cross-contamination. Content that discusses both spaces (e.g. the closing comparison page) is duplicated as a standalone page in both spaces' folders rather than shared/symlinked — GitBook spaces are independent content trees, so there's no cross-space include mechanism.

As of the v2 ("Ardynt Formatted") docx, a single source file can contain BOTH the morning (Build Agent) and afternoon (Build Anywhere) content in one document — don't assume one docx maps to one space. Read the whole thing and split by content, not by file.

## Workflow: converting a new docx draft

The user will hand over an updated `.docx` lab guide periodically. Each time:

1.  **Convert to raw markdown, extracting embedded images:**

    ```bash
    ./scripts/docx-to-raw.sh /path/to/the.docx
    ```

    This drops pandoc's output at `/tmp/docx-raw/raw.md` plus an extracted `media/media/imageN.png` for every embedded image, in the same position they appear in the doc (as inline `<img>` tags) — so you can match each image to its surrounding paragraph without guessing. Read the whole markdown file before touching any space's files — lab numbering, order, titles, and even which labs exist can shift between drafts, and don't assume the previous file layout is still right. (v0.5→v2: Lab 1 "Scaffold Groundwork" became "Creating the Foundational App"; Lab 4 "Ship a Story" became "Implement a Story" — filenames were renamed to match.)
2. **View every non-obvious embedded image** (the Read tool renders PNG/GIF directly) before writing alt text or picking a filename. For screenshots whose content is already fully described by the adjacent paragraph (e.g. a terminal strip right after "type `bash` and press Enter"), inferring alt text from context without opening the file is fine — but for anything ambiguous (diagrams, multi-purpose screenshots, tiny icons), view it first. Tiny decorative glyphs (e.g. a 32×32 inline mascot icon) don't embed well blown up to page width — drop them and keep the sentence as plain text rather than force an image in.
3.  **Copy images into a per-space `assets/` folder** with descriptive filenames (`lab1-plan-approval.png`, not `image8.png`) — this is what makes the repo maintainable across drafts. Reference them with the `<figure>` pattern below (NOT plain `![]()`) — plain markdown images render small and cramped inside hint blocks:

    ```html
    <figure><img src="assets/filename.png" alt="descriptive alt text"><figcaption><p>Click on image to zoom in</p></figcaption></figure>
    ```

    If the alt text itself contains a `"` (quoting UI text, e.g. a button label), escape it as `&quot;` — a literal `"` inside the `alt="..."` attribute breaks the tag. Don't try to preserve the docx's inch sizing; this pattern renders full-width and responsive.

    **Never nest a `<figure>` inside a `{% hint %}` block.** GitBook's hint renderer doesn't handle it — the image comes out tiny and the caption doesn't show at all. If a hint's source text has a screenshot in the middle of it, split it: hint text only inside `{% hint %}...{% endhint %}`, then the `<figure>` right after the hint closes, as regular content.

    For a file attendees need to download and use elsewhere (e.g. Lab 3's stories spreadsheet): embed it with the figure pattern, then add a `{% hint style="info" %}` telling them to **right-click the image and choose Save Image As / Download Image**. Don't add a separate markdown link to the asset path — GitBook may resolve it as an external GitHub link (shows a confusing `↗` and can land non-technical users on a raw GitHub blob page), which is exactly the "folks might not know how to download from GitHub" problem to avoid.
4. **Map content into per-lab files** in the relevant space folder, following the naming pattern already in use: `lab-N-slug.md`, `appendix-X-slug.md`. Number files to match what the doc itself calls each lab. If the new draft reorders labs relative to the current files, or renames a lab, flag it to the user rather than silently reshaping the file layout.
5. **Apply the styling conventions below.** Don't invent new ones without a reason.
6. **Update `SUMMARY.md`** in that space to match the new file list/order. Don't list the README as its own bullet (e.g. `* [Space Title](README.md)`) — `.gitbook.yaml`'s `structure.readme` already makes it the space's landing page, and an extra self-referencing bullet appears to be what produces a stray, generically-labeled "Summary" entry in GitBook's rendered nav. Order labs first in sequence, with any closing/wrap-up and appendix pages last (ask the user for their preferred order among those rather than guessing).
7. **Ask before resolving ambiguity you can't infer from context** — highlighted / marked draft text, sentences that reference something not yet decided ("need a link" placeholders), or screenshots that contradict the prose (e.g. a worked-example screenshot using a different story number than the one the text recommends). Don't silently guess on anything that changes what an attendee reads or does.
8.  **Commit and push to `main`.**

    ```bash
    git add <space>/
    git commit -m "..."
    git push origin main
    ```

    `gh` is authenticated on this machine (`gh auth status` to confirm) and `gh auth setup-git` has already wired git's credential helper — push should just work without re-authenticating.

## Styling conventions (established in the first conversion, keep consistent)

GitBook git-sync renders a specific block syntax from markdown; there is no custom CSS available from the repo side. Space-level appearance (theme color, logo, custom domain) is configured in the GitBook web UI, not here.

* **Callout boxes** → GitBook hint blocks:
  * `{% hint style="info" %}` — "TIP —" boxes, "good to know" notes, optional/aside info, unprefixed short teaching asides
  * `{% hint style="warning" %}` — "IMPORTANT —" boxes: things that can trip you up, prerequisite/dependency checks, fallback triggers
  * `{% hint style="success" %}` — "Feature Spotlight" / teaching-moment callouts
*   **Prompts AND CLI commands** meant to be copy-pasted verbatim → wrap a fenced ` ```text ` (prompts) or ` ```bash ` (shell commands) code block in GitBook's `<div data-gb-custom-block data-tag="code" data-overflow='wrap'>` / `</div>` block, each under its own heading (`### Prompt N`, or a numbered step):

    ````
    {% code overflow="wrap" %}
    ```text
    the prompt text, can be one long line or several
    ````

    \{% endcode %\}

    ```
    `overflow="wrap"` is required — a plain triple-backtick fence with no
    wrapper renders long single-line prompts truncated with a horizontal
    scrollbar the reader has to notice and use, easy to miss entirely. GitBook
    renders a one-click copy button on these automatically either way.
    ```
* **Placeholders** like `<YOUR FIRST NAME>` or `[PLUGIN NAME — confirm]` → wrap in inline code (`` `<YOUR FIRST NAME>` ``) so GitBook's markdown parser doesn't treat angle brackets as HTML and silently drop them. Exception: inside a fenced code block, leave them as literal `<...>` (no escaping needed there since it's not parsed as markdown/HTML).
* **Screenshots** → real embedded images once available, using the `<figure>` pattern in workflow step 3 (not plain `![]()`). Only fall back to a `> 🖼️ *Screenshot: description*` placeholder blockquote when no image has been provided yet for that spot.
* **Space titles** → `# Part One - <name>` / `# Part Two - <name>` (a plain hyphen, not `·`) as the README H1, once a space is one of several parts in a multi-part workshop. Check with the user before assuming this pattern extends to a third part etc.
* **ASCII flow diagrams** in early drafts often get replaced by a real designed diagram image in later drafts — check before assuming a code-block diagram is still the source of truth.
* Plain tables → convert straight to GFM tables.

## Things that live in GitBook's app, not this repo

Some nav/display elements the user sees are GitBook UI/platform settings, not derived from anything in this repo — don't go looking for a markdown fix:

* A banner/badge above the spaces list (e.g. showing the repo name) is most likely the GitBook **Collection** title that groups the spaces together — renamed or hidden in GitBook's Collection settings.
* Per-space appearance (theme color, logo, custom domain) — Space settings in the GitBook web UI. If the user reports one of these looking wrong, say so plainly and point them at GitBook's settings rather than guessing at a repo-side fix.

## Local machine setup (already done, note for a future fresh session)

* Homebrew, `gh`, and `pandoc` are installed.
* `gh` is authenticated as `andreeagrecu-ardynt`; `gh auth setup-git` has wired git's credential helper so `git push`/`git pull` over HTTPS just work.
* This directory (`~/Claude/Projects/ServiceNow/Build-Agent-Workshop-July-2026`) is a persistent clone — `git pull` before editing, `git push` when done. Don't redo the conversion from scratch in a scratchpad/tmp dir; work here so history accumulates normally.

## Repo layout

```
build-agent/
  .gitbook.yaml       # root: ./, points to README.md + SUMMARY.md
  README.md
  SUMMARY.md
  lab-0-setup.md
  lab-1-foundational-app.md
  lab-2-catalog-item.md
  lab-3-load-backlog.md
  lab-4-implement-a-story.md
  lab-5-document-the-app.md
  appendix-a-paste-fallback.md
  build-agent-vs-build-anywhere.md   # duplicated in both spaces, see above
  assets/*.png
build-anywhere/       # same pattern, separate GitBook space
  README.md
  SUMMARY.md
  lab-6-connect.md
  lab-7-ship-from-cli.md
  lab-8-ai-skill.md
  build-agent-vs-build-anywhere.md
  assets/*.png
scripts/
  docx-to-raw.sh      # pandoc wrapper incl. --extract-media, mechanical first
                       # step of a conversion
```
