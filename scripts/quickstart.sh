#!/bin/bash
echo "🔥 Welcome to EMBurr!"
echo "Setting up your first project..."

# Create project structure
mkdir -p my-first-emburr/{src,config}
cd my-first-emburr

# Create main component
cat > src/main.em << 'EOF'
component Main {
  state { bool on = false; }
  effect [] { every(1000, toggle(&on)); }
  render { LED(on); }
}
EOF

# Create config
cat > config/board.toml << 'EOF'
[board]
type = "arduino_uno"
port = "/dev/ttyUSB0"
EOF

echo "✅ Project created! Next steps:"
echo "1. cd my-first-emburr"
echo "2. emburr build"
echo "3. emburr flash"
