# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Todd A. Whittaker's personal GitHub Pages site. It is plain Markdown built by Jekyll (a static site generator) on GitHub's servers. There is no Gemfile, no build script, no tests, and no linter. Pushing to `main` publishes the site.

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

No local setup is committed. To preview, you would need Ruby and the `github-pages` gem, then run `bundle exec jekyll serve --source docs` from a Gemfile containing `gem "github-pages"`. Do not commit that Gemfile unless asked.
