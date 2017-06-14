//
//  DfthNetStateDelegate.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/19.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,NetworkStatus)
{
    NRS_Unknown = 0,
    NRS_NotReachable,
    NRS_WWAN,
    NRS_WiFi,
};

@protocol DfthNetStateDelegate <NSObject>
- (void)netStateChangeFrom:(NetworkStatus)oldState to:(NetworkStatus)newState;
@end
