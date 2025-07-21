// The "Hello World" of embedded
// This single example sells the entire framework

component Blink {
  state { 
    bool on = false;
    u32 interval = 1000;  // milliseconds
  }
  
  // React-style effect hook
  effect [interval] {
    every(interval, toggle(&on));
  }
  
  // Declarative hardware control
  render {
    LED(on);
    
    // Bonus: Let user control speed
    Potentiometer(A0, val => {
      interval = map(val, 0, 1023, 100, 2000);
    });
  }
}
