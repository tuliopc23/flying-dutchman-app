# Human Interface Guidelines 2025: Components

This document compiles key documentation regarding standard components in the 2025 Design System, focusing on Toolbars, Windows, Menus, Sidebars, and Tab Bars, with specific attention to macOS considerations.

---

## Toolbars
*Source: https://developer.apple.com/design/human-interface-guidelines/toolbars*

A toolbar provides convenient access to frequently used commands, controls, navigation, and search.

### Best practices

**Choose items deliberately to avoid overcrowding.** People need to be able to distinguish and activate each item.
**Add a More menu to contain additional actions.**
**In iPadOS and macOS apps, consider letting people customize the toolbar.** Toolbar customization is especially useful in apps that provide a lot of items.
**Reduce the use of toolbar backgrounds and tinted controls.** Use the content layer to inform the color and appearance of the toolbar, and use a `ScrollEdgeEffectStyle` when necessary.
**Prefer using standard components in a toolbar.**

### macOS Considerations

In a macOS app, the toolbar resides in the frame at the top of a window, either below or integrated with the title bar. Note that window titles can display inline with controls, and toolbar items don’t include a bezel.

**Make every toolbar item available as a command in the menu bar.** Because people can customize the toolbar or hide it, it can’t be the only place that presents a command.

---

## Windows
*Source: https://developer.apple.com/design/human-interface-guidelines/windows*

A window presents UI views and components in your app or game.

### Best practices

**Make sure that your windows adapt fluidly to different sizes.**
**Avoid opening new windows as default behavior unless it makes sense for your app.**
**Avoid creating custom window UI.** System-provided windows look and behave in a way that people understand and recognize.

### macOS Considerations

In macOS, people typically run several apps at the same time, viewing windows from multiple apps.

#### macOS window anatomy
A macOS window consists of a frame and a body area. The frame includes window controls and a toolbar.

#### macOS window states
- **Main:** The frontmost window.
- **Key:** The active window that accepts input.
- **Inactive:** A window not in the foreground. Inactive windows don't use Materials (the effect that pulls color from content underneath), making them appear subdued.

**Make sure custom windows use the system-defined appearances.** When you use system-provided components, a window’s background and button appearances update automatically when the window changes state.
**Avoid putting critical information or actions in a bottom bar.**

---

## Menus
*Source: https://developer.apple.com/design/human-interface-guidelines/menus*

A menu reveals its options when people interact with it, making it a space-efficient way to present commands.

### Best practices

**For each menu item, write a label that clearly and succinctly describes it.** Use title-style capitalization.
**Represent menu item actions with familiar icons.** Use standard icons (SF Symbols) where possible.
**Organize menu items logically.** List important items first and group related items with separators.
**Use submenus sparingly.** Limit depth to one level and length to about five items.

### macOS Considerations
(No specific macOS considerations listed beyond standard menu behavior, but implies standard menu bar usage).

---

## Sidebars
*Source: https://developer.apple.com/design/human-interface-guidelines/sidebars*

A sidebar appears on the leading side of a view and lets people navigate between sections in your app or game.

### Best practices

**Extend content beneath the sidebar.** Sidebars float above content in the Liquid Glass layer. Extend content beneath it or use `backgroundExtensionEffect()`.
**When possible, let people customize the contents of a sidebar.**
**Consider letting people hide the sidebar.**
**In general, show no more than two levels of hierarchy.**

### macOS Considerations

A sidebar’s row height, text, and glyph size depend on its overall size (small, medium, large).

**Avoid stylizing your app by specifying a fixed color for all sidebar icons.** By default, sidebar icons use the current accent color.
**Consider automatically hiding and revealing a sidebar when its container window resizes.**
**Avoid putting critical information or actions at the bottom of a sidebar.**

---

## Tab bars
*Source: https://developer.apple.com/design/human-interface-guidelines/tab-bars*

A tab bar lets people navigate between top-level sections of your app.

### Best practices

**Use a tab bar to support navigation, not to provide actions.**
**Avoid overflow tabs.**
**Include tab labels.** Use single words whenever possible.
**Use SF Symbols.**
**Avoid applying a similar color to tab labels and content layer backgrounds.**

### Platform Considerations
(Tab bars are primarily an iOS/iPadOS/tvOS/visionOS concept. macOS apps typically use Toolbars or Sidebars for top-level navigation, or a Segmented Control which is functionally similar but visually distinct).
