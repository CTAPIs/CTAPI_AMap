//
//  CTAMapGEOAPIManager.m
//  APIManagers
//
//  Created by casa's script.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "CTAMapGEOAPIManager.h"
#import "CTAMapService.h"

NSString * const kCTAMapGEOAPIManagerRequiredParamKeyAddressList = @"address";
NSString * const kCTAMapGEOAPIManagerRequiredParamKeyCityName = @"city";

@interface CTAMapGEOAPIManager () <CTAPIManagerValidator>

@property (nonatomic, strong, readwrite) NSString *errorMessage;

@end

@implementation CTAMapGEOAPIManager

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
    return @"geocode/geo";
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
    NSMutableDictionary *resultParams = [params mutableCopy];
    resultParams[kCTAMapGEOAPIManagerRequiredParamKeyAddressList] = [params[kCTAMapGEOAPIManagerRequiredParamKeyAddressList] componentsJoinedByString:@"|"];
    return resultParams;
}

#pragma mark - CTAPIManagerValidator
- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
{
    if ([data[kCTAMapGEOAPIManagerRequiredParamKeyAddressList] length] == 0) {
        self.errorMessage = @"address is a required param";
        return CTAPIManagerErrorTypeParamsError;
    }
    return CTAPIManagerErrorTypeNoError;
}

- (CTAPIManagerErrorType)manager:(CTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
{
    if ([data[@"geocodes"] isKindOfClass:[NSArray class]] == NO || [data[@"geocodes"] count] == 0) {
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
