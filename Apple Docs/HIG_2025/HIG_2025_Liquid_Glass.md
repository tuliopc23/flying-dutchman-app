# Human Interface Guidelines 2025: Liquid Glass & Materials

This document compiles key documentation regarding the "Liquid Glass" design system introduced in 2025, including overview, custom view implementation, and material definitions.

---

## Liquid Glass (Overview)
*Source: https://developer.apple.com/documentation/technologyoverviews/liquid-glass*

Interfaces across Apple platforms feature a new dynamic material called Liquid Glass, which combines the optical properties of glass with a sense of fluidity. Learn how to adopt this material and embrace the design principles of Apple platforms to create beautiful interfaces that establish hierarchy, create harmony, and maintain consistency across devices and platforms.

Standard components from SwiftUI, UIKit, and AppKit like controls and navigation elements pick up the appearance and behavior of this material automatically. You can also implement these effects in custom interface elements.

### Adopting Liquid Glass

If you have an existing app, adopting Liquid Glass doesn’t mean reinventing your app from the ground up. Start by building your app in the latest version of Xcode to see the changes. Then, follow best practices in your interface to help your app look right at home on Apple platforms.

### Design principles

The Human Interface Guidelines contains guidance and best practices that can help you design a great experience for any Apple platform. Browse the HIG to discover more about adapting your interface for Liquid Glass.

- Define a layout and choose a navigation structure that puts the most important content in focus.
- Reimagine your app icon with simple, bold layers that offer dimensionality and consistency across devices and appearances.
- Be judicious with your use of color in controls and navigation so they stay legible and allow your content to infuse them and shine through.
- Ensure interface elements fit in with software and hardware design across devices.
- Adopt standard iconography and predictable action placement across platforms.

---

## Applying Liquid Glass to custom views
*Source: https://developer.apple.com/documentation/swiftui/applying-liquid-glass-to-custom-views*

Interfaces across Apple platforms feature a new dynamic material called Liquid Glass, which combines the optical properties of glass with a sense of fluidity. Liquid Glass is a material that blurs content behind it, reflects color and light of surrounding content, and reacts to touch and pointer interactions in real time. Standard components in SwiftUI use Liquid Glass. Adopt Liquid Glass on custom components to move, combine, and morph them into one another with unique animations and transitions.

### Apply and configure Liquid Glass effects

Use the `glassEffect(_:in:)` modifier to add Liquid Glass effects to a view. By default, the modifier uses the `regular` variant of `Glass` and applies the given effect within a `Capsule` shape behind the view’s content.

Configure the effect to customize your components in a variety of ways:

- Use different shapes to have a consistent look and feel across custom components in your app. For example, use a rounded rectangle if you’re applying the effect to larger components that would look odd as a `Capsule` or `Circle`.
- Assign a tint color to suggest prominence.
- Add `interactive(_:)` to custom components to make them react to touch and pointer interactions. This applies the same responsive and fluid reactions that `glass` provides to standard buttons.

Examples:

```swift
Text("Hello, World!")
    .font(.title)
    .padding()
    .glassEffect()

Text("Hello, World!")
    .font(.title)
    .padding()
    .glassEffect(in: .rect(cornerRadius: 16.0))

Text("Hello, World!")
    .font(.title)
    .padding()
    .glassEffect(.regular.tint(.orange).interactive())
```

### Combine multiple views with Liquid Glass containers

Use `GlassEffectContainer` when applying Liquid Glass effects on multiple views to achieve the best rendering performance. A container also allows views with Liquid Glass effects to blend their shapes together and to morph in and out of each other during transitions. Inside a container, each view with the `glassEffect(_:in:)` modifier renders with the effects behind it.

Customize the spacing on the container to control how the Liquid Glass effects behind views interact with one another. The larger the spacing value on the container, the sooner the Liquid Glass effects blend together and merge the shapes during a transition.

```swift
GlassEffectContainer(spacing: 40.0) {
    HStack(spacing: 40.0) {
        Image(systemName: "scribble.variable")
            .frame(width: 80.0, height: 80.0)
            .font(.system(size: 36))
            .glassEffect()

        Image(systemName: "eraser.fill")
            .frame(width: 80.0, height: 80.0)
            .font(.system(size: 36))
            .glassEffect()
            .offset(x: -40.0, y: 0.0)
    }
}
```

### Morph Liquid Glass effects during transitions

Morphing effects occur during transitions or animations between views with Liquid Glass effects. Coordinate transitions between views with effects in a container by using the `glassEffectID(_:in:)` modifier.

```swift
@State private var isExpanded: Bool = false
@Namespace private var namespace

var body: some View {
    GlassEffectContainer(spacing: 40.0) {
        HStack(spacing: 40.0) {
            Image(systemName: "scribble.variable")
                .frame(width: 80.0, height: 80.0)
                .font(.system(size: 36))
                .glassEffect()
                .glassEffectID("pencil", in: namespace)

            if isExpanded {
                Image(systemName: "eraser.fill")
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 36))
                    .glassEffect()
                    .glassEffectID("eraser", in: namespace)
            }
        }
    }
}
```

---

## Materials
*Source: https://developer.apple.com/design/human-interface-guidelines/materials*

A material is a visual effect that creates a sense of depth, layering, and hierarchy between foreground and background elements.

### Liquid Glass

Liquid Glass forms a distinct functional layer for controls and navigation elements — like tab bars and sidebars — that floats above the content layer, establishing a clear visual hierarchy between functional elements and content. Liquid Glass allows content to scroll and peek through from beneath these elements to give the interface a sense of dynamism and depth, all while maintaining legibility for controls and navigation.

**Don’t use Liquid Glass in the content layer.** Liquid Glass works best when it provides a clear distinction between interactive elements and content. Instead, use Standard materials for elements in the content layer.

**Use Liquid Glass effects sparingly.** Standard components from system frameworks pick up the appearance and behavior of this material automatically. If you apply Liquid Glass effects to a custom control, do so sparingly.

**Only use clear Liquid Glass for components that appear over visually rich backgrounds.** Liquid Glass provides two variants — `regular` and `clear`.
- The *regular* variant blurs and adjusts the luminosity of background content to maintain legibility.
- The *clear* variant is highly translucent, which is ideal for prioritizing the visibility of the underlying content.

### Standard materials

Use standard materials and effects — such as `UIBlurEffect`, `UIVibrancyEffect`, and `NSVisualEffectView.BlendingMode` — to convey a sense of structure in the content beneath Liquid Glass.

### Platform Considerations: macOS

macOS provides several standard materials with designated purposes, and vibrant versions.

**Choose a background blending mode that complements your interface design.** macOS defines two modes that blend background content: behind window and within window.
