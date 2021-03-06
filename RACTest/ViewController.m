//
//  ViewController.m
//  RACTest
//
//  Created by mac03 on 15/12/21.
//  Copyright © 2015年 ap03. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()
@property(strong , nonatomic) UITextField * usernameTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.usernameTextField = [UITextField new];
    self.usernameTextField.frame = CGRectMake(30, 100, 200, 40);
    self.usernameTextField.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.usernameTextField];
    

    UILabel * lbl = [[UILabel alloc] init];
    lbl.frame = CGRectMake(30, 150, 200, 200);
    [self.view addSubview:lbl];lbl.numberOfLines = 0;
    
    RAC(lbl,text) = self.usernameTextField.rac_textSignal;
    RAC(lbl,font) = [self.usernameTextField.rac_textSignal map:^id(NSString *text) {
        return [UIFont systemFontOfSize:text.length];
    }];
    RAC(lbl,backgroundColor) = [self.usernameTextField.rac_textSignal map:^id(NSString *text) {
        return [UIColor colorWithRed:text.length*20/255.0 green:text.length*20/255.0 blue:text.length*20/255.0 alpha:1];
    }];
    
    
    UILabel * lbl1 = [[UILabel alloc] init];
    lbl1.frame = CGRectMake(30, 350, 200, 200);
     RAC(lbl1,text) = self.usernameTextField.rac_textSignal;
    [self.view addSubview:lbl1];lbl1.numberOfLines = 0;
    
//    [self.usernameTextField.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
    
//    [[self.usernameTextField.rac_textSignal filter:^BOOL(id value) {
//        NSString *text = value;
//        return text.length > 3;
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
    
//    [[[self.usernameTextField.rac_textSignal map:^id(NSString *text) {
//        return @(text.length);
//    }]
//      filter:^BOOL(NSNumber *length) {
//          return [length intValue] > 3;
//      }]
//     subscribeNext:^(id x) {
//         NSLog(@"%@", x);
//     }];
    
    
    
//    RACSignal *validUsernameSignal = [self.usernameTextField.rac_textSignal map:^id(NSString *text) {
//        return @([self isValidUsername:text]);
//    }];
    
 
//    [[validUsernameSignal map:^id(NSNumber *passwordValid) {
//        return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
//    }] subscribeNext:^(UIColor *color) {
//        self.usernameTextField.backgroundColor = color;
//    }];
    
//    RAC(self.usernameTextField, backgroundColor) = [validUsernameSignal map:^id(NSNumber *passwordValid) {
//        return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
//    }];


}
- (BOOL)isValidUsername:(NSString *)text
{
    return text.length;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
