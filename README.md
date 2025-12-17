# math-constraint

## Installation (MacOS)

```
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### PySMS Installation
Note: we apply a small compatibility patch to sat-modulo-symmetries to fix missing <sstream> includes required by Clang/libc++ on Mac.

```
./scripts/setup_third_party.sh
```