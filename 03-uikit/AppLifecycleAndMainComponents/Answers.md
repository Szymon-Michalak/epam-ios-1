# Self-Check Answers

This document provides answers to the self-check questions from **iOS Junior Training Course #1: App Lifecycle & Main Components**. Use it to validate your understanding and fill in any knowledge gaps.

---

## 📌 UIWindow & UISceneConfiguration

**Q: What is `UIWindow`, and how does it relate to `UIViewController`?**  
**A:** `UIWindow` is the root container for your app's views and is responsible for presenting the visual interface. It hosts the root `UIViewController`, which manages the app's initial view hierarchy.

**Q: What is `UISceneConfiguration`, and how does it manage scenes in multitasking?**  
**A:** `UISceneConfiguration` specifies how a new scene (instance of your UI) should be created, including the delegate class and storyboard. It's used in apps that support multiple windows or scenes, enabling multitasking and state restoration.

**Q: How would you set up a `UIWindow` programmatically?**  
**A:**  
```swift
window = UIWindow(frame: UIScreen.main.bounds)
window?.rootViewController = YourRootViewController()
window?.makeKeyAndVisible()
````

---

## 📌 UIView vs UIViewController

**Q: What is the difference between `UIView` and `UIViewController`?**
**A:** `UIView` is responsible for rendering UI elements and handling layout and drawing. `UIViewController` manages a view or group of views and handles logic, events, and transitions.

**Q: List the main lifecycle methods of `UIViewController`.**
**A:**

* `viewDidLoad()`
* `viewWillAppear(_:)`
* `viewDidAppear(_:)`
* `viewWillDisappear(_:)`
* `viewDidDisappear(_:)`
* `deinit`

**Q: How can you add a subview to a `UIView` programmatically?**
**A:**

```swift
let subview = UIView()
parentView.addSubview(subview)
```

**Q: What is the purpose of Interface Builder in managing views?**
**A:** Interface Builder (IB) provides a graphical UI to design and configure view hierarchies, constraints, and properties without writing code, enabling rapid prototyping and WYSIWYG layout.

---

## 📌 UILabel

**Q: What is `UILabel` used for?**
**A:** `UILabel` displays non-interactive, read-only text within the UI.

**Q: How can you change the font size and text color of a `UILabel`?**
**A:**

```swift
label.font = UIFont.systemFont(ofSize: 16)
label.textColor = .red
```

**Q: How do you make a `UILabel` support multiple lines of text?**
**A:**

```swift
label.numberOfLines = 0 // 0 means unlimited
label.lineBreakMode = .byWordWrapping
```

---

## 📌 UIButton

**Q: What is `UIButton` used for, and how do you assign actions to it?**
**A:** `UIButton` is used for capturing user taps and triggering actions. You assign actions using `addTarget(_:action:for:)`.

```swift
button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
```

**Q: How can you customize a `UIButton`’s title and background color?**
**A:**

```swift
button.setTitle("Submit", for: .normal)
button.backgroundColor = .blue
```

**Q: What are some events `UIButton` can respond to (e.g., `.touchUpInside`)?**
**A:**

* `.touchUpInside` (most common)
* `.touchDown`
* `.touchUpOutside`
* `.valueChanged`

---

## 📌 UITextField

**Q: How do you configure a placeholder in a `UITextField`?**
**A:**

```swift
textField.placeholder = "Enter your name"
```

**Q: How can you detect when a user begins editing a `UITextField`?**
**A:** Implement the `textFieldDidBeginEditing(_:)` method from `UITextFieldDelegate`.

**Q: What method is used to dismiss the keyboard when the return key is pressed?**
**A:** Use the `textFieldShouldReturn(_:)` delegate method and call:

```swift
textField.resignFirstResponder()
```

---

## 📌 View Hierarchy

**Q: What is a view hierarchy in iOS?**
**A:** A structured tree of views, where each view may have subviews, forming a parent-child relationship that determines rendering and layout order.

**Q: How does the parent-child relationship affect the rendering of views?**
**A:** Parent views render before their children. The order in `subviews` affects layering (z-order) — later subviews appear above earlier ones.

**Q: What tools in Xcode help debug the view hierarchy?**
**A:** Use the “View Debugger” by pausing execution and clicking “Debug View Hierarchy” in Xcode. It presents a 3D exploded view of the UI tree.

---

## 📌 App Lifecycle

**Q: What are the main states in the app lifecycle?**
**A:**

1. **Not Running** – App hasn’t been launched.
2. **Inactive** – Temporarily not receiving events.
3. **Active** – Running and receiving events.
4. **Background** – Running but not visible.
5. **Suspended** – In memory but not executing code.

**Q: What is the difference between `AppDelegate` and `SceneDelegate`?**
**A:**

* `AppDelegate` handles global app events (launch, termination, push notifications).
* `SceneDelegate` handles per-scene UI lifecycle events (scene creation, state restoration, window setup).

**Q: How do you save app state before termination?**
**A:** Implement `applicationWillTerminate(_:)` in `AppDelegate` and persist necessary data using UserDefaults, Core Data, or file writing.

```swift
func applicationWillTerminate(_ application: UIApplication) {
    // Save data here
}
```

