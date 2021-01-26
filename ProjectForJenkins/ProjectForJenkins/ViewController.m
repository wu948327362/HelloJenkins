//
//  ViewController.m
//  ProjectForJenkins
//
//  Created by wuwentao03 on 2021/1/25.
//

#import "ViewController.h"
#import "WWTBaiduConfig.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self test];
}
- (void)test{
    WWTBaiduConfig *tem = [[WWTBaiduConfig alloc] init];
    NSString *str = [tem addStrTailString:@"hahahahahahaha"];
    NSLog(@"%@",str);
}
@end
