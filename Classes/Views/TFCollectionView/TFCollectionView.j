@import <AppKit/CPCollectionView.j>

/**
   Full-featured collection view with pre-defined item prototype styles.

   See the Subtitle view in the same directory.
*/

@implementation TFCollectionView : CPCollectionView
{
}

- (id)initWithItemPrototypeClass:(id)theItemPrototypeClass
                      parentView:(CPView)theParentView
                        delegate:(id)theDelegate
{
    if (![super initWithFrame:[theParentView frame]])
        return nil;

    [self setDelegate:theDelegate];
    [self setBackgroundColor:[CPColor colorWithHexString:@"F2F2F2"]];
    [self setMinItemSize:CGSizeMake(0.0, 43.0)];
    [self setMaxItemSize:CGSizeMake(10000.0, 43.0)];
    [self setAllowsMultipleSelection:NO];
    [self setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
    [self setMaxNumberOfColumns:1];
    [self setVerticalMargin:1];

    var theItemPrototype = [[CPCollectionViewItem alloc] init];
    [theItemPrototype setView:[[theItemPrototypeClass alloc] initWithFrame:CGRectMakeZero()]];
    [self setItemPrototype:theItemPrototype];

    return self;
}

- (id)getCurrentObject
{
    return [[self content] objectAtIndex:[self getSelectedIndex]] ;
}

- (int)getSelectedIndex
{
    return [[self selectionIndexes] firstIndex];
}

@end

