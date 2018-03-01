pod "CTAPI_AMap"

![高德地图开放平台](./pics/logo.png)

[https://lbs.amap.com/](https://lbs.amap.com/)

[API Docs](https://lbs.amap.com/api/webservice/guide/api/georegeo/)

How To Use It
=============

- apply key from AMap:[https://lbs.amap.com/](https://lbs.amap.com/)
- add `pod "CTAPI_AMap"` in your Podfile
- create an Object named `Target_CTAMapKey` in your own project

```objective-c
@implementation Target_CTAMapKey

- (NSString *)Action_key:(NSDictionary *)params
{
    return @"your AMap key";
}

@end
```

- create an Object named `CTAppContext` in your own project (for [CTNetworking](https://github.com/casatwy/CTNetworking))

```objective-c
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
```

- haa! you can use AMap API now! read [demos](https://github.com/CTAPIs/CTAPI_AMap/tree/master/CTAPI_AMap/Demo/APIControllers) for how to use the APIManagers

