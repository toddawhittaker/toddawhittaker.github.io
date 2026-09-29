# toddawhittaker.github.io

This is the source for [toddawhittaker.github.io](https://toddawhittaker.github.io/), the personal site of Todd A. Whittaker, Ph.D., Department Chair of Computing Sciences and Mathematics at Franklin University.

## What's on the site

- [Generative AI Use Policy](https://toddawhittaker.github.io/CSM-AI-Policy/): the department's policy on students' use of generative AI tools, with examples of permitted and prohibited prompts.

## How it works

The site is written in Markdown and published with GitHub Pages. GitHub builds it with Jekyll (a static site generator) using the Slate theme, and republishes it automatically on every push to `main`.

Only the `docs/` folder is published. `docs/README.md` is the home page, and each other page is a folder containing an `index.md` file, served at `/<folder>/`. Files outside `docs/`, including this README, are not part of the site.

To add a page, create `docs/<Name>/index.md` and link to it from `docs/README.md`.
