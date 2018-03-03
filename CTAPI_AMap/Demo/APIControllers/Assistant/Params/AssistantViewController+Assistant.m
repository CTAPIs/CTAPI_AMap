//
//  AssistantViewController+Assistant.m
//  CTAPI_AMap
//
//  Created by casa on 2018/3/2.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "AssistantViewController+Assistant.h"

@implementation AssistantViewController (Assistant)

- (NSDictionary *)paramsForAssistantInput
{
    return @{
             kCTAMapAssistantInputTipsAPIManagerRequiredParamKeyKeywords:@"屈臣氏",
             kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation:@{
                     @"lat":@(31.23),
                     @"lng":@(121.48)
                     },
             kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyCityCode:@"021",
             kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyIsLimitToCity:@(YES)
             };
}

@end
