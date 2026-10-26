# Team Board Lab — Wrap-up Answers

**Name:** Ahsen Rasheed  
**Roll Number:** 04072312012

## Part A: Numeric Answers

**A1:** 28

**A2:** 7

**A3:** 3

**A4:** 66

## Part B: Written Answers

### B1: Stateless and Stateful Classes

The Stateless classes are LabApp, HomePage, SettingsCard, Probe, Welcome, InfoPanel, SummaryRow, ShareRow, InfoBox, and StampStack. They display information or arrange other widgets without maintaining their own changing state.

The Stateful classes are Clock, Tile, and SwapBoard. Clock maintains the timer and seconds, Tile maintains its tap count, and SwapBoard maintains the tile order when the Swap button is pressed.

### B2: Widget, Element, and RenderObject

A Widget describes how the interface should look. When setState triggers a rebuild, Flutter can create new Widget configurations while retaining compatible Elements in the widget tree. RenderObjects handle layout, painting, and hit testing.

Probe demonstrates that the Widget configuration can change during rebuilding while the Element identity stays the same. It also shows the current widget type and whether a Scaffold exists above it.

### B3: Constraints Go Down, Sizes Go Up

In a Row, Expanded divides the available width between its children. Constraints go down to each child, and the child chooses a size within those constraints. Its size then goes up to its parent. This helps text wrap onto multiple lines instead of overflowing the screen.
