# sliding_panel_pro changelog

## [1.0.0-nullsafety.3] - Jun 2, 2021

- Verifying widget is mounted before calling setState().

## [1.0.0-nullsafety.2] - May 12, 2021

- Fixing code to be null-safety aware.

## [1.0.0-nullsafety.1] - Apr 29, 2021

- Updated code to be null-safety aware.

## [1.0.0-nullsafety.0] - Apr 08, 2021

- Initial version of `sliding_panel_pro`.
- Forked from [RaviKavaiya/sliding_panel](https://github.com/RaviKavaiya/sliding_panel).
- Opt into **null safety**.
- Sdk constraints: `>=2.12.0 <3.0.0`.
- Compatible with **flutter 2.0.0 stable**.
- Updated dependencies to latest release.

----------

## [1.3.2] - 14 October, 2020

- Use built-in AppBar for `PanelHeaderWidget` instead of custom implementation.

## [1.3.1] - 11 August, 2020

- **Fixed:** `PanelHeaderWidget` did not respect the `PanelHeaderOptions.centerTitle`.

- **Fixed:** When using modal panels with `SafeAreaConfig`, if the panel's content was larger, the top padding was not applied properly.

- **Fixed:** If panel was put in Scaffold without `AppBar`, panel occupied more space unnecessarily.

## [1.3.0] - 09 July, 2020

- **Fixed:** When `PanelHeaderWidget` was removed from panel at runtime and then using `PanelController.rebuild()` caused the header's height being miscalculated. [#21](https://github.com/RaviKavaiya/sliding_panel/issues/21) (Thanks to @FilipeLarga)

- **Breaking change:** The parameter `allowedDraggingTill` is now completely removed. It was deprecated since `v1.0.3`.

## [1.2.4] - 22 June, 2020

- **Fixed:** When `snapping: PanelSnapping.disabled` was used, the panel did not receive gestures if it was in between closed and expanded position. [#19](https://github.com/RaviKavaiya/sliding_panel/issues/19) (Thanks to @Warpath)

- **Fixed:** When panel's height was manipulated (e.g., `PanelController.setAnimatedPanelPosition()`) with the content of panel itself, it tried to reset its position.

## [1.2.3] - May 25, 2020

- **Fixed:** When `SlidingPanel` was put inside a `Stack` widget, the content behind Panel, was not receiving gestures. [#15](https://github.com/RaviKavaiya/sliding_panel/pull/15) (Thanks to @live9080)

## [1.2.2] - May 09, 2020

- **Fixed:** TextTheme deprecation warnings.

- **Fixed:** Some analyzer warnings of missing case clauses.

- **New:** Use `SafeAreaConfig.bodyHasSlivers` if you plan to use Slivers in `PanelContent.bodyContent`.

## [1.2.1] - April 22, 2020

- **Change:** From now, the default `safeAreaConfig` will be `SafeAreaConfig.all()`.

- **New:** `SafeAreaConfig.removePaddingFromContent` added, that controls whether to remove auto-padding from panel content as well.

- **Fixed:** When giving `animatedAppearing: true` or using a `modal` panel, rotating the device mistakenly moved the panel to `initialPanelState`.

- **Fixed:** When using a `modal` panel, rotating the device and closing the panel would not restore control back to parent.

- The `PanelController.rebuild()` is improved and also applies `safeAreaConfig`'s padding after rebuild.

- **Fixed:** When using modal panel, it would show an additional space on bottom on devices with notch (e.g., iPhone 11).

- **Fixed:** When using modal panel, it would under-measure the panel height (even if there was enough space on screen available).

- When panel's height reaches `0.0` position, the `PanelDecoration.boxShadows` are now hidden so that shadows are not visible even if the panel is closed.

- The panel is now wrapped in a `Material` widget, so that the `panelContent`'s widgets don't have to.

## [1.1.2] - April 14, 2020

- Fixed a bug that caused the `safeAreaConfig` to not work properly when giving `margin` to the `PanelDecoration`.

## [1.1.1] - April 14, 2020

- **Breaking change:** The parameter `useSafeArea` is now removed.

- **New:** Parameter `safeAreaConfig` now lets you choose the directions in which to apply the padding to avoid notch, status bar and **nav-bar** as well.

- **New:** `gradient`, `backgroundBlendMode` and `image` can now be provided to `PanelDecoration`.

## [1.0.5] - April 13, 2020

- **Fixes:** [#14](https://github.com/RaviKavaiya/sliding_panel/issues/14)

- **Change:** In this release, the way the `useSafeArea` parameter works, is changed. Instead of wrapping whole panel in `SafeArea`, only top, left and right padding will be applied as necessary.

  - That means from now, `PanelContent.bodyContent`, `BackdropConfig`'s shadow will be un-affected by `useSafeArea` parameter and will get full screen available.

## [1.0.4] - April 11, 2020

- **Fix:** `BackPressBehavior.CLOSE_PERSIST` was closing the parent route. Now it works as expected.

- **Breaking change:** `BackPressBehavior.CLOSE_PERSIST` is now also valid for two-state panels.

- **Breaking change:** `BackPressBehavior.COLLAPSE_CLOSE_PERSIST` is now considered as `BackPressBehavior.CLOSE_PERSIST` for two-state panels.

## [1.0.3] - March 30, 2020

- **New:** `useSafeArea` parameter, that allows you to wrap the panel inside the `SafeArea` parameter, in order to avoid notch and status bar of device!

- **Fix:** Opening/closing a modal panel several times caused the app to freeze, making it unable to interact with either the panel or the content. [#12](https://github.com/RaviKavaiya/sliding_panel/issues/12)

- **Fix:** An example caused height overflow.

- **Fix:** The panel did not remember previous position when device was rotated. Now, it remembers and animates correctly. Also, doesn't send duplicate events to listeners when such situation arises. Though this feature works for all types of panels, this is more effective when using `autoSizing`.

- **Deprecation:** The parameter `allowedDraggingTill` is now deprecated and should be avoided. It has some flaws that cause problems like panel not draggable, content not scrollable, etc. These issues won't be fixed and this feature may be removed in future releases. Apologies for that.

## [1.0.2] - March 25, 2020

- Fixed an issue that prevented the `headerContent` to take whole available Header width even if the `leading` was not specified. [#9](https://github.com/RaviKavaiya/sliding_panel/issues/9)

## [1.0.1] - January 24, 2020

`sliding_panel`'s first 2020 update comes with a bunch of changes, fixes and enhancements!

For migration to this version, visit the [**Migration guide**](https://github.com/RaviKavaiya/sliding_panel/wiki/Migration-guide).

### Dismissible panel

- Now, the panel can be dismissed. Means, it can work as **4-state** panel, namely `expanded, collapsed, closed and dismissed`.
- As a part of this change, `PanelController.dismiss()`, `PanelState.dismissed` and `InitialPanelState.dismissed` were added.
- _This works for two-state panels also!_

----------

### Modal panel

- Use `SlidingPanel` _exactly_ same as `showModalBottomSheet()`, by calling `showModalSlidingPanel()`. It pushes a new route, waits for a `Navigator.of(context).pop()`...
  And guess what, you can also send results back, same as you did in `showModalBottomSheet()`!!!

----------

### `PanelHeader` changes and improvements

- PanelHeader is now rendered as a `SliverAppBar`! It has its own advantages.
- PanelHeader now also accepts a parameter: `options`, an instance of `PanelHeaderOptions`, specially meant to customize the header.

----------

### `panelContent` changes

- **Breaking change:** `PanelContent.panelContent` now only accepts a `List<Widget>`. To get access to `ScrollController`, grab that by `PanelController.scrollData.scrollController`.
- **Breaking change:** As part of above change, you DON'T have to attach the `ScrollController` yourself to any Widget. It is now done **automatically**.
- `panelContent` is now _cached_, so that it doesn't require parent to provide the same content twice due to `PanelAutoSizing`.

----------

- **Breaking change:** `snapPanel` was removed. Instead, a new enum called `PanelSnapping` is introduced. (The parameter is now called `snapping`).
- **Breaking change:** In `PanelDecoration` , the `backgroundColor` defaults to the app's canvas color (i.e., `Theme.of(context).canvasColor`).
- **Breaking change:** The `Duration` is now calculated from `PanelState.dismissed` to `PanelState.expanded` instead of from `PanelState.closed` to `PanelState.expanded`.
- **Breaking change:** The `PanelController.popWithResult()` will `dismiss` the panel, instead of `close`. To avoid this, set `shouldCloseOnly` to `true`. (This also applies to a newly introduced `PanelController.popWithThrowResult()`).

- **Change:** Now, the PanelController doesn't throw error when it is re-assigned to different SlidingPanel. It simply ignores old one and points to new one.
- **Change:** `PanelCollapsedWidget` is now shown **below** the `PanelHeaderWidget`.
- **Refactor:** The code in `panel.dart` is refactored a lot. Now, it should be easy to understand.

----------

- **Fix + improved:** `PanelAutoSizing` related bugs fixed (they were many), unnecessary calculations removed.
- **Fix:** For calculating various heights, 'Screen height (and width)' was used. Now, available 'Constrained height' is used, for more accurate calculation.
- **Fix:** A bug fixed that caused `double.infinity` or `double.NaN` when duration was being calculated.
- **Fix:** A bug fixed that caused `double.NaN` when backdrop opacity was being calculated.
- **Fix:** A bug fixed that caused `double.NaN` when panel's expanded height was being calculated.
- **Fix:** `Disposed with active ticker` bug fixed. (Was caused when panel is animating and route is popped.)
- **Fix:** The panel now remembers the position when device's resolution / orientation changes.
- **Fix:** A bug with `BackPressBehavior.COLLAPSE_CLOSE_POP` fixed.

----------

- **New:** A whole new `Sliver` based layout, where the `PanelHeaderWidget` is a `SliverAppBar` and contents are inside `SliverList`.
- **New:** Call `rebuild()` on PanelController to recalculate the PanelSize again.
- **New:** New way to notify changes to the parent, using `throwResult()` and `popWithThrowResult()` which give results to `onThrowResult` callback.
- **New:** A new parameter called `useMinExpanded` available in `PanelAutoSizing`, so that `PanelSize.expandedHeight` also gets considered when calculating the height.
- **New:** A new parameter called `panelClosedOptions` available. Don't forget to check it out and decide what happens when the panel is closed.
- **New:** Now `PanelController.sizeData` gives two additional properties: `constrainedHeight` and `constrainedWidth`.
- **New:** New parameter: `animatedAppearing`. If true, the panel animates to `initialState`, initially.
- **New:** New parameter: `dragMultiplier`. Now decide the amount of the panel slides when user drags the panel.

## [0.7.0] - November 08, 2019

This release introduces below new features. There is no breaking change.

- **New:** Now you can specify panel's maximum width under different device orientations using `PanelMaxWidth` parameter.
- **New:** A new class `PanelFooterWidget` is added, so that you can give your panel a consistent bottom widget!
- **New:** A new class `PanelScrollData` is added, which is helpful to get current scrolling position of the panel.

## [0.5.0] - October 06, 2019

This package release introduces some API changes (majorly breaking changes) and a new underlying mechanism. Below are some of the changes. For complete list of changes and migration to this version, visit the [**Migration guide**](https://github.com/RaviKavaiya/sliding_panel/wiki/Migration-guide).

- **New:** Now specify what happens when user presses back button, using `BackPressBehavior` and `PanelPoppingBehavior`.
- **New:** Now you can specify the limit of user's dragging the panel, using `allowedDraggingTill` parameter.
- **New:** Now you can provide `Scrollable` element inside `panelContent`, so that the panel can be dragged and scrolled at the same time.
- **New:** `snappingTriggerPercentage` added, so that you have more control over panel snapping.
- **New:** A new class `PanelSizeData` is added (accessed from `PanelController`), which helps to get updated `PanelSize` parameters of this panel.
- When using `PanelAutoSizing`, you can not change values of `PanelSize` at runtime.
- `PanelController` also contains some new and breaking changes.
- `onPanelExpanded`, `onPanelCollapsed` and `onPanelClosed` are all combined in single : `onPanelStateChanged`.
- **Breaking change:** The `headerContent` is now moved to a separate `Widget` called `PanelHeaderWidget`.
- **Breaking change:** For `panelContent`, a new `typedef` is introduced, called `PanelBodyBuilder`.
- **Breaking change:** `PanelSize` class no longer accepts values in _pixels_. Only percentage values can be given from now.
- **New and Breaking change:** The `PanelState` : `animating` works in adifferent way and a new state `indefinite` added.

## [0.2.0] - September 13, 2019

Now, the package is updated with some improvements as below:

- The code is separated in multiple files for readability.
- Almost all the functions of PanelController return a `Future`, so that you can do some action afterwards.
- When a panel is visible, you can change the panel's height runtime and it will animate. (This feature is not stable).
- Now you can provide the height of the panel in percentage of the screen also.
- A persistent header widget can be provided.
- The panel's height can be automatically determined depending on content! (see `PanelAutoSizing` class for this).

## [0.1.0] - September 07, 2019

The initial release of the sliding_panel package. This includes below functions to the developers:

- A highly customisable Sliding panel
- Though many options available, it is made as easy as possible to tweak look and feel of the panel
- A panel can work as Three-state panel or traditional Two-state panel
- An easy to use PanelController, which helps getting current panel state and modifying its current state
- PanelController allows to animate the panel to arbitrary position
- Various callbacks that help getting current state of the panel
- Parallax and Backdrop effects on the panel
- Provide InitialPanelState property to decide how the panel is displayed initially
- Also responds to user gestures
- Panel can return arbitrary values back to the parent
