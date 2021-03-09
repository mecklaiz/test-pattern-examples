//
//  SecondPageViewController.m
//  View Test Target
//
//  Created by Zain Mecklai on 3/9/21.
//

#import "SecondPageViewController.h"

@interface SecondPageViewController () {
    UIView *yellow;
}
@end

@implementation SecondPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    yellow =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [yellow setBackgroundColor:[UIColor yellowColor]];
        [self.view addSubview:yellow];
    yellow.translatesAutoresizingMaskIntoConstraints = YES;

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
