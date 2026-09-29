#!/bin/sh
# Preview the site at http://localhost:4000 using Docker, matching GitHub Pages.
# Rebuilds when files change; refresh the browser to see edits. Ctrl+C stops it.
# Gems are cached in ~/.cache/jekyll-gems so later runs start quickly.
set -e
cd "$(dirname "$0")"
mkdir -p "$HOME/.cache/jekyll-gems"
exec docker run --rm -it \
  -u "$(id -u):$(id -g)" \
  -e HOME=/tmp -e BUNDLE_PATH=/gems \
  -e PAGES_REPO_NWO=toddawhittaker/toddawhittaker.github.io \
  -v "$HOME/.cache/jekyll-gems:/gems" \
  -v "$PWD:/site" -w /site \
  -p 127.0.0.1:4000:4000 \
  ruby:3.3 \
  sh -c 'bundle install --quiet && bundle exec jekyll serve --source docs --config docs/_config.yml,_config.preview.yml --destination _site --host 0.0.0.0'
