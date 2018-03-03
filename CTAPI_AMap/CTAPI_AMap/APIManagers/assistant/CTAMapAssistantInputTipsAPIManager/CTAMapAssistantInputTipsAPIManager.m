//
//  CTAMapAssistantInputTipsAPIManager.m
//  APIManagers
//
//  Created by casa's script.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "CTAMapAssistantInputTipsAPIManager.h"
#import "CTAMapService.h"

NSString * const kCTAMapAssistantInputTipsAPIManagerRequiredParamKeyKeywords = @"keywords";
NSString * const kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation = @"location";
NSString * const kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyCityCode = @"city";
NSString * const kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyIsLimitToCity = @"citylimit";

@interface CTAMapAssistantInputTipsAPIManager () <CTAPIManagerValidator>

@property (nonatomic, strong, readwrite) NSString *errorMessage;

@end

@implementation CTAMapAssistantInputTipsAPIManager

@synthesize errorMessage = _errorMessage;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.validator = self;
        self.cachePolicy = CTAPIManagerCachePolicyNoCache;
    }
    return self;
}

#pragma mark - CTAPIManager
- (NSString *)methodName
{
    return @"assistant/inputtips";
}

- (NSString *)serviceIdentifier
{
    return CTServiceIdentifierAMap;
}

- (CTAPIManagerRequestType)requestType
{
    return CTAPIManagerRequestTypeGet;
}

- (NSDictionary *)reformParams:(NSDictionary *)params
{
    NSMutableDictionary *reformedParams = [params mutableCopy];
    if ([reformedParams[kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation] isKindOfClass:[NSDictionary class]]) {
        reformedParams[kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation] = [NSString stringWithFormat:@"%@,%@", params[kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation][@"lng"], params[kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation][@"lat"]];
    } else {
        if (reformedParams[kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation] != nil) {
            NSLog(@"location should be a dictionary and have key [lat] and [lng] \n you send location as %@ \n now the request will be send without location param.", reformedParams[kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation]);
            [reformedParams removeObjectForKey:kCTAMapAssistantInputTipsAPIManagerOptionalParamKeyNearLocation];
        }
    }
    reformedParams[@"datatype"] = @"all";
    return reformedParams;
}

#pragma mark - CTAPIManagerValidator
- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    if ([data[kCTAMapAssistantInputTipsAPIManagerRequiredParamKeyKeywords] length] == 0) {
        self.errorMessage = @"You should send keywords to search";
        return CTAPIManagerErrorTypeParamsError;
    }
    return CTAPIManagerErrorTypeNoError;
}

- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    if ([data[@"tips"] isKindOfClass:[NSArray class]] == NO || [data[@"tips"] count] == 0) {
        return CTAPIManagerErrorTypeNoContent;
    }
    return CTAPIManagerErrorTypeNoError;
}

#pragma mark - interceptors
- (BOOL)beforePerformFailWithResponse:(CTURLResponse *)response
{
    [super beforePerformFailWithResponse:response];
    self.errorMessage = response.content[@"info"];
    return YES;
}

@end
