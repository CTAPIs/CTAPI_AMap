//
//  CTAMapService.h
//  CTAPI_AMap
//
//  Created by casa on 2018/3/1.
//  Copyright © 2018年 casa. All rights reserved.
//

#import <CTNetworking/CTNetworking.h>

extern NSString * const CTServiceIdentifierAMap;

@interface CTAMapService : NSObject <CTServiceProtocol>

@property (nonatomic, assign)CTServiceAPIEnvironment apiEnvironment;
- (NSURLRequest *)requestWithParams:(NSDictionary *)params methodName:(NSString *)methodName requestType:(CTAPIManagerRequestType)requestType;
- (NSDictionary *)resultWithResponseData:(NSData *)responseData response:(NSURLResponse *)response request:(NSURLRequest *)request error:(NSError **)error;

@end
