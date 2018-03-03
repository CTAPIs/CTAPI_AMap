//
//  CTAPIAMapRegeoAPIManager.m
//  APIManagers
//
//  Created by casa's script.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "CTAMapRegeoAPIManager.h"
#import "CTAMapService.h"

NSString * const kCTAMapRegeoAPIManagerRequiredParamKeyLat = @"kCTAMapRegeoAPIManagerRequiredParamKeyLat";
NSString * const kCTAMapRegeoAPIManagerRequiredParamKeyLng = @"kCTAMapRegeoAPIManagerRequiredParamKeyLng";

@interface CTAMapRegeoAPIManager () <CTAPIManagerValidator>

@property (nonatomic, strong, readwrite) NSString *errorMessage;

@end

@implementation CTAMapRegeoAPIManager

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
    return @"geocode/regeo";
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
    reformedParams[@"location"] = [NSString stringWithFormat:@"%@,%@", params[kCTAMapRegeoAPIManagerRequiredParamKeyLng], params[kCTAMapRegeoAPIManagerRequiredParamKeyLat]];
    [reformedParams removeObjectForKey:kCTAMapRegeoAPIManagerRequiredParamKeyLng];
    [reformedParams removeObjectForKey:kCTAMapRegeoAPIManagerRequiredParamKeyLat];
    return reformedParams;
}

#pragma mark - CTAPIManagerValidator
- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    if ([data[@"location"] length] == 0) {
        self.errorMessage = @"you should send location";
        return CTAPIManagerErrorTypeParamsError;
    }
    return CTAPIManagerErrorTypeNoError;
}

- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
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
