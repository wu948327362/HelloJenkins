//
//  WWTBaiduConfig.m
//  WWTBaiduConfig
//
//  Created by wuwentao03 on 2021/1/22.
//

#import "WWTBaiduConfig.h"

@implementation WWTBaiduConfig
- (NSString *)addStrTailString:(NSString *)originString{
    if (originString && [originString isKindOfClass:[NSString class]]) {
        NSMutableString *tem = [NSMutableString stringWithString:originString];
        [tem appendString:@"tailhhhhhhhh"];
        return [tem copy];
    }
    return  @"tailhhhhhhhh";
}
@end
