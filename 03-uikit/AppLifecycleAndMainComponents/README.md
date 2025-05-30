# App Lifecycle & Main Components

This module introduces key UIKit components and system behaviors that every iOS developer must understand. You will explore how the UI is structured, how user interaction is handled, and how the app transitions through its lifecycle stages.

---

## 🧱 Core Topics

### 1. UIWindow & UISceneConfiguration

**🧠 Concept:**  
- `UIWindow` is the root container for your app's visible content.  
- `UISceneConfiguration` enables multitasking by supporting multiple scenes.

**🎯 Learning Objectives:**
- Understand how `UIWindow` fits into the app architecture.
- Learn how `UISceneConfiguration` manages scene-based lifecycle and multitasking.
- Explore programmatic setup of `UIWindow` and custom scene configurations.

**📘 Self-Learn Resources:**
- [UIWindow](https://developer.apple.com/documentation/uikit/uiwindow)
- [UISceneConfiguration](https://developer.apple.com/documentation/uikit/uisceneconfiguration)
- [Managing Multiple Windows and Scenes](https://developer.apple.com/documentation/uikit/app_and_environment/scenes)
- [SceneDelegate Overview](https://developer.apple.com/documentation/uikit/uiscenedelegate)

**❓ Self-Check:**
- What is `UIWindow`, and how does it relate to `UIViewController`?
- How does `UISceneConfiguration` enable multitasking?
- How do you initialize and attach a `UIWindow` manually?

---

### 2. UIView vs UIViewController

**🧠 Concept:**  
- `UIView` renders visual content.  
- `UIViewController` manages a view's lifecycle and coordinates its behavior.

**🎯 Learning Objectives:**
- Differentiate `UIView` and `UIViewController` responsibilities.
- Learn view creation via code and Interface Builder (IB).
- Explore lifecycle methods and navigation flow.

**📘 Self-Learn Resources:**
- [UIView](https://developer.apple.com/documentation/uikit/uiview)
- [UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller)
- [Designing User Interaction](https://developer.apple.com/design/human-interface-guidelines)
- [View Controller Lifecycle](https://developer.apple.com/documentation/uikit/viewcontroller)

**❓ Self-Check:**
- How do `UIView` and `UIViewController` differ?
- What are key lifecycle methods of a view controller?
- How do you add a subview programmatically?
- What is the role of Interface Builder?

---

### 3. UILabel

**🧠 Concept:**  
A non-interactive component used for displaying static text.

**🎯 Learning Objectives:**
- Configure a `UILabel`'s text, style, and alignment.
- Handle dynamic sizing and multiline content.

**📘 Self-Learn Resources:**
- [UILabel](https://developer.apple.com/documentation/uikit/uilabel)
- [Configuring UILabel](https://developer.apple.com/documentation/uikit/uilabel)
- [Auto Layout with Labels](https://developer.apple.com/documentation/uikit/uiview/using_autolayout)

**❓ Self-Check:**
- How do you set a label’s font, color, and alignment?
- How do you enable multiline support?

---

### 4. UIButton

**🧠 Concept:**  
A tappable UI element that triggers actions.

**🎯 Learning Objectives:**
- Learn to create and style buttons.
- Assign and handle tap events programmatically.

**📘 Self-Learn Resources:**
- [UIButton](https://developer.apple.com/documentation/uikit/uibutton)
- [UIButton Configuration](https://developer.apple.com/documentation/uikit/uibutton/configuration)
- [Handling Button Actions](https://developer.apple.com/documentation/uikit/uibutton#action-handling)

**❓ Self-Check:**
- How do you set up actions for a `UIButton`?
- What event types can buttons handle (e.g., `.touchUpInside`)?

---

### 5. UITextField

**🧠 Concept:**  
A single-line input field for text entry.

**🎯 Learning Objectives:**
- Set up and customize a `UITextField`.
- Respond to editing events and manage keyboard behavior.

**📘 Self-Learn Resources:**
- [UITextField](https://developer.apple.com/documentation/uikit/uitextfield)
- [UITextFieldDelegate](https://developer.apple.com/documentation/uikit/uitextfielddelegate)
- [Keyboard Handling](https://developer.apple.com/documentation/uikit/uiresponder/keyboard_notifications)

**❓ Self-Check:**
- How do you show a placeholder?
- How can you detect editing began or ended?
- How do you dismiss the keyboard on return?

---

### 6. UITextView (📝 TO ADD CONTENT)

> *Note: This section is currently under development.*

---

### 7. View Hierarchy

**🧠 Concept:**  
The structure of how views are nested and rendered, forming a tree with parent-child relationships.

**🎯 Learning Objectives:**
- Understand how view trees define UI structure.
- Learn about z-indexing and rendering order.

**📘 Self-Learn Resources:**
- [View Hierarchies in UIKit](https://developer.apple.com/documentation/uikit/view_hierarchy)
- [Debugging View Hierarchy in Xcode](https://developer.apple.com/documentation/xcode/view_debugging)

**❓ Self-Check:**
- What defines the iOS view hierarchy?
- How are child views rendered in relation to parents?
- How do you debug view hierarchies in Xcode?

---

### 8. App Lifecycle

**🧠 Concept:**  
Defines the app's runtime states — from launch to background to termination — and how you respond to transitions.

**🎯 Learning Objectives:**
- Identify the key lifecycle states: Not Running, Inactive, Active, Background, Suspended.
- Understand the roles of `AppDelegate` vs `SceneDelegate`.
- Handle launch, background, and termination events gracefully.

**📘 Self-Learn Resources:**
- [App Lifecycle Overview](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)
- [UIApplicationDelegate](https://developer.apple.com/documentation/uikit/uiapplicationdelegate)
- [SceneDelegate](https://developer.apple.com/documentation/uikit/uiscenedelegate)

**❓ Self-Check:**
- What are the primary states in the app lifecycle?
- How do `AppDelegate` and `SceneDelegate` differ?
- How do you persist state before termination?

---

[Answers](./Answers.md)

## 🧠 Final Thoughts

Mastering these components will prepare you for deeper UI design, app logic, and state management. Take the time to explore each topic with intention — they form the scaffolding for all future development.

---

> 🔁 **Pro Tip:** Reinforce learning with short practice projects using only code (no Interface Builder) to internalize UIKit’s behavior.