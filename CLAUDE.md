# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Todd A. Whittaker's personal GitHub Pages site. It is plain Markdown built by Jekyll (a static site generator) on GitHub's servers. There are no tests and no linter. Pushing to `main` publishes the site, so see the workflow below before committing.

## Workflow

1. Work on the `draft` branch. Commit and push there freely. The website does not change, although the repository is public, so anything pushed is visible on GitHub.
2. Check changes with `./preview.sh` (see below) before publishing.
3. Publish only when Todd says to, by merging `draft` into `main` and returning to `draft`:

   ```sh
   git switch main && git merge draft && git push && git switch draft
   ```

Never commit directly to `main`, and never merge into it without being asked.

## Layout

- The site is served from the `docs/` folder, not the repository root. The root `README.md` is not part of the site.
- `docs/_config.yml` puts HTML links in `title` and `description`, which the layout renders in the page header. There is no theme; the site uses its own layout and stylesheet.
- `docs/_layouts/default.html` is the one page layout. It holds the header (with the GitHub profile photo on the home page only) and the site navigation, which is a hand-written list. Add a new page to that list.
- `docs/assets/css/style.scss` is the whole stylesheet (IBM Plex Sans and Mono, light and dark colors). The empty front matter (`---` / `---`) at the top is required so Jekyll processes the file. GitHub Pages compiles it with an old Sass (Ruby Sass 3.7) that rejects CSS `clamp()` and `min()`, so wrap those in `unquote("...")`.
- `docs/README.md` is the site's home page: a short biography and links to each sub-page.
- Each sub-page lives in its own folder with an `index.md` and any images, so it is served at `/<folder>/`. Today these are `experience/`, `teaching/`, `publications/`, `service/`, and `CSM-AI-Policy/` (the generative AI use policy for the Computing Sciences and Mathematics department at Franklin University). The biography and the experience, teaching, publications, and service pages come from Todd's [Franklin faculty profile](https://www.franklin.edu/about-us/faculty-staff/faculty-profiles/whittaker-todd) and his CV (`screenshots/Curriculum_Vitae.pdf`, which Git ignores and which must never be published). Leave off anything about Provenance Learning, his company, until Todd says otherwise. The navigation also links to his blog, [Layer 8 Learning](https://layer8learning.substack.com/).

## Conventions

- To add a page, create `docs/<Name>/index.md`, then link it from `docs/README.md` and the navigation list in `docs/_layouts/default.html`.
- A page starts with a `#` title and an italic subtitle line, then `##` sections. Tables with a date or course-number column take `{: .timeline}` after them. On the experience page, each role is a `###` heading followed by its dates and `{: .dates}`.
- Pages use kramdown (Jekyll's default Markdown processor) extensions such as `{:target="_blank"}` to open links in a new tab.

## Previewing locally

Run `./preview.sh` and open http://localhost:4000. Set `PORT` to use another port, for example `PORT=4001 ./preview.sh`. It runs Jekyll in a Docker container (the `ruby:3.3` image) with the `github-pages` gem, so the output matches the live site. It rebuilds when files change, and Ctrl+C stops it. The first run installs gems into `~/.cache/jekyll-gems` and takes a minute or two.

`Gemfile` and `_config.preview.yml` exist only for this preview. GitHub Pages ignores both because they sit outside `docs/`. The preview config stops Jekyll from adding a "View on GitHub" banner and footer that the live site does not show.
