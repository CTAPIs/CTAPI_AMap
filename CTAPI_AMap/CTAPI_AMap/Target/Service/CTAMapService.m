//
//  CTAMapService.m
//  CTAPI_AMap
//
//  Created by casa on 2018/3/1.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "CTAMapService.h"
#import <AFNetworking/AFNetworking.h>
#import <CTMediator/CTMediator.h>

NSString * const CTServiceIdentifierAMap = @"CTAMapService";

@interface CTAMapService ()

@property (nonatomic, strong) NSString *baseURL;
@property (nonatomic, strong) AFHTTPRequestSerializer *httpRequestSerializer;

@end

@implementation CTAMapService

- (NSURLRequest *)requestWithParams:(NSDictionary *)params methodName:(NSString *)methodName requestType:(CTAPIManagerRequestType)requestType
{
    if (requestType == CTAPIManagerRequestTypeGet) {

        NSMutableDictionary *finalParams = [params mutableCopy];
        finalParams[@"key"] =[[CTMediator sharedInstance] performTarget:@"CTAMapKey" action:@"key" params:nil shouldCacheTarget:YES];

        NSString *urlString = [NSString stringWithFormat:@"%@/%@", self.baseURL, methodName];
        NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"GET"
                                                                           URLString:urlString
                                                                          parameters:finalParams
                                                                               error:nil];
        return request;
    }
    
    return nil;
}

- (NSDictionary *)resultWithResponseData:(NSData *)responseData response:(NSURLResponse *)response request:(NSURLRequest *)request error:(NSError **)error
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    result[kCTApiProxyValidateResultKeyResponseData] = responseData;
    result[kCTApiProxyValidateResultKeyResponseJSONString] = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    result[kCTApiProxyValidateResultKeyResponseJSONObject] = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:NULL];
    return result;
}

#pragma mark - getters and setters
- (NSString *)baseURL
{
    return @"https://restapi.amap.com/v3";
}

- (AFHTTPRequestSerializer *)httpRequestSerializer
{
    if (_httpRequestSerializer == nil) {
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
    }
    return _httpRequestSerializer;
}

@end
