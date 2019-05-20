//
//  ChainModeViewController.m
//  MasonryStudy
//
//  Created by nchkdxlq on 2019/5/18.
//  Copyright © 2019 luoquan. All rights reserved.
//

#import "ChainModeViewController.h"

@interface ChainModeViewController ()

@end

@implementation ChainModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"链式编程";
    
    
    self.func1();
    self.func2();
    
    self.func3(@"zhang san");
}

- (void(^)(void))func1 {
    // 定义一个block
    void(^block)(void) = ^{
        NSLog(@"on params no ret.");
    };
    // 返回
    return block;
}

- (void(^)(void))func2 {
    // 写得比fun1简单一点，效果完圈一样
    return ^{
        NSLog(@"on params no ret.");
    };
}


- (void(^)(NSString *))func3 {
    void(^block)(NSString *) = ^(NSString *name) {
        NSLog(@"my name is %@", name);
    };
    return block;
}


- (NSString *(^)(NSString *))func4 {
    NSString *(^block)(NSString *) = ^(NSString *str) {
        return [str uppercaseString];
    };
    return block;
}

- (NSString *(^)(NSString *))func5 {
    return ^NSString *(NSString *str) {
        return [str uppercaseString];
    };
}



/*
 
 在使用Masonry自动布局时可以使用链式编程的方式给控件添加约束，如下面的代码
 
 [button mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(@(top));
    make.centerX.equalTo(self.view);
 }];
 
 在OC中，使用点语法实际上是调用getter方法，而getter方法只能返回一个值，并不能传递参数。
 但在使用Masonry时，使用了点语法调用了getter方法，并且还能够传递参数，这与我们平常理解getter方法不一样，
 那Masonry到底是怎么实现的呢？
 
 ## block作为方法的返回值
 
 阅读源码看到这样的代码
 - (MASConstraint * (^)(id))equalTo {
    return ^id(id attribute) {
        return self.equalToWithRelation(attribute, NSLayoutRelationEqual);
    };
 }

 这个方法返回的是一个block，但看其实现还是有点蒙，不太好理解。在我们平时开发过程中，使用block作为
 方法的参数再正常不过了，但使用block作为方法的返回值还是比较少见。我们从简单的例子开始，
 一步一步来理解这个写法。
 
 ### 无参数无返回值的block
 
 定义一个无参数无返回值的block
 - (void(^)(void))func1 {
     void(^block)(void) = ^{
        NSLog(@"on params no ret.");
     };
     return block;
 }
 
 调用
 self.func1();
 就能打印出"on params no ret."
 
 
 ### 有一个参数无返回值的block

 实现一个有一个参数无返回值的block， 多个参数的类似。
 
 - (void(^)(NSString *))func3 {
     void(^block)(NSString *) = ^(NSString *name) {
        NSLog(@"my name is %@.", name);
     };
     return block;
 }
 
 调用
 self.func3(@"zhang san");
 就能打印出"my name is zhang san."

 
 ### 有一个参数并且有返回值的block
 
 - (NSString *(^)(NSString *))func4 {
     NSString *(^block)(NSString *) = ^(NSString *str) {
        return [str uppercaseString];
     };
     return block;
 }
 
 调用
 NSString *str = self.func4(@"abc");
 返回了大写的"ABC"
 
 还可以把上面的方法写得再简洁一点，不定义一个临时变量，直接返回。
 
 - (NSString *(^)(NSString *))func4 {
    return ^NSString *(NSString *str) {
        return [str uppercaseString];
    };
 }

 还可以再简洁一点
 - (NSString *(^)(NSString *))func4 {
     return ^(NSString *str) {
        return [str uppercaseString];
     };
 }
 
 
 OK,到目前为止，我们自己的定义的block已经和Masonry中的block在形式上已经非常类似了，
 相信你也已经理解了Masonry中方法返回block的写法了。
 
 
 ## 链式调用
 
 理解了block作为返回值，再理解链式调用就没什么困难了，下面还是做一个简单的解释。
 
 使用Masonry写布局代码时，一般会是下面的样子
 [button mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.equalTo(@(top));
     make.centerX.equalTo(self.view);
 }];
 
 对block中的代码进一步剖析，把`make.top.equalTo(@(top))`这样代码分开写看看会是怎样的
 
 1. 调用make的getter方法top, 返回MASConstraint对象constraint
 MASConstraint *constraint = make.top;
 
 2. 调用constraint的getter方法equalTo返回一个block
 MASConstraint * (^equal_block)(id) = constraint.equalTo;
 
 3. 执行上一步返回的block并传递参数, 这个block返回了MASConstraint对象
 MASConstraint *cs = equal_block(@(top));

 通过上面三步可以看出，每一步执行完后都返回了一个对象，就又可以调用返回对象的方法，就这样实现了链式调用。
 
 
 
 ## 总结
 
 上面我们分析了使用block作为方法的返回值实现链式调用，为后面分析Masonry源码打好基础。
 
 
 
 */


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
