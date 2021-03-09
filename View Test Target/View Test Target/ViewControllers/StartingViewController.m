//
//  StartingViewController.m
//  View Test Target
//
//  Created by Zain Mecklai on 3/9/21.
//

#import "StartingViewController.h"

@interface StartingViewController ()

@end

@implementation StartingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLayoutConstraint *xConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.buttonGoToNextView attribute:NSLayoutAttributeLeft
                                                 relatedBy:NSLayoutRelationEqual toItem:self.view attribute:
                                                 NSLayoutAttributeLeft multiplier:1.0 constant:0];

    NSLayoutConstraint *yConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.buttonGoToNextView attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual toItem:self.view attribute:
                                                 NSLayoutAttributeTop multiplier:1.0f constant:20];
    
    [self.view addConstraints:@[xConstraint, yConstraint]];

}

- (void) viewDidAppear:(BOOL)animated {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
