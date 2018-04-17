//
//  YRCurrentLanguageTypeTool.m
//  benDiHua
//
//  Created by mango on 2018/4/17.
//  Copyright © 2018年 mango. All rights reserved.
//

#import "YRCurrentLanguageTypeTool.h"

@implementation YRCurrentLanguageTypeTool

+(NSString *)currentLanguage{
    
   
    // （iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理
    NSString *language = [NSLocale preferredLanguages].firstObject;
    if ([language hasPrefix:@"en"]) {
        language = @"en";
    }
    else if ([language hasPrefix:@"zh"]) {
        
        if ([language rangeOfString:@"Hans"].location != NSNotFound) {
            language = @"zh-Hans"; // 简体中文
        } else { // zh-Hant\zh-HK\zh-TW
            language = @"zh-Hant"; // 繁體中文
        }
        
    }
    else {
        language = @"en";
    }
    
    return language;

}


///** 本地化语言处理方案二*/ 详见 NSBundle (MJRefresh)
//
//+ (NSString *)yr_localizedStringForKey:(NSString *)key value:(NSString *)value
//{
//    static NSBundle *bundle = nil;
//    if (bundle == nil) {
//        // （iOS获取的语言字符串比较不稳定）目前框架只处理en、zh-Hans、zh-Hant三种情况，其他按照系统默认处理
//        NSString *language = [NSLocale preferredLanguages].firstObject;
//        if ([language hasPrefix:@"en"]) {
//            language = @"en";
//        } else if ([language hasPrefix:@"zh"]) {
//            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
//                language = @"zh-Hans"; // 简体中文
//            } else { // zh-Hant\zh-HK\zh-TW
//                language = @"zh-Hant"; // 繁體中文
//            }
//        } else {
//            language = @"en";
//        }
//
//        // 从MJRefresh.bundle中查找资源
//        bundle = [NSBundle bundleWithPath:[[NSBundle mj_refreshBundle] pathForResource:language ofType:@"lproj"]];
//    }
//    value = [bundle localizedStringForKey:key value:value table:nil];
//    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
//}

@end
