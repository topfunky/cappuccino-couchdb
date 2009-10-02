@import <AppKit/CPView.j>
@import <AppKit/CPTextField.j>
@import <AppKit/CPImageView.j>
@import <AppKit/CPImage.j>

/*
  An item displayed by a collection view.
*/

// TODO: Implement setter methods like setTextLabelText and setImageViewImage.
//       They should create the field if necessary and make room for imageView if present.

TFCollectionViewCellMargin = 10.0;
TFCollectionViewCellInternalMargin = 5.0;

@implementation TFCollectionViewCellSubtitle : CPView
{
    CPTextField textLabel           @accessors;
    CPTextField detailTextLabel     @accessors;
    CPImageView imageView           @accessors;
}

- (void)setRepresentedObject:(id)theObject
{
    // TODO: Can this be done in initWithFrame ?
    [self setAutoresizingMask:CPViewWidthSizable];
    [self setSelected:NO];
}

- (void)setTextLabelText:(CPString)theText
{
    if (!textLabel)
    {
        // TODO: Last arg should be line height
        textLabel = [[CPTextField alloc] initWithFrame:CGRectMake(TFCollectionViewCellMargin, 5.0, 150.0, 43.0)];
        [textLabel setFont:[CPFont boldSystemFontOfSize:14.0]];
        [textLabel setLineBreakMode:CPLineBreakByTruncatingTail];
        [textLabel setAutoresizingMask:CPViewWidthSizable];
        [self addSubview:textLabel];
    }
    [textLabel setStringValue:theText];
}

- (void)layoutTextLabel
{
    var textLabelFrame = [textLabel frame];
    if (imageView)
    {
        var imageViewFrame = [imageView frame];
        textLabelFrame.origin.x = imageViewFrame.origin.x + imageViewFrame.size.width + TFCollectionViewCellInternalMargin;
    }
    [textLabel setFrame:textLabelFrame];
}

- (void)setDetailTextLabelText:(CPString)theText
{
    if (!detailTextLabel)
    {
        // TODO: Last arg should be line height
        detailTextLabel = [[CPTextField alloc] initWithFrame:CGRectMake(TFCollectionViewCellMargin, 21.0, 150.0, 43.0)];
        [detailTextLabel setFont:[CPFont systemFontOfSize:12.0]];
        [detailTextLabel setAutoresizingMask:CPViewWidthSizable];
        [self addSubview:detailTextLabel];
    }
    [detailTextLabel setStringValue:theText];
}

- (void)layoutDetailTextLabel
{
    var labelFrame = [detailTextLabel frame];
    if (imageView)
    {
        var imageViewFrame = [imageView frame];
        labelFrame.origin.x = imageViewFrame.origin.x + imageViewFrame.size.width + TFCollectionViewCellInternalMargin;
    }
    [detailTextLabel setFrame:labelFrame];
}

- (void)setImageViewImage:(CPImage)theImage
{
    if (!imageView)
    {
        imageView = [[CPImageView alloc] initWithFrame:CGRectMakeZero()];
        [self addSubview:imageView];
    }

    var imageSize = [theImage size];
    [imageView setImage:theImage];
    [imageView setFrame:CGRectMake(5.0, 10.0, imageSize.width, imageSize.height)];

    [self layoutTextLabel];
    [self layoutDetailTextLabel];
}

- (void)setSelected:(BOOL)isSelected
{
    // Set background color and text color for selected row
    [self setBackgroundColor:isSelected ? [CPColor colorWithHexString:"3d80df"] : [CPColor whiteColor]];
    [textLabel setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]];
    [detailTextLabel setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]];

    var shadowColor  = [CPColor whiteColor],
        shadowOffset = CGSizeMake(0.0, 0.0);
    if (isSelected)
    {
        shadowColor  = [CPColor colorWithHexString:"4565a4"];
        shadowOffset = CGSizeMake(0.0, -1.0);
    }

    // TODO: Use array of fields
    [textLabel setTextShadowColor:shadowColor];
    [textLabel setTextShadowOffset:shadowOffset];
    [detailTextLabel setTextShadowColor:shadowColor];
    [detailTextLabel setTextShadowOffset:shadowOffset];
}


@end

