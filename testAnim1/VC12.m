//
//  VC12.m
//  testAnim1
//
//  Created by yht on 4/20/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC12.h"

@interface VC12 ()
@property (weak, nonatomic) IBOutlet UIImageView *ballImageView;
@property (nonatomic,strong) UIDynamicAnimator* animator;
@property (nonatomic,strong) UIGravityBehavior* gravity;
@property (nonatomic,strong) UICollisionBehavior* collision;
@end

@implementation VC12

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
    self.title = @"碰撞行为";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //重力行为
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[_ballImageView]];
    
    //设置重力的方向
    CGVector gravityDirection = {0.0, 0.1};  // {x,y} 这里的单位g g=9.8m/s2 (像素/s2)
    [_gravity setGravityDirection:gravityDirection];
    [_animator addBehavior:_gravity];
    
    //碰撞行为
    _collision = [[UICollisionBehavior alloc]
                  initWithItems:@[_ballImageView]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
