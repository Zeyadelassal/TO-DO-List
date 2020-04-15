//
//  EditTaskViewController.h
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "TaskManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditTaskViewController : UIViewController

@property int taskIndex ;
@property NSString *taskStatus;

-(void)checkDoneStatus;

@end

NS_ASSUME_NONNULL_END
