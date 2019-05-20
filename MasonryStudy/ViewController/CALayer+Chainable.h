//
//  CALayer+Chainable.h
//  MasonryStudy
//
//  Created by nchkdxlq on 2019/5/20.
//  Copyright © 2019 luoquan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Chainable)

- (CALayer * (^)(CGFloat))c_cornerRadius;
- (CALayer * (^)(BOOL))c_masksToBounds;


- (CALayer * (^)(CGFloat))c_borderWidth;
- (CALayer * (^)(CGColorRef))c_borderColor;

@end

NS_ASSUME_NONNULL_END
