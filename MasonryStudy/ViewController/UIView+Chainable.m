//
//  UIView+Chainable.m
//  MasonryStudy
//
//  Created by nchkdxlq on 2019/5/20.
//  Copyright © 2019 luoquan. All rights reserved.
//

#import "UIView+Chainable.h"

@implementation UIView (Chainable)

- (UIView * (^)(CGFloat))c_width {
    return ^(CGFloat width) {
        CGRect frame = self.frame;
        frame.size.width = width;
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(CGFloat))c_height {
    return ^(CGFloat height) {
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}



- (UIView * (^)(CGPoint))c_center {
    return ^(CGPoint center) {
        self.center = center;
        return self;
    };
}

- (UIView * (^)(CGSize))c_size {
    return ^(CGSize size) {
        CGRect frame = self.frame;
        frame.size = size;
        self.frame = frame;
        return self;
    };
}




@end
