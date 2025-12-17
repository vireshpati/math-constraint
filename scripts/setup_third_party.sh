#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
SMS_DIR="$ROOT_DIR/third_party/sat-modulo-symmetries"

echo "==> Setting up third-party dependencies..."

# Initialize submodules
echo "==> Initializing git submodules..."
cd "$ROOT_DIR"
git submodule update --init --recursive

# Build sat-modulo-symmetries
echo "==> Building sat-modulo-symmetries..."
cd "$SMS_DIR"

# Apply macOS compatibility patch if on Darwin
if [[ "$(uname)" == "Darwin" ]]; then
    echo "==> Applying macOS compatibility patch..."
    # Check if patch already applied by looking for sstream in useful.h
    if ! grep -q '#include <sstream>' src/useful.h; then
        patch -p1 < "$ROOT_DIR/third_party/patches/sms-macos-sstream.patch" || true
    else
        echo "    Patch already applied, skipping..."
    fi
fi

# Build CaDiCaL dependency
echo "==> Building CaDiCaL..."
cd "$SMS_DIR/cadical_sms"
./configure
make -j$(getconf _NPROCESSORS_ONLN 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)

# Build SMS
echo "==> Building SMS..."
cd "$SMS_DIR"
rm -rf build install
mkdir -p build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install
make -j$(getconf _NPROCESSORS_ONLN 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
make install

# Install Python module
echo "==> Installing PySMS Python module..."
cd "$ROOT_DIR"
if [[ -d "venv" ]]; then
    ./venv/bin/pip install "$SMS_DIR"
else
    pip install "$SMS_DIR"
fi

echo ""
echo "==> Setup complete!"
echo "    SMS binary: $SMS_DIR/install/bin/smsg"
echo "    Run '$SMS_DIR/install/bin/smsg --help' to verify installation."
