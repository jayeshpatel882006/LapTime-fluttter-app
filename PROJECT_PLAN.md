# LapTime App

## Project Overview

Develop a premium LapTime application using Flutter that follows Material 3 design principles. The application should have a modern, clean, and minimal interface with smooth animations, responsive layouts, and production-ready code.

The project should be structured using clean architecture by separating UI, business logic, models, and utilities.

---

# Goals

- Learn Flutter fundamentals.
- Understand Timer.periodic().
- Learn StatefulWidget.
- Build reusable widgets.
- Practice clean architecture.
- Create a professional utility application.

---

# Core Features

## LapTime Timer

- Start LapTime Timer
- Pause LapTime Timer
- Resume LapTime Timer
- Reset LapTime Timer
- Display Hours : Minutes : Seconds : Milliseconds
- Unlimited Lap Recording
- Automatically clear laps after reset

---

# Adaptive Controls

Only **two buttons** should ever be visible.

### Initial State

Left Button

Start

Right Button

Reset (Disabled)

---

### Running State

Left Button

Pause

Right Button

Lap

---

### Paused State

Left Button

Resume

Right Button

Reset

---

# Timer Display

Display format

HH : MM : SS . MMM

Examples

00 : 00 : 00 . 000

01 : 24 : 18 . 593

Use monospaced digits to prevent layout shifting.

---

# Lap Section

Display newest lap first.

Each lap card should contain

Lap Number

Elapsed Time

Beautiful Material 3 Card

Smooth insertion animation

Scrollable list

---

# UI / UX Requirements

Use Material 3.

Dark Theme.

Large centered timer.

Rounded buttons.

Circular action buttons.

Soft shadows.

Animated button transitions.

Responsive layout.

Modern typography.

Consistent spacing.

Elegant color palette.

No visual clutter.

Premium user experience.

---

# Folder Structure

lib/

main.dart

app.dart

screens/

stopwatch_screen.dart

widgets/

timer_display.dart

adaptive_buttons.dart

lap_card.dart

lap_list.dart

services/

stopwatch_service.dart

models/

lap_model.dart

utils/

constants.dart

theme.dart

---

# Architecture

Separate Business Logic from UI.

Widgets should never manage lap time calculations.

All stopwatch logic must exist inside stopwatch_service.dart.

Create reusable widgets whenever possible.

---

# State Management

Use only Flutter's built-in

setState()

No Provider.

No Riverpod.

No Bloc.

No GetX.

---

# Performance

Dispose Timer correctly.

Avoid unnecessary rebuilds.

Use const constructors where possible.

Reuse widgets.

Optimize animations.

---

# Accessibility

Minimum touch target 48dp.

Readable typography.

High contrast colors.

Landscape-safe layout.

---

# Code Standards

Meaningful file names.

Meaningful variable names.

No duplicated code.

Well-commented complex logic.

Flutter lint compliant.

No deprecated APIs.

No warnings.

---

# Deliverables

Production-ready Flutter application.

Modern UI.

Responsive design.

Smooth animations.

Clean architecture.

Reusable widgets.

No warnings.

No TODO comments.

Ready for Android build.

---

# Future Enhancements

Light Theme

Vibration Feedback

Tick Sound

Save Lap History

Export Lap History

Custom Accent Colors

Settings Page
