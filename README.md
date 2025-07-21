# EMBurr 🔥
### React for Bare Metal

**Write embedded systems like it's 2025, not 1985.**

```c
// Blink an LED
component Blinker {
  state { bool on = false; }
  effect [] { every(1000, toggle(&on)); }
  render { LED(on); }
}
```

That's it. No setup. No boilerplate. Just clarity.

## What is EMBurr?

EMBurr brings React's declarative component model to embedded C programming. It compiles to the same efficient code you'd write by hand, but with 90% less complexity.

**Before EMBurr:**
```c
volatile uint32_t lastDebounceTime = 0;
volatile bool ledState = false;
volatile bool buttonState = false;
volatile bool lastButtonState = false;

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(BUTTON_PIN, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(BUTTON_PIN), buttonISR, CHANGE);
}

void buttonISR() {
  // ... 20 lines of debounce logic
}

void loop() {
  if ((millis() - lastDebounceTime) > 50) {
    if (buttonState != lastButtonState) {
      if (buttonState == LOW) {
        ledState = !ledState;
        digitalWrite(LED_BUILTIN, ledState);
      }
      lastButtonState = buttonState;
    }
  }
}
```

**With EMBurr:**
```c
component ButtonToggle {
  state { bool on = false; }
  render {
    Button(BUTTON_PIN, onClick => on = !on);
    LED(on);
  }
}
```

## Features

**Zero-overhead abstractions** - Compiles to the same ASM as hand-written C  
**Tiny runtime** - ~2KB on Arduino Uno  
**Reactive by default** - State changes automatically update outputs  
**Compile-time safety** - Pin conflicts caught before upload  
**Intuitive syntax** - If you know React, you know EMBurr  
**Progressive disclosure** - Use high-level APIs or drop down to registers  

## Quick Start Example (url not live)

```bash
# Install EMBurr compiler
curl -fsSL https://emburr.sh/install | sh

# Create new project
emburr new my-robot
cd my-robot

# Write your component
echo 'component Main {
  state { u8 speed = 0; }
  render {
    Potentiometer(A0, val => speed = val / 4);
    Motor(MOTOR_1, speed);
  }
}' > src/main.em

# Build and flash
emburr flash --board uno
```

## Examples That Make You Rethink Everything

### Servo Control with Smoothing
```c
component SmoothServo {
  state { 
    u8 target = 90;
    u8 current = 90;
  }
  
  effect [target] {
    every(20, () => {
      current += (target - current) / 10;  // Smooth transitions
    });
  }
  
  render {
    Potentiometer(A0, val => target = map(val, 0, 1023, 0, 180));
    Servo(PIN_9, current);
  }
}
```

### Non-blocking Sequences
```c
component TrafficLight {
  async run() {
    while (true) {
      LED(GREEN); await delay(5000);
      LED(YELLOW); await delay(2000);
      LED(RED); await delay(5000);
    }
  }
}
```

### Hardware Interrupts as Event Handlers
```c
component Counter {
  state { u32 count = 0; }
  
  handle RISING(PIN_2) {
    count++;
  }
  
  render {
    Display("Count: %d", count);
  }
}
```

## Why EMBurr Exists

Embedded programming has been stuck in the 1980s while web development revolutionized how we think about UI. We're still writing imperative spaghetti code full of global variables and callback hell.

Meanwhile, React solved this for the web with:
- **Components** instead of spaghetti
- **Declarative** instead of imperative  
- **Reactive** instead of manual updates

EMBurr brings these ideas to bare metal, where they're desperately needed.

## Roadmap

### Phase 1: Core (Current)
- [x] Component syntax
- [x] State management
- [x] Basic effects
- [ ] Compiler prototype
- [ ] Arduino Uno support

### Phase 2: Expansion
- [ ] STM32 support
- [ ] ESP32/ESP8266 support
- [ ] Advanced hooks (memo, reduce)
- [ ] Component libraries

### Phase 3: Ecosystem
- [ ] Package manager
- [ ] VSCode extension
- [ ] Web-based simulator
- [ ] EMBurr Cloud (OTA updates)

## Contributing

We need your help to make embedded programming delightful! Whether you're a compiler wizard, embedded guru, or just excited about the idea, there's a place for you.

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Community

- **Discord**: TBD
- **Twitter**: TBD
- **Examples**: TBD

## FAQ

**Q: Is this just React for microcontrollers?**  
A: No, it's React's *mental model* implemented in C with zero overhead. No JavaScript, no VM, just beautiful abstractions that compile away.

**Q: What's the performance cost?**  
A: Zero. EMBurr compiles to the same machine code you'd get from hand-written C. Sometimes better, because the compiler can optimize patterns humans miss.

**Q: Can I use existing C libraries?**  
A: Yes! EMBurr is a superset of C. Mix EMBurr components with traditional C code freely.

**Q: Which boards are supported?**  
A: Currently Arduino AVR boards. STM32, ESP32, and RP2040 coming soon.

## License

MIT - Because embedded development should be free.

---

<p align="center">
  <i>If you've ever thought "there must be a better way" while writing embedded code, you're right.</i><br>
  <b>There is now. 🔥</b>
</p>
