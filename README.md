# GroceryList

**Overview**

GroceryList is a simple iOS application built using SwiftUI that allows users to:

- Add/Edit/Delete grocery items
- Assign categories to items
- Filter items by category using a capsule-style category bar
- View items in a clean and minimal interface
- The project demonstrates modern iOS development practices using SwiftUI and MVVM architecture.

**Tech Stack**

- Swift
- SwiftUI
- MVVM Architecture
- SwiftData
- Xcode 17+
- iOS 26.0+

**Features**

- Add/Edit/Delete new grocery items
- Category selection using capsule-style horizontal scroll bar
- Filter items by category
- Form validation (prevents empty item names)
- Clean and reusable components

**Architecture**

The project follows MVVM (Model-View-ViewModel):
  Model – Represents grocery item data
  ViewModel – Handles business logic and data operations
  View – SwiftUI-based UI components

**How to Run the Project**

1. Clone the repository
2. Open the .xcodeproj / .xcworkspace file in Xcode
3. Select an iOS simulator
4. Press Cmd + R to build and run

**Project Structure**

```
GroceryList/
│
├── Models/
│   ├── Category.swift
│   ├── GroceryItem.swift
├── ViewModels/
│   ├── GroceryListViewModel.swift
├── Views/
│   ├── AddItemView.swift
│   ├── CategoryBar.swift
│   └── CategoryPill.swift
│   └── EditItemView.swift
│   └── GroceryItemRow.swift
│   └── GroceryListHomeView.swift
├── Extensions/
│   ├── +categoryExtension.swift
│
└── GroceryListApp.swift
```

**Possible Improvements**

- Unit tests
- UI tests
- Animations for category transitions

**Author**

Shreya
Lead iOS Developer
