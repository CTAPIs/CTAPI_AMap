//
//  AssistantViewController.m
//  CTAPI_AMap
//
//  Created by casa on 2018/3/2.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "AssistantViewController.h"
#import "AssistantViewController+Assistant.h"

@interface AssistantViewController () <CTAPIManagerParamSource>

@end

@implementation AssistantViewController

#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    if ([manager isKindOfClass:[CTAMapAssistantInputTipsAPIManager class]]) {
        return [self paramsForAssistantInput];
    }
    return nil;
}

#pragma mark - getters and setters
- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[
                        @{
                            kBaseAPIViewControllerDataSourceTitle:@"搜索提示",
                            kBaseAPIViewControllerDataSourceClass:[CTAMapAssistantInputTipsAPIManager class]
                            }
                        ];
    }
    return _dataSource;
}

@end
