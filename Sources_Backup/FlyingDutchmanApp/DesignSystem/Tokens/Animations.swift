// Animations.swift
// Flying Dutchman Design System - Animation & Transition Tokens
// Tahoe-native spring animations and fluid transitions

import SwiftUI

extension DesignSystem {
    /// Animation presets for consistent motion design
    /// Uses native SwiftUI spring animations aligned with Tahoe fluidity
    public enum Animations {
        // MARK: - Spring Animations (Tahoe Standard)
        
        /// Standard spring - balanced animation for most interactions
        /// Response: 0.5s, Damping: 0.6 (slightly bouncy)
        public static let standard = Animation.spring(
            response: 0.5,
            dampingFraction: 0.6,
            blendDuration: 0
        )
        
        /// Quick spring - fast interactions (button presses, toggles)
        /// Response: 0.3s, Damping: 0.7 (minimal bounce)
        public static let quick = Animation.spring(
            response: 0.3,
            dampingFraction: 0.7,
            blendDuration: 0
        )
        
        /// Smooth spring - fluid, graceful animations (sheets, modals)
        /// Response: 0.6s, Damping: 0.75 (smooth, no overshoot)
        public static let smooth = Animation.spring(
            response: 0.6,
            dampingFraction: 0.75,
            blendDuration: 0
        )
        
        /// Bouncy spring - playful, emphasized actions
        /// Response: 0.4s, Damping: 0.5 (noticeable bounce)
        public static let bouncy = Animation.spring(
            response: 0.4,
            dampingFraction: 0.5,
            blendDuration: 0
        )
        
        /// Snappy spring - instant feedback (command palette, spotlight)
        /// Response: 0.25s, Damping: 0.8 (very tight)
        public static let snappy = Animation.spring(
            response: 0.25,
            dampingFraction: 0.8,
            blendDuration: 0
        )
        
        // MARK: - Ease Curves (Alternative to Springs)
        
        /// Ease in-out - smooth acceleration/deceleration
        /// Duration: 0.3s
        public static let easeInOut = Animation.easeInOut(duration: 0.3)
        
        /// Ease out - quick start, slow finish
        /// Duration: 0.25s
        public static let easeOut = Animation.easeOut(duration: 0.25)
        
        /// Linear - constant speed (for continuous animations)
        /// Duration: 0.3s
        public static let linear = Animation.linear(duration: 0.3)
        
        // MARK: - Durations (for custom animations)
        
        /// Instant - 0.1s (micro-interactions)
        public static let durationInstant: Double = 0.1
        
        /// Fast - 0.2s (quick feedback)
        public static let durationFast: Double = 0.2
        
        /// Normal - 0.3s (standard transitions)
        public static let durationNormal: Double = 0.3
        
        /// Moderate - 0.5s (deliberate changes)
        public static let durationModerate: Double = 0.5
        
        /// Slow - 0.75s (emphasis, storytelling)
        public static let durationSlow: Double = 0.75
    }
    
    /// Transition presets for view insertion/removal
    public enum Transitions {
        /// Liquid morph - scale + opacity (Tahoe signature)
        public static var liquidMorph: AnyTransition {
            .scale(scale: 0.95).combined(with: .opacity)
        }
        
        /// Slide in from leading edge
        public static var slideInLeading: AnyTransition {
            .move(edge: .leading).combined(with: .opacity)
        }
        
        /// Slide in from trailing edge
        public static var slideInTrailing: AnyTransition {
            .move(edge: .trailing).combined(with: .opacity)
        }
        
        /// Slide in from top
        public static var slideInTop: AnyTransition {
            .move(edge: .top).combined(with: .opacity)
        }
        
        /// Slide in from bottom
        public static var slideInBottom: AnyTransition {
            .move(edge: .bottom).combined(with: .opacity)
        }
        
        /// Fade scale - subtle appearance
        public static var fadeScale: AnyTransition {
            .scale(scale: 0.98).combined(with: .opacity)
        }
        
        /// Pop in - emphasized appearance
        public static var popIn: AnyTransition {
            .scale(scale: 0.8).combined(with: .opacity)
        }
    }
}

// MARK: - SwiftUI View Extensions

extension View {
    /// Animate with design system animation
    /// - Parameter animation: Animation from DesignSystem.Animations
    /// - Parameter value: Value to observe for changes
    public func animate<V: Equatable>(
        _ animation: Animation = DesignSystem.Animations.standard,
        value: V
    ) -> some View {
        self.animation(animation, value: value)
    }
    
    /// Apply liquid morph transition (Tahoe signature)
    public func liquidMorphTransition() -> some View {
        self.transition(DesignSystem.Transitions.liquidMorph)
    }
    
    /// Apply slide-in transition
    /// - Parameter edge: Edge to slide from
    public func slideTransition(from edge: Edge) -> some View {
        switch edge {
        case .leading:
            return AnyView(self.transition(DesignSystem.Transitions.slideInLeading))
        case .trailing:
            return AnyView(self.transition(DesignSystem.Transitions.slideInTrailing))
        case .top:
            return AnyView(self.transition(DesignSystem.Transitions.slideInTop))
        case .bottom:
            return AnyView(self.transition(DesignSystem.Transitions.slideInBottom))
        }
    }
}

// MARK: - Usage Examples

/*
 // Button with quick feedback
 Button("Action") {
     withAnimation(DesignSystem.Animations.quick) {
         isActive.toggle()
     }
 }
 
 // Smooth sheet presentation
 .sheet(isPresented: $showSheet) {
     SheetContent()
 }
 .animation(DesignSystem.Animations.smooth, value: showSheet)
 
 // Liquid morph for command palette
 if showPalette {
     CommandPaletteView()
         .liquidMorphTransition()
 }
 
 // Custom spring animation
 Circle()
     .scaleEffect(isPressed ? 0.9 : 1.0)
     .animation(DesignSystem.Animations.bouncy, value: isPressed)
 
 // Slide-in sidebar
 if showSidebar {
     SidebarView()
         .slideTransition(from: .leading)
 }
 
 // Snappy command palette invocation
 Text("⌘K Palette")
     .opacity(showHint ? 1 : 0)
     .animation(DesignSystem.Animations.snappy, value: showHint)
 
 // Respect reduced motion
 @Environment(\.accessibilityReduceMotion) var reduceMotion
 
 let animation = reduceMotion 
     ? .easeInOut(duration: 0.1)  // Minimal animation
     : DesignSystem.Animations.standard
 
 Circle()
     .scaleEffect(isActive ? 1.2 : 1.0)
     .animation(animation, value: isActive)
 */

// MARK: - Tahoe Motion Guidelines

/*
 Liquid Glass Animation Principles:
 
 1. **Springs over ease curves**
    - Springs feel more natural and responsive
    - Tahoe design favors spring-based motion
    - Use ease curves only for continuous loops or specific timing needs
 
 2. **Response & damping tuning**
    - Response: How quickly animation completes (lower = faster)
    - Damping: How much bounce (lower = more bounce)
    - Tahoe default: response ~0.5s, damping ~0.6–0.75
 
 3. **Animation contexts**
    - Instant (0.1s): Hover states, focus rings
    - Quick (0.2–0.3s): Button presses, toggles, selections
    - Standard (0.3–0.5s): Navigation, sheets, modals
    - Slow (0.75s+): Onboarding, storytelling, emphasis
 
 4. **Transitions**
    - Liquid morph: Scale 0.95 + opacity (Tahoe signature)
    - Slide: Move from edge + opacity (sidebars, panels)
    - Fade scale: Subtle appearance (tooltips, hints)
 
 5. **Accessibility**
    - ALWAYS respect `accessibilityReduceMotion`
    - Provide instant or minimal animation alternatives
    - Never rely solely on animation to convey state
 
 6. **Performance**
    - Animate transform/opacity (GPU-accelerated)
    - Avoid animating layout (frame, padding) when possible
    - Use `.drawingGroup()` for complex animations
 */
