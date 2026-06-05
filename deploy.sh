#!/usr/bin/env bash
# One-command deploy: sync sources -> GitHub + Vercel + Cloudflare Pages.
# Usage:  bash deploy.sh "commit message"
set -uo pipefail
MSG="${1:-Update OT Vuln Lab}"
SRC="C:/Users/WT8/GWU"
SITE="$SRC/ot-vuln-lab-site"
DIST="$SITE/dist"

# 1) sync the two source files into the deploy roots
cp "$SRC/ot-vuln-lab.html"          "$SITE/app.html"
cp "$SRC/ot-vuln-lab.html"          "$DIST/app.html"
cp "$SRC/ot-vuln-lab-landing.html"  "$SITE/index.html"
cp "$SRC/ot-vuln-lab-landing.html"  "$DIST/index.html"

cd "$SITE"

# 2) GitHub
git add -A
if git diff --cached --quiet; then
  echo "git: nothing to commit"
else
  git commit -q -m "$MSG" && echo "git: committed $(git rev-parse --short HEAD)"
fi
git push -q origin main && echo "git: pushed"

# 3) Vercel (production)
echo -n "vercel: "; vercel deploy --prod --yes 2>&1 | grep -iE "readyState|error" | tail -1

# 4) Cloudflare Pages
echo -n "cloudflare: "; npx --yes wrangler@latest pages deploy dist --project-name ot-vuln-lab --branch main --commit-dirty=true 2>&1 | tail -1
echo "done."
