//
//  TaskDetailsViewController.h
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface TaskDetailsViewController : UIViewController

@property Task *task ;
-(void)showTaskDetails;

@end

NS_ASSUME_NONNULL_END
