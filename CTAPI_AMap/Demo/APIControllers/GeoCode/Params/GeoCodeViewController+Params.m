//
//  GeoCodeViewController+Params.m
//  CTAPI_AMap
//
//  Created by casa on 2018/3/1.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "GeoCodeViewController+Params.h"

@implementation GeoCodeViewController (Params)

- (NSDictionary *)geoParams
{
    return @{
             kCTAMapGEOAPIManagerRequiredParamKeyAddressList:@[@"人民广场", @"虹口足球场",@"鲁迅公园"],
             kCTAMapGEOAPIManagerRequiredParamKeyCityName:@""
             };
}

- (NSDictionary *)regeoParams
{
    return @{
             kCTAMapRegeoAPIManagerRequiredParamKeyLat:@"31.23",
             kCTAMapRegeoAPIManagerRequiredParamKeyLng:@(121.48)
             };
}

@end
