# math-constraint

## Installation (MacOS)

```
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### PySMS Installation
```
xcode-select --install
brew install boost cmake
cd third_party
git clone https://github.com/markirch/sat-modulo-symmetries.git
cd sat-modulo-symmetries
git submodule update --init --recursive
./build-and-install.sh -l
```


