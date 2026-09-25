#!/bin/sh
# Usage: common/build.sh <design-dir>/<slug>-r<N>.tex
# Compiles in <design-dir>/build/ (private to the design, so designs build in parallel) and writes
# <slug>-r<N>.pdf and a 200 dpi <slug>-r<N>.png beside the source, plus <slug>-r<N>-nocaption.png
# (the figure without its caption, for cold reads). The document's LaTeX root is read
# from common/doc-root (relative to common/ or absolute) and put on TEXINPUTS after common/.
set -eu
here=$(cd "$(dirname "$0")" && pwd)
root=$(cat "$here/doc-root")
case $root in /*) ;; *) root="$here/$root" ;; esac
src=$1
dir=$(cd "$(dirname "$src")" && pwd)
name=$(basename "$src" .tex)
cd "$dir"
mkdir -p build
TEXINPUTS=".:$here:$root:" latexmk -pdf -interaction=nonstopmode -halt-on-error \
  -outdir=build "$name.tex" >"build/$name.latexmk.out" 2>&1 || { tail -30 "build/$name.log"; exit 1; }
cp "build/$name.pdf" "$name.pdf"
pdftoppm -png -r 200 -singlefile "$name.pdf" "$name"
TEXINPUTS=".:$here:$root:" latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build \
  -jobname="$name-nocaption" -usepretex='\def\draftnocaption{}' "$name.tex" \
  >"build/$name-nocaption.latexmk.out" 2>&1 || { tail -30 "build/$name-nocaption.log"; exit 1; }
pdftoppm -png -r 200 -singlefile "build/$name-nocaption.pdf" "$name-nocaption"
echo "$dir/$name.pdf $dir/$name.png $dir/$name-nocaption.png"
