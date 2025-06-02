
  

# ReadPop

  

A SwiftUI-based iOS application to browse the most popular articles from The New York Times. Built with MVVM architecture, Combine, and reusable UI components to deliver a modern and accessible news reading experience.

 
---

## Features

  

### Articles List (SwiftUI + Combine)

Displays a scrollable, responsive list of articles fetched from the NYT API, including:

- Article title
- Preview image
- Publication date
- Category (section)

  

### Article Details

A detailed view that showcases:

- Article image (full width)
- Full title with styling
- Author and publish date
- Summary/abstract text
- Section info
- Button to open the full article in Safari

  

### Period Filter (SwiftUI)

User can switch between most viewed articles in:

- Last 1 day
- Last 7 days
- Last 30 days

  

### Error Handling & Loading

- Custom loader view with animation

- Error view with retry capability

  

---

  

## Technologies Used

  

- ****SwiftUI****: Modern declarative UI for building native UIs.

- ****Combine****: Reactive data flow and state binding.

- ****MVVM Architecture****: Clean separation between business logic and UI.

- ****Modular Structure****: Organized into Core, Config, Features, and UI Modules.

- ****Dependency Injection****: Manual, lightweight DI for clarity and testability.

  

---

  

## Screenshots

  


<p align="center">
  <img src="list2.png" alt="List 2" width="200"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="list.png" alt="List" width="200"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="details.png" alt="Details" width="200"/>
</p>
  

---

  

## Installation

  

1. Clone the repository:

```bash

git clone https://github.com/AfnanTheeb/ReadPop.git

cd ReadPop

```

  

2. Open the project in Xcode:

```bash

open ReadPop.xcodeproj

```

  

3. Add your NYT API key in `Base.xcconfig`:

```swift

 NYT_API_KEY = "your-api-key-here"

```

  

4. Build and run the app.

  

---

  

## API Information

  

We are using the Most Popular Articles API:

  

```http

GET https://api.nytimes.com/svc/mostpopular/v2/viewed/{period}.json?api-key=your-api-key

```

- `period`: can be `1`, `7`, or `30` (days)

- Requires NYT Developer Key from [developer.nytimes.com](https://developer.nytimes.com/get-started)

  

---

  

## Testing

  

- Unit tests are provided for key view models and services

- Mocks used to isolate logic and ensure coverage

- Run tests using:

```bash

Cmd + U in Xcode

```

  

---

  

## Restrictions

  

- ❌  WebViews are not used in this project

- ✅  All article content is rendered using native SwiftUI views

  
---

  
  

## License

  

This project is licensed under the MIT License.

  

---

  

## Author

  

****Afnan Mohammed****

iOS Engineer • SwiftUI Enthusiast

[GitHub](https://github.com/AfnanTheeb)
