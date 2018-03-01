//
//  Target_CTAppContext.m
//  CTAPI_AMap
//
//  Created by casa on 2018/3/1.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "Target_CTAppContext.h"

@implementation Target_CTAppContext

- (BOOL)Action_isReachable:(NSDictionary *)params
{
    return YES;
}

- (NSInteger)Action_cacheResponseCountLimit:(NSDictionary *)params
{
    return 2;
}

- (BOOL)Action_shouldPrintNetworkingLog:(NSDictionary *)params
{
    return YES;
}

@end
