# ManagingDesign
An Approach to Managing Design in Swift iOS Apps


We will briefly explore various ways to define and use design constants and resources in an iOS app built using Swift. Then we’ll dive into one specific approach to centrally manage an app’s look and feel in a robust, extensible, and Swiftly idiomatic way.

Branches in this repo:

We use branches to demonstrate different states of the overall approach:
- no_style: plain app with no design styling
- master: first phase of central Design struct, uses hierarchical structs and private enums
- design_config: second phase, implements a theme switcher by initing and modifying DesignConfig private structs
- design_protocol: third phase, inits full Theme structs that conform to ConfigurableTheme protocol

