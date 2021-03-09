//
//  ViewController.m
//  View Test Target
//
//  Created by Zain Mecklai on 3/8/21.
//

#import "ViewController.h"

@interface ViewController () {
    UIView *yellow;
    NSLayoutConstraint *width;
    NSLayoutConstraint *height;
    NSLayoutConstraint *xConstraint;
    NSLayoutConstraint *yConstraint;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    yellow =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [yellow setBackgroundColor:[UIColor yellowColor]];
        [self.view addSubview:yellow];
    yellow.translatesAutoresizingMaskIntoConstraints = NO;
    
    width = [NSLayoutConstraint constraintWithItem:yellow
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:414];
    
    height = [NSLayoutConstraint constraintWithItem:yellow
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:736];

    xConstraint = [NSLayoutConstraint
                                                 constraintWithItem:yellow attribute:NSLayoutAttributeLeft
                                                 relatedBy:NSLayoutRelationEqual toItem:self.view attribute:
                                                 NSLayoutAttributeLeft multiplier:1.0 constant:0];

    yConstraint = [NSLayoutConstraint
                                                 constraintWithItem:yellow attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual toItem:self.view attribute:
                                                 NSLayoutAttributeTop multiplier:1.0f constant:20];
    
    [self.view addConstraints:@[xConstraint, yConstraint, width, height]];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    button.titleLabel.text = @"Push Me";
    [button setTitle:@"title" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    [yellow addSubview:button];
    button.translatesAutoresizingMaskIntoConstraints = YES;
    [button setBackgroundColor:UIColor.blackColor];
    
    [self layoutTopRightButton:yellow];
    [self layoutBottomRightButton:yellow];
    [self layoutBottomLeftButton:yellow];

}

-(void) viewDidAppear:(BOOL)animated {
    width.constant = self.view.safeAreaLayoutGuide.layoutFrame.size.width;
    height.constant = self.view.safeAreaLayoutGuide.layoutFrame.size.height;
    xConstraint.constant = self.view.safeAreaLayoutGuide.layoutFrame.origin.x;
    yConstraint.constant = self.view.safeAreaLayoutGuide.layoutFrame.origin.y;
}

- (void)myAction:(UIButton *)sender {
    NSLog(@" - button clicked %@", yellow);
    NSLog(@" - button clicked %@", sender);
    NSLog(@" safeAreaLayoutGuide %@", self.view.safeAreaLayoutGuide);
    NSLog(@" safeAreaInsets b:%f l:%f r:%f t:%f", self.view.safeAreaInsets.bottom,
          self.view.safeAreaInsets.left,self.view.safeAreaInsets.right,
          self.view.safeAreaInsets.top);
    
}
- (IBAction)testButtonTap:(UIButton *)sender {
    NSLog(@" - %@", yellow);
}

- (void) layoutTopRightButton:(UIView *) parent {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    
    [button setTitle:@"T R" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    [yellow addSubview:button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setBackgroundColor:UIColor.blackColor];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:30];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:30];

    NSLayoutConstraint *trailing = [NSLayoutConstraint
                                    constraintWithItem:button attribute:NSLayoutAttributeTrailing
                                    relatedBy:NSLayoutRelationEqual toItem:parent attribute:
                                    NSLayoutAttributeTrailing multiplier:1.0 constant:0];

    
    NSLayoutConstraint *top = [NSLayoutConstraint
                                                 constraintWithItem:button attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual toItem:parent attribute:
                                                 NSLayoutAttributeTop multiplier:1.0f constant:0];
    

    [self.view addConstraints:@[widthConstraint, heightConstraint, top, trailing]];

}

- (void) layoutBottomRightButton:(UIView *) parent {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    
    [button setTitle:@"B R" forState:UIControlStateNormal];
    [button setAccessibilityLabel:@"BottomRight"];
    [button addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    [yellow addSubview:button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setBackgroundColor:UIColor.blackColor];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:30];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:30];

    NSLayoutConstraint *trailing = [NSLayoutConstraint
                                                 constraintWithItem:button attribute:NSLayoutAttributeTrailing
                                                 relatedBy:NSLayoutRelationEqual toItem:parent attribute:
                                            NSLayoutAttributeTrailing multiplier:1.0 constant:0];

    
    NSLayoutConstraint *bottom = [NSLayoutConstraint
                                  constraintWithItem:button attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual toItem:parent attribute:
                                  NSLayoutAttributeBottom multiplier:1.0f constant:0];
    

    [self.view addConstraints:@[widthConstraint, heightConstraint, bottom, trailing]];

}

- (void) layoutBottomLeftButton:(UIView *) parent {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    
    [button setTitle:@"B L" forState:UIControlStateNormal];
    [button setAccessibilityLabel:@"BottomLeft"];
    
    [button addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    [yellow addSubview:button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setBackgroundColor:UIColor.blackColor];
    [button setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [button setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:30];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:30];

    NSLayoutConstraint *trailing = [NSLayoutConstraint
                                    constraintWithItem:button attribute:NSLayoutAttributeLeading
                                    relatedBy:NSLayoutRelationEqual toItem:parent attribute:
                                    NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint
                                  constraintWithItem:button attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual toItem:parent attribute:
                                  NSLayoutAttributeBottom multiplier:1.0f constant:0];

    [self.view addConstraints:@[widthConstraint, heightConstraint, bottom, trailing]];
}

- (void) traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    NSLog(@" - traitCollectionDid Change %d %d ",
          (int)self.view.safeAreaLayoutGuide.layoutFrame.size.width,
          (int)self.view.safeAreaLayoutGuide.layoutFrame.size.height);
    width.constant = self.view.safeAreaLayoutGuide.layoutFrame.size.width;
    height.constant = self.view.safeAreaLayoutGuide.layoutFrame.size.height;
    xConstraint.constant = self.view.safeAreaLayoutGuide.layoutFrame.origin.x;
    yConstraint.constant = self.view.safeAreaLayoutGuide.layoutFrame.origin.y;
}

- (void) willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@" - willTransitionToTraitCollection Change ");
}

@end
