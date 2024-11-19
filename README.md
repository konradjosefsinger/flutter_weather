[bloclibrary.dev - weather app](https://bloclibrary.dev/tutorials/flutter-weather/)

Manage multiple Cubits to implement:
- dynamic theming
- pull to refresh

Separate applications into layers
- data
- repository
- business logic
- presentation

-> The theme of the application should reflect the weather for the chosen city
-> Application state should persist across sessions: i.e., the app should remember its state after the closing and reopening it
(using HydratedBloc)

### Key Concepts
- Observe state changes with BlocObserver
- BlocProvider, Flutter widget that handles building the widget in response to new states
- BlocBuilder, Flutter widget that handles building the widget in response to new states
- Prevent unnecessary rebuilds with Equatable
- RepositoryProvider, a Flutter widget which provides a repository to its children
- BlocListener, a Flutter widget which invokes the listener code in response to state changes in the bloc
- MultiBlocProvider, a Flutter widget that merges multiple BlocProvider widgets into one
- BlocConsumer, a Flutter widget that exposes a builder and listener in order to react to new states
- HydratedBloc to manage and persist state

### Architecture
Following the bloc architecture guidelines, the application will consist of several layers
- **Data**: retrieve raw weather data from an API
- **Repository**: abstract the data layer and expose domain models for the application to consume
- **Business Logic**: manage the state of each feature
- **Presentation**: display weather information and collect input from users

### Data Layer
[Open Meteo API](https://open-meteo.com/)
For this application the folowing endpoints of the Open Meteo API are used:
- (https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1) to get a location for a given city name
- (https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true) to get the weather for a given location