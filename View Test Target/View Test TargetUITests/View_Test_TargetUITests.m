//
//  View_Test_TargetUITests.m
//  View Test TargetUITests
//
//  Created by Zain Mecklai on 3/8/21.
//

#import <XCTest/XCTest.h>

@interface View_Test_TargetUITests : XCTestCase

@end

@implementation View_Test_TargetUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    CGRect screenNativeRect = [UIScreen mainScreen].nativeBounds;
    CGRect screenRect = [UIScreen mainScreen].bounds;
    NSLog(@" - screenRect [%f %f] - nativeRect [%f %f]", screenRect.size.width, screenRect.size.height, screenNativeRect.size.width, screenNativeRect.size.height);
    // UI tests must launch the application that they test.
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationLandscapeLeft;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    NSLog(@" - app launch");

    screenNativeRect = [UIScreen mainScreen].nativeBounds;
    screenRect = [UIScreen mainScreen].bounds;
    NSLog(@" - screenRect [%f %f] - nativeRect [%f %f]", screenRect.size.width, screenRect.size.height, screenNativeRect.size.width, screenNativeRect.size.height);
    
    XCUIElementQuery *buttons = app.buttons;
    NSArray<XCUIElement *> *elems = buttons.allElementsBoundByIndex;
    
    for (int i = 0; i < elems.count; i++) {
        NSLog(@" - label:%@ accessibilityLabel:%@", elems[i].label, elems[i].accessibilityLabel);
        if ([elems[i].label isEqualToString:@"Next Screen"])
        {
            [elems[i] tap];
        }
    }
    
    int orients[2];
    orients[0] = UIDeviceOrientationLandscapeLeft;
    orients[1] = UIDeviceOrientationPortrait;
    
    for (int index = 0; index < 2; index++) {
        int currentOrientation = orients[index];
        NSLog(@" - currentOrientation is %d", currentOrientation);
        [XCUIDevice sharedDevice].orientation = currentOrientation;
        
        NSLog(@" - Creating expectation ");
        XCTestExpectation *expectation = [self expectationWithDescription:@"test"];
        dispatch_queue_t queue = dispatch_get_main_queue();
        dispatch_async(queue, ^{
            for (int iteration = 0; iteration < 10; iteration ++) {
            NSLog(@" - I am here at iteration %d", iteration);
            CGRect screenNativeRect = [UIScreen mainScreen].nativeBounds;
            CGRect screenRect = [UIScreen mainScreen].bounds;
            CGSize appSize = app.frame.size;
            if (screenRect.size.width > screenRect.size.height) {
                NSLog(@" - screenRect success");
                [expectation fulfill];
                return;
            }
            if (appSize.width > appSize.height) {
                NSLog(@" - app success");
                [expectation fulfill];
                return;
            }
            if (screenNativeRect.size.width > screenNativeRect.size.height) {
                NSLog(@" - screenNativeRect success");
                [expectation fulfill];
                return;
            }
            }
        });
        __block BOOL success = true;
        [self waitForExpectationsWithTimeout:30 handler:^(NSError * _Nullable error) {
            if (error) {
                success = false;
            }
        }];
        
    
        XCUIElementQuery *buttons = app.buttons;
        NSArray<XCUIElement *> *elems = buttons.allElementsBoundByIndex;
        
        for (int i = 0; i < elems.count; i++) {
            NSLog(@" - label:%@ accessibilityLabel:%@", elems[i].label, elems[i].accessibilityLabel);
            if ([elems[i].label isEqualToString:@"Next Screen"])
            {
                continue;
            }
        
        XCTAssertTrue(elems[i].isHittable, @"is the button hittable %@", elems[i].label);
        /*
        XCTAssertTrue(CGRectContainsRect(screenRect, elems[i].frame), @"[%f %f %f %f] vs. [%f %f %f %f]",
                      screenRect.origin.x,
                      screenRect.origin.y,
                      screenRect.size.width,
                      screenRect.size.height,
                      elems[i].frame.origin.x,
                      elems[i].frame.origin.y,
                      elems[i].frame.size.width,
                      elems[i].frame.size.height
                      );
         */
            screenRect = [UIScreen mainScreen].nativeBounds;
        XCTAssertTrue(CGRectContainsRect(screenRect, elems[i].frame), @"[%f %f %f %f], [%f %f %f %f]",
                      elems[i].frame.origin.x,
                      elems[i].frame.origin.y,
                      elems[i].frame.size.width,
                      elems[i].frame.size.height,
                      app.frame.origin.x,
                      app.frame.origin.y,
                      app.frame.size.width,
                      app.frame.size.height);
    }
    }
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
