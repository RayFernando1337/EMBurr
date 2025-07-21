# Contributing to EMBurr 🔥

First off, thank you for considering contributing to EMBurr! 

## Ways to Contribute

### Report Bugs
Found something broken? [Open an issue](https://github.com/your-username/emburr/issues/new?template=bug_report.md)

### Suggest Features  
Have an idea? [Tell us about it](https://github.com/your-username/emburr/issues/new?template=feature_request.md)

### Improve Documentation
Docs can always be better. Fix typos, add examples, or write guides.

### Write Code
- Pick an issue labeled `good first issue`
- Fork the repo
- Create a branch: `git checkout -b my-feature`
- Make your changes
- Run tests: `emburr test`
- Push and PR!

### Port to New Boards
We need support for more microcontrollers! See our [Porting Guide](docs/porting-guide.md).

## Development Setup

```bash
# Clone your fork
git clone https://github.com/your-username/emburr.git
cd emburr

# Install Rust (for compiler)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Build compiler
cd compiler
cargo build

# Run tests
cargo test
