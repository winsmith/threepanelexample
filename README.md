# Add ability to toggle sidebars in three-pane-layout

Area: SwiftUI Framework
Type of Issue: Suggestion

When creating a destination-based Navigation View by using the init(content:)
initializer of NavigationView, I can easily create two-pane or three-pane navigation,
to create app layouts similar to the Apple Mail app for example: Two small sidebars,
and then a rightmost content area that is larger and more important. 

In my macOS app, I would like to imitate a different type of layout, similar to the
Xcode app: Main content in the middle, and two narrow, toggleable sidebars left and
right.

Currently, there is no what to easily achieve this kind of layout in SwiftUI, and
I'd like to suggest that there should be. 

I've created a sample project that approximates the kind of layout I'd like to 
achieve. The approximation uses various clunky techniques like walking down the
NSApp.window's responder chain until we find an object of class 
NSSplitViewController. I hope the SwiftUI will find better solutions for these 
kinds of problems.

## Sample Project

The sample project shows a macOS app that has both a left sidebar, and a right sidebar.
Navigation flows from left to right, just as with any split view. However, unlike
most apps that use the three-pane layout, it is important to me that the left and
right sidebars are smaller than the main content view in the center.

This way, the content of the middle pane is the most important, with the rightmost
sidebar a sort of inspector to change details of my selection without using up too
much space.

This example project uses a lot of unsafe introspection to approximate my goal: A
three-pane layout just like the one in Xcode, with toggleable sidebars. My hope is
that the SwiftUI team will find a more elegant solution.

Toggling the left pane off or on needs introspection into NSApp.keyWindow and
NSSplitViewItems, which is clunky and might be unsafe. I'd love a direct way to
access that from SwiftUI instead. (See LeftSidebarView.swift)

Toggling the right pane on or off is even more hacky: It requires a deep dive down
the responder chain with class comparison and optional casting and depends on the
way that NSSplitViewController structures its subviews. It would be really cool to
be able to do that directly from SwiftUI. (See View+toggleSidebar.swift)

## Minor Comments and improvement suggestions: 
- Toggling the right pane off and then on again has a missing animation.
- I have to duplicate the right toolbar button so it shows up at the right spot
  all the time. I wish I could just provide it once.
- Placement of the left toolbar button jumps around a lot, and when I toggle it,
  it sometimes disappears.
