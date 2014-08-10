//
//  CustomView.m
//  nestedXibLoad
//
//  Created by taowang on 8/10/14.
//  Copyright (c) 2014 Meilishuo. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/* solution 2.1 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        UIView *containerView = [[[UINib nibWithNibName:@"CustomView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"awakFromNib");
}

/* solution 2.2 */
//- (id) awakeAfterUsingCoder:(NSCoder*)aDecoder {
//    BOOL isJustAPlaceholder = ([[self subviews] count] == 0);
//    if (isJustAPlaceholder) {
//        CustomView* theRealThing = [[self class] getClassObjectFromNib];
//        
//        theRealThing.frame = self.frame;    // ... (pass through selected properties)
//        
//        // Update 2013-07-23: make compatible with Auto Layout
//        self.translatesAutoresizingMaskIntoConstraints = NO;
//        theRealThing.translatesAutoresizingMaskIntoConstraints = NO;
//        
//        // convince ARC that we're legit -- Update 2013-03-10: unnecessary since at least Xcode 4.5
//        CFRelease((__bridge const void*)self);
//        CFRetain((__bridge const void*)theRealThing);
//        
//        return theRealThing;
//    }
//    return self;
//}
//
//+ (id)getClassObjectFromNib
//{
//    NSString *nibName = NSStringFromClass([self class]);
//    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
//    for (id anObject in topLevelObjects) {
//        if ([anObject isKindOfClass:self.class]) {
//            return anObject;
//        }
//    }
//    
//    return nil;
//}

@end
