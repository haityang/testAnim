//
//  VC101.m
//  testAnim1
//
//  Created by yht on 4/20/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC101.h"

@interface VC101 ()
- (IBAction)didFinish:(id)sender;

@end

@implementation VC101

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didFinish:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
