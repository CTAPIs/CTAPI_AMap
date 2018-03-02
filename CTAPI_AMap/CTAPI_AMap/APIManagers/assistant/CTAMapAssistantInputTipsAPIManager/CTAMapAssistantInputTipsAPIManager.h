//
//  CTAMapAssistantInputTipsAPIManager.h
//  APIManagers
//
//  Created by casa's script.
//  Copyright © 2018年 casa. All rights reserved.
//

#import <CTNetworking/CTNetworking.h>

extern NSString * const kCTAMapAssistantInputTipsAPIManagerRequiredParamKeyKeywords;
extern NSString * const kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation;
extern NSString * const kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyCityCode;
extern NSString * const kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyIsLimitToCity;

@interface CTAMapAssistantInputTipsAPIManager : CTAPIBaseManager <CTAPIManager>

@end
