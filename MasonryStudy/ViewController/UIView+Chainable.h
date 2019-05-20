//
//  UIView+Chainable.h
//  MasonryStudy
//
//  Created by nchkdxlq on 2019/5/20.
//  Copyright © 2019 luoquan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Chainable)

- (UIView * (^)(CGFloat))c_width;
- (UIView * (^)(CGFloat))c_height;
- (UIView * (^)(CGPoint))c_center;
- (UIView * (^)(CGSize))c_size;


@end

NS_ASSUME_NONNULL_END
