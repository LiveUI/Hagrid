# Hagrid

Brings grid layout to the Apple platforms!

<table>
	<tr>
		<td><img src="https://github.com/LiveUI/TheGrid/blob/master/Other/12-column.png?raw=true" alt="" />&nbsp;</td>
		<td>&nbsp;<img src="https://github.com/LiveUI/TheGrid/blob/master/Other/8-column.png?raw=true" alt="" />&nbsp;</td>
		<td>&nbsp;<img src="https://github.com/LiveUI/TheGrid/blob/master/Other/22-column.png?raw=true" alt="" /></td>
	</tr>
</table>

## Usage

```swift
// Add an album cover from the first column to 5
// (please note we are using just a plain Int instead of the Position object below)
// To make the album square we have used a custom closure with SnapKit's own `ConstraintMaker` (make) at the end of the method
gridView.add(subview: albumCover, space: 5) { make in
    make.height.equalTo(self.albumCover.snp.width)
}

// Add album title label, stretching (12px padding) from the album cover image to the end of the grid view
gridView.add(subview: albumTitleLabel, from: albumCoverRelation, space: .last, padding: .left(12))

// Reusable position for the remaining two album labels. iPhones in portrait will take the rest of the screen,
// on bigger devices or in landscape mode these labels finish two columns from the end of the grid view (.reversed(2)). 
let subtitlesLast: Position = .custom { traitCollection in
    return self.gridView.bounds.size.width <= 414 ? .last : .reversed(2)
}

// Place artist label below the album title with margin of 2px, match the left position of the album title label
// and the previously calculated `subtitlesLast` for end position
gridView.add(subview: artistLabel, .below(albumTitleLabel, margin: 2), from: .match(artistLabel), space: subtitlesLast, padding: .left(12))

// Place year released label under the artist name label, rest is same as above
gridView.add(subview: yearLabel, .below(artistLabel, margin: 2), from: .match(artistLabel), space: subtitlesLast, padding: .left(12))

// Place a purchase button next to the artist and year label on bigger screens and under on smaller ones (iPhone in portrait etc)
// For the start position you either start 12px from the album on smaller screens or second column from the right on bigger ones
// (note you can also use `UITraitCollection` in both cases if needed)
gridView.add(subview: purchaseButton, .custom({ traitCollection in
    if self.gridView.bounds.size.width <= 414 {
        return .below(self.yearLabel, margin: 3)
    } else {
        return .match(self.artistLabel)
    }
}), from: .custom({ _ in
    if self.gridView.bounds.size.width <= 414 {
        return .relation(self.albumCover, margin: 12)
    } else {
        return .relation(self.artistLabel, margin: 6)
    }
}), space: .last) { make in
    make.height.equalTo(28)
}

// Place the star rating label above the separator. The initial position is not set and will be dynamic, the whole thing will stretch to the end
gridView.add(subview: ratingLabel, .above(separator, margin: 12), from: .dynamic, space: .last) { make in
    make.height.equalTo(28)
}

// Add a 1px separator below any of the components that could reach it and space it 12px from the lowest one
gridView.add(subview: separator, .below([albumCover, yearLabel, purchaseButton], margin: 12)) { make in
    make.height.equalTo(1)
}

// Add the long description copy which takes the full width and is placed below the separator
gridView.add(subview: aboutLabel, .below(separator, margin: 12))
```

## Customisation

There is a number of ways to customise your grid views:

### Number of columns

Each grid view can have any number of columns, it is completely up to the developer to decide how many they want to use on which view. The default value is 12.

```swift
// Set number of columns
gridView.config.numberOfColumns = 24
```

### Grid view outer padding

You can set `top`, `left` or `right` padding for the entire grid view like this:

```swift
gridView.config.padding = .full(top: 6, left: 12, right: 12)
```

Available paddings are:
```swift
/// Element padding
public enum Padding {
    
    /// None
    case none
    
    /// Top
    case top(CGFloat)
    
    /// Left
    case left(CGFloat)
    
    /// Right
    case right(CGFloat)
    
    /// Sides (left, right)
    case horizontal(left: CGFloat, right: CGFloat)
    
    /// Full (top, left, right, bottom)
    case full(top: CGFloat, left: CGFloat, right: CGFloat)
    
}

```

## View controller

A `GridViewController` is available for subclassing and your convenience with `gridView` property replacing the standard `view`.

```swift
class MyViewController: GridViewController { }
```

## Debugging

To enable a background grid do the following:

```swift
// Display grid
gridView.config.displayGrid = true
```

## Boost - an OpenSource Enterprise AppStore

Core package for <b>[Boost](http://www.boostappstore.com)</b>, a completely open source enterprise AppStore written in Swift!
- Website: http://www.boostappstore.com
- Github: https://github.com/LiveUI/Boost

## Code contributions

We love PR’s, we can’t get enough of them ... so if you have an interesting improvement, bug-fix or a new feature please don’t hesitate to get in touch. If you are not sure about something before you start the development you can always contact our dev and product team through our Slack.

## Credits

#### Author
Ondrej Rafaj (@rafiki270 on [Github](https://github.com/rafiki270), [Twitter](https://twitter.com/rafiki270), [LiveUI Slack](http://bit.ly/2B0dEyt) and [Vapor Slack](https://vapor.team/))

#### Thanks
To the SnapKit team for such an amazing tool!

## License

MIT license; See the LICENSE file for more info.
