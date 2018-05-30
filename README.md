# TheGrid

Brings grid layout to the Apple platforms

## Usage

```swift
let albumCover = UIImageView()

let albumTitleLabel = UILabel()
let artistLabel = UILabel()
let yearLabel = UILabel()

// Add image view onto the grid, starting from column 0, with length of 5 column and make some additional SnapKit "fine-tuning"
gridView.add(subview: albumCover, from: 0, space: 5) { make in
    make.height.equalTo(self.albumCover.snp.width)
}

// Add album title on the grid view, starting from column 5 stretching to the last column with 12px padding from the image view
gridView.add(subview: albumTitleLabel, from: 5, space: Position.last, padding: .left(12))

// Add artist name 2px below the album name, stretch to the end
gridView.add(subview: artistLabel, .below(albumTitleLabel, offset: 2), from: 5, space: Position.last, padding: .left(12))

// Add year of release 2px below the artist name, stretch to the end
gridView.add(subview: yearLabel, .below(artistLabel, offset: 2), from: 5, space: Position.last, padding: .left(12))
```

## Customisation

There is a number of ways to customize your grid views:

### Number of columns

Each grid view can have any number of columns, it is completely up to the developer to decide how many they want to use on which view. The default value is 12.

```swift
// Set number of columns
gridView.config.numberOfColumns = 24
```

## View controller

A `GridViewController` is available for your convenience with `gridView` property replacing the standard `view`.

```swift

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
