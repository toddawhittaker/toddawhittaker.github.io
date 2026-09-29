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
- `docs/_config.yml` sets the `jekyll-theme-slate` theme and puts HTML links in `title` and `description`, which the theme renders in the page header.
- `docs/assets/css/style.scss` imports the theme's stylesheet. Add style overrides below the import. The empty front matter (`---` / `---`) at the top is required so Jekyll processes the file.
- `docs/README.md` is the site's home page and links to each sub-page.
- Each sub-page lives in its own folder with an `index.md` and its images, so it is served at `/<folder>/`. The only one today is `docs/CSM-AI-Policy/`, the generative AI use policy for the Computing Sciences and Mathematics department at Franklin University.

## Conventions

- To add a page, create `docs/<Name>/index.md` and add a link to it in `docs/README.md`.
- Pages use kramdown (Jekyll's default Markdown processor) extensions such as `{:target="_blank"}` to open links in a new tab.

## Previewing locally

Run `./preview.sh` and open http://localhost:4000. It runs Jekyll in a Docker container (the `ruby:3.3` image) with the `github-pages` gem, so the output matches the live site. It rebuilds when files change, and Ctrl+C stops it. The first run installs gems into `~/.cache/jekyll-gems` and takes a minute or two.

`Gemfile` and `_config.preview.yml` exist only for this preview. GitHub Pages ignores both because they sit outside `docs/`. The preview config stops Jekyll from adding a "View on GitHub" banner and footer that the live site does not show.
