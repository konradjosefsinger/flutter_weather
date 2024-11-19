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