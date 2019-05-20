//
//  ViewController.m
//  MasonryStudy
//
//  Created by nchkdxlq on 2019/5/18.
//  Copyright © 2019 luoquan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#import "ChainModeViewController.h"
#import "CALayer+Chainable.h"


@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Masonry";
    
    UIButton *chainButton = [self createButtonWithTitle:@"链式编程" selector:@selector(gotoChainMode:)];
    [self.view addSubview:chainButton];
    
    
    CGFloat top = 100;
    [chainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(top));
        make.centerX.equalTo(self.view);
    }];
    
    
    CALayer *layer = nil;
    layer.cornerRadius = 1;
    layer.masksToBounds = YES;
    layer.borderWidth = 2;
    layer.borderColor = [UIColor whiteColor].CGColor;
}


- (void)gotoChainMode:(UIButton *)button {
    ChainModeViewController *vc = [ChainModeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}




- (UIButton *)createButtonWithTitle:(NSString *)title selector:(SEL)selector {
    UIButton *button = [UIButton new];
    title = [NSString stringWithFormat:@"  %@  ", title];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    button.layer.cornerRadius = 4;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    button.layer.c_cornerRadius(4)
    .c_masksToBounds(YES)
    .c_borderWidth(1)
    .c_borderColor(UIColor.lightGrayColor.CGColor);
    
    
    return button;
}


@end
