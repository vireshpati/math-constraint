# math-constraint

Constraint-based mathematical problem solving using SAT modulo symmetries.

## Prerequisites

- Python 3.8+
- CMake 3.12+
- Boost 1.74+ (with program_options)
- C++20 compiler

### macOS
```bash
brew install boost cmake
```

### Ubuntu/Debian
```bash
sudo apt install cmake libboost-all-dev build-essential
```

## Installation

```bash
# Clone with submodules
git clone --recursive https://github.com/vireshpati/math-constraint.git
cd math-constraint

# Create Python virtual environment
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Build third-party solvers (sat-modulo-symmetries)
./scripts/setup_third_party.sh
```

## Verify Installation

```bash
# Test SMS binary
./third_party/sat-modulo-symmetries/install/bin/smsg --help

# Test Python module
python -c "from pysms import graph_builder; print('PySMS OK')"
```

## Project Structure

```
math-constraint/
├── src/                  # Source code
├── data/                 # Input data
├── tests/                # Test files
├── third_party/          # External dependencies
│   └── sat-modulo-symmetries/
└── scripts/              # Build and setup scripts
```
