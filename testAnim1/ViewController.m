//
//  ViewController.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *items;
@property(strong,nonatomic)NSArray *sectionTitles;
@property(strong,nonatomic)NSArray *rowTitles;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"动画总结";
    self.sectionTitles = [NSArray arrayWithObjects:@"UIView上的动画", @"Layer上的动画", @"Controller切换时动画", @"力学和运动效果", nil];
    NSArray *array1 = [NSArray arrayWithObjects:@"显式提交方式", @"块方式", @"普通提交方式过渡动画", @"专门函数的过渡动画", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"显式Add方式", @"关键桢动画", @"path方式关键桢动画", @"动画组", @"渐变动画", nil];
    NSArray *array3 = [NSArray arrayWithObjects:@"普通切换", @"模态切换", nil];
    NSArray *array4 = [NSArray arrayWithObjects:@"重力行为", @"碰撞行为", @"吸附行为", @"推行为", @"甩行为", nil];
    self.rowTitles = [NSMutableArray arrayWithObjects:array1, array2, array3, array4, nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return self.sectionTitles.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.rowTitles[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[self.rowTitles objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0: //@"UIView上的动画",
        {
            switch (indexPath.row) {
                case 0:
                    [self performSegueWithIdentifier:@"VC1" sender:self];//@"显式Add方式",
                    break;
                case 1:
                    [self performSegueWithIdentifier:@"VC2" sender:self];//@"块方式",
                    break;
                case 2:
                    [self performSegueWithIdentifier:@"VC3" sender:self];//@"普通方式过渡动画",
                    break;
                case 3:
                    [self performSegueWithIdentifier:@"VC31" sender:self];//@"专门函数的过渡动画",
                default:
                    break;
            }
        }
            break;
        case 1: // @"Layer上的动画",
        {
            switch (indexPath.row) {
                case 0:
                    [self performSegueWithIdentifier:@"VC4" sender:self];//@"显式Add方式",
                    break;
                case 1:
                    [self performSegueWithIdentifier:@"VC5" sender:self];//@"关键桢动画",
                    break;
                case 2:
                    [self performSegueWithIdentifier:@"VC6" sender:self];//@"path方式关键桢动画",
                    break;
                case 3:
                    [self performSegueWithIdentifier:@"VC7" sender:self];//@"动画组",
                    break;
                case 4:
                    [self performSegueWithIdentifier:@"VC8" sender:self];//@"渐变动画"
                    break;
                default:
                    break;
            }
        }
            break;
        case 2: //@"Controller切换时动画",
        {
            switch (indexPath.row) {
                case 0:
                    [self performSegueWithIdentifier:@"VC91" sender:self];//@"普通切换",
                    break;
                case 1:
                    [self performSegueWithIdentifier:@"VC10" sender:self];// @"模态切换"
                    break;
                default:
                    break;
            }
        }
            break;
        case 3: //@"力学和运动效果",
        {
            switch (indexPath.row) {
                case 0:
                    [self performSegueWithIdentifier:@"VC11" sender:self];//@"重力行为",
                    break;
                case 1:
                    [self performSegueWithIdentifier:@"VC12" sender:self];//@"碰撞行为",
                    break;
                case 2:
                    [self performSegueWithIdentifier:@"VC13" sender:self];//@"吸附行为",
                    break;
                case 3:
                    [self performSegueWithIdentifier:@"VC14" sender:self];//@"推行为",
                    break;
                case 4:
                    [self performSegueWithIdentifier:@"VC15" sender:self];//@"甩行为",
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
}




@end
