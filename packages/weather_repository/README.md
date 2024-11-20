### Repository Layer
The goal of the repository layer is to abstract the data layer and facilitate communication with the bloc layer. In doing this, the rest of the codebase depends only on functions exposed by the repository layer instead of specific data provider implementations. This allows to change data providers without disrupting any of the application-level code. For example, if it's decided to migrate away from this particular weather API, one should be able to create a new API client and swap it out without having to make changes to the public API of the repository or application layers.