//
//  GeoCodeViewController.m
//  CTAPI_AMap
//
//  Created by casa on 2018/3/1.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "GeoCodeViewController.h"
#import <CTNetworking/CTNetworking.h>
#import "GeoCodeViewController+Params.h"

@interface GeoCodeViewController () <CTAPIManagerParamSource>

@end

@implementation GeoCodeViewController

- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    if ([manager isKindOfClass:[CTAMapGEOAPIManager class]]) {
        return [self geoParams];
    }
    if ([manager isKindOfClass:[CTAMapRegeoAPIManager class]]) {
        return [self regeoParams];
    }
    return nil;
}

- (NSArray *)dataSource
{
    return @[
             @{
                 kBaseAPIViewControllerDataSourceTitle:@"地点转坐标",
                 kBaseAPIViewControllerDataSourceClass:[CTAMapGEOAPIManager class]
                 },
             @{
                 kBaseAPIViewControllerDataSourceTitle:@"坐标转地点",
                 kBaseAPIViewControllerDataSourceClass:[CTAMapRegeoAPIManager class]
                 },
             ];
}

@end
