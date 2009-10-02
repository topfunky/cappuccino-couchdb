@import "TFCollectionView/TFCollectionViewCellSubtitle.j"

@implementation TFCustomCell : TFCollectionViewCellSubtitle
{
}

- (void)setRepresentedObject:(id)theObject
{
    [self setTextLabelText:theObject.text];
    [self setDetailTextLabelText:theObject.detailText];
    var imageName = theObject.pass ? "pass.png" : "fail.png";
    [self setImageViewImage:[[CPImage alloc] initWithContentsOfFile:@"Resources/Images/" + imageName
                                                                size:CPSizeMake(24,24)]];

    [super setRepresentedObject:theObject];
}

@end

