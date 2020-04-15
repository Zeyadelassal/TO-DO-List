//
//  Task.h
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject <NSCoding>

@property NSString *tName ;
@property NSString *tDesc ;
@property NSString *tPriority ;
@property NSString *tPriorityImage ;
@property NSString *tStatus ;
//@property NSDate *tReminder ;


@end

NS_ASSUME_NONNULL_END
