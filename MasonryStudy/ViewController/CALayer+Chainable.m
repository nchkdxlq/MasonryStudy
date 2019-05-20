//
//  CALayer+Chainable.m
//  MasonryStudy
//
//  Created by nchkdxlq on 2019/5/20.
//  Copyright © 2019 luoquan. All rights reserved.
//

#import "CALayer+Chainable.h"

@implementation CALayer (Chainable)


- (CALayer * (^)(CGFloat))c_cornerRadius {
    return ^(CGFloat cornerRadius) {
        self.cornerRadius = cornerRadius;
        return self;
    };
}

- (CALayer * (^)(BOOL))c_masksToBounds {
    return ^(BOOL masksToBounds) {
        self.masksToBounds = masksToBounds;
        return self;
    };
}


- (CALayer * (^)(CGFloat))c_borderWidth {
    return ^(CGFloat borderWidth) {
        self.borderWidth = borderWidth;
        return self;
    };
}

- (CALayer * (^)(CGColorRef))c_borderColor {
    return ^(CGColorRef borderColor) {
        self.borderColor = borderColor;
        return self;
    };
}


@end
