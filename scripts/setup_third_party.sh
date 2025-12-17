#!/usr/bin/env bash
set -e

echo "[math-constraint] Initializing submodules"
git submodule update --init --recursive

OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  echo "[math-constraint] macOS detected — applying sat-modulo-symmetries patches"

  cd third_party/sat-modulo-symmetries

  for p in ../patches/sat-modulo-symmetries/*.patch; do
    if git apply --check "$p" >/dev/null 2>&1; then
      git apply "$p"
      echo "  applied $(basename "$p")"
    else
      echo "  skipped $(basename "$p") (already applied or upstream fixed)"
    fi
  done

else
  echo "[math-constraint] Linux detected — no patches required"
fi

echo "[math-constraint] Done"
