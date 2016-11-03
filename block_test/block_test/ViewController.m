//
//  ViewController.m
//  block_test
//
//  Created by ddn on 16/8/15.
//  Copyright © 2016年 张永俊. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

int a = 1;
static void(^aaa)();

typedef void(^Callback)(int);

@interface ViewController ()
{
    TestView *_testView;
}
@property (nonatomic, strong) void(^abc)();

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    exampleA();
    [self heapBlock];
    
}

//http://blog.parse.com/learn/engineering/objective-c-blocks-quiz/
void exampleA() {
    char a = 'A';
    ^{
        printf("=======%cn", a);
    }();
}

- (void)heapBlock{
    
    __block int i = 1024;//此时在栈里面
    int j = 1;
    void (^blk)(void);
    void (^blkInHeap)(void);
    blk = ^{
//        printf("%d, %d\n", i, j);//如果block内部没有捕获外部变量，则block是全局block，并且blkInHeap也是全局block
    };//blk在栈里
    blk();
    blkInHeap = [blk copy];//blkInHeap在堆里
    
    blkInHeap();
    
}

@end




