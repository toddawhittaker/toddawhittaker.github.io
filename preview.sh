#!/bin/sh
# Preview the site at http://localhost:4000 (or $PORT) using Docker, matching GitHub Pages.
# Rebuilds when files change; refresh the browser to see edits. Ctrl+C stops it.
# Gems are cached in ~/.cache/jekyll-gems so later runs start quickly.
set -e
cd "$(dirname "$0")"
mkdir -p "$HOME/.cache/jekyll-gems"
# Attach a terminal only when there is one, so the script also runs in the background.
[ -t 0 ] && tty_flags=-it
exec docker run --rm $tty_flags \
  -u "$(id -u):$(id -g)" \
  -e HOME=/tmp -e BUNDLE_PATH=/gems \
  -e PAGES_REPO_NWO=toddawhittaker/toddawhittaker.github.io \
  -v "$HOME/.cache/jekyll-gems:/gems" \
  -v "$PWD:/site" -w /site \
  -p "127.0.0.1:${PORT:-4000}:4000" \
  ruby:3.3 \
  sh -c 'bundle install --quiet && bundle exec jekyll serve --source docs --config docs/_config.yml,_config.preview.yml --destination _site --host 0.0.0.0'
