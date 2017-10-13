//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  MGDropAD.m
//  MGDropAD
//
//  Created by BackNotGod on 2017/10/13.
//  Copyright (c) 2017年 BackNotGod. All rights reserved.
//

#import "MGDropAD.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>

CHDeclareClass(MGVODView)
CHOptimizedMethod4(self, void, MGVODView, requestADsWithVideoId,id,arg1,pcUrl,id,arg2,clipId,id,arg3,params,id,arg4){
    NSData* jsonData = [(NSString*)arg4 dataUsingEncoding:kCFStringEncodingUTF8];
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil];
    [dic[@"v"] setValue:@1 forKey:@"vip"];
    NSError *parseError = nil;
    NSData * jsonData_s = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString* arg4s = [[NSString alloc] initWithData:jsonData_s encoding:NSUTF8StringEncoding];
    CHSuper4(MGVODView, requestADsWithVideoId, arg1, pcUrl, arg2, clipId, arg3, params, arg4s);
}

CHConstructor{
    CHLoadLateClass(MGVODView);
    CHClassHook4(MGVODView, requestADsWithVideoId, pcUrl, clipId, params);
}
