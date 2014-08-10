//
//  ViewController.m
//  nestedXibLoad
//
//  Created by taowang on 8/10/14.
//  Copyright (c) 2014 Meilishuo. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@property (nonatomic, strong) CustomView *customView;
            
- (id)getClassObjectFromNib:(Class)class;

@end

@implementation ViewController

- (CustomView *)customView
{
    if (_customView == nil) {
        _customView = [self getClassObjectFromNib:[CustomView class]];
    }
    return _customView;
}
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.customView.center = self.view.center;
//    [self.view addSubview:self.customView];
}

- (id)getClassObjectFromNib:(Class)class
{
    NSString *nibName = NSStringFromClass(class);
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    for (id anObject in topLevelObjects) {
        if ([anObject isKindOfClass:class]) {
            return anObject;
        }
    }
    
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
