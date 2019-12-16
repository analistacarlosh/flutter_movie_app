# movie_app
 
## Functional Requirements

- [x] Scroll through the list of upcoming movies - including movie name, poster or backdrop image, genre and release date. List should not be limit to show only the first 20 movies as returned by the API.
- [x] Select a specific movie to see details (name, poster image, genre, overview and release date).
- [x] Search for movies by entering a partial or full movie name (Optional).
  
## To Do improvements
- [] Inform user about no internet connection;
- [] Unit and Widgets tests;

## List of third-party libraries used

-  [provider: ^3.1.0+1](https://pub.dev/packages/provider)
I have used Provider as state manager to manage the list of movies. In my opnion, Provider helps to manage state in a simple and clean way.
  
-  [get_it: ^3.0.3](https://pub.dev/packages/get_it)
Get_it helps us to control the Dependency Injection between the class in the application, and I'm using on state, service and repository.
  
-  [dio: ^3.0.7](https://pub.dev/packages/dio)
Dio is Http client that provide us advanced and simple options to work with Http request.

-  [dio_http_cache: ^0.2.5](https://pub.dev/packages/dio_http_cache)
Combined with Dio http client, Dio http cache provide us a simple way to cache requests per day and hours.
I'm using to cache the Genre list for 1 hour as this type of data should be not change constantly.

-  [cached_network_image: ^1.1.1](https://pub.dev/packages/cached_network_image)
Cached network image library helps us to cache image that we access many times.
I'm using to cache and render the Movies images.