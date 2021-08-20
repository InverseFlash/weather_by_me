# WeatherByMe

An open-source weather app with the aim to provide as much weather information as possible.

## Getting Started

This app utilizes the BLoC pattern using RxDart to provide asyncrounous data fetching.

Resources utilized:

- [RxDart](https://pub.dev/packages/rxdart)

## Preamble

This project is in active development and is not in a completed/releasable state.

## Notes

This codebase will hopefully serve as a solid reference for anyone looking into streams for state management, and for myself.  

To help in adhering to good coding practice, these key points will be followed:

- Keep code extensible
  - Write abstract classes to define requirements for further API provider implementation
  - Refactor often
- Maintain seperation of concerns
  - Create a seperate BLoC for each logical component.
    - Data fetching initiated by each component, and not "everything at once", will prevent data wait-time bottlenecks.  Particularly important as the app expands.

## Goals

### Short Term

Implement a detailed current weather breakdown on the main landing page and overhaul the UI to bring it in line with modern Material-UI design.

### Long Term

Implement multi-day forecasts, minute-by-minute forecasts, and historical weather data.

### Project  

Publish the app to the Play/Apple Store.  Continuously develop while using any revenue streams to gain further access to higher-tiered weather provider API's, and implement them.
