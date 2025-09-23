#import "OHLcommonlibPlugin.h"
#import <MOBFoundation/MOBFoundation.h>

static NSString * const CHANNEL_METHOD = @"com.ohaola.sdk.ohlcommonlib";

@implementation OHLcommonlibPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    NSObject<FlutterBinaryMessenger> *messager = [registrar messenger];
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:CHANNEL_METHOD binaryMessenger:messager];
    
    OHLcommonlibPlugin *plugin = [[OHLcommonlibPlugin alloc] init];
    [registrar addMethodCallDelegate:plugin channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([MOBFDevice systemVersion]);
    } else if ([@"submitPolicyGrantResult" isEqualToString:call.method]) {
        NSDictionary *arguments = (NSDictionary *)call.arguments;
        NSInteger status = [arguments[@"granted"] integerValue];
        [MobSDK agreePrivacy:status onResult:^(BOOL success) {
            result(@{
                @"ret": @(success),
                @"err": @""
            });
        }];
    } else if ([@"registerApp" isEqualToString:call.method]) {
        NSDictionary *arguments = (NSDictionary *)call.arguments;
        NSString *appKey = arguments[@"appKey"];
        NSString *appSecret = arguments[@"appSecret"];
        if (appKey && appSecret) {
            [MobSDK registerAppKey:appKey appSecret:appSecret privacyLevel:2];
        }
    }
}

@end
