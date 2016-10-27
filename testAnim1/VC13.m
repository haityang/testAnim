//
//  VC13.m
//  testAnim1
//
//  Created by yht on 4/20/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC13.h"

@interface VC13 ()<UICollisionBehaviorDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *box;
@property (weak, nonatomic) IBOutlet UIImageView *attachmentPoint;
@property (weak, nonatomic) IBOutlet UIImageView *barrier;

@property (nonatomic,strong) UIDynamicAnimator* animator;
@property (nonatomic,strong) UIAttachmentBehavior* attach;
@property (nonatomic,strong) UIGravityBehavior* gravity;
@property (nonatomic,strong) UICollisionBehavior* collision;
@end

@implementation VC13

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"吸附行为";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //重力行为
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[_box]];
    [_animator addBehavior:_gravity];
    //碰撞行为
    _collision = [[UICollisionBehavior alloc]
                  initWithItems:@[_box]];
    
    [_collision addBoundaryWithIdentifier:@"barrier" fromPoint:_barrier.frame.origin toPoint:CGPointMake(_barrier.frame.origin.x + _barrier.frame.size.width, _barrier.frame.origin.y)];
    
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    _collision.collisionDelegate = self;
    
    [_animator addBehavior:_collision];
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[_box]];
    itemBehaviour.elasticity = 0.5;
    [_animator addBehavior:itemBehaviour];
    
}



- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    
    //设置吸附行为
    self.attach = [[UIAttachmentBehavior alloc] initWithItem:_attachmentPoint attachedToItem:_box];
    [self.animator addBehavior:self.attach];
    
    
}



@end
