//
//  ViewController.m
//  PYHCodeTest
//
//  Created by reset on 2018/4/27.
//  Copyright © 2018年 HangzhouVongi. All rights reserved.
//

#import "ViewController.h"
#import "PYHModel.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *bt;
@end

@implementation ViewController

- (UIButton *)bt {
    if (!_bt) {
        _bt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _bt.backgroundColor = [UIColor orangeColor];
        [_bt addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bt;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bt];
    
    
}
- (void)click {
    PYHModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"model"]];
    NSLog(@"%@",model);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.view.backgroundColor = [UIColor redColor];
    PYHModel *model = [[PYHModel alloc]initWithDict:@{@"name":@"pyh",@"address":@"hangzhoubingjiang",@"age":@28,@"sex":@"1"}];
    BOOL result = [NSKeyedArchiver archiveRootObject:model toFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"model"]];
    NSLog(@"%@",result ? @"归档成功" : @"归档失败");
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
