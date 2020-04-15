//
//  ToDoViewController.h
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/25/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "TaskManager.h"
#import "AddTaskViewController.h"
#import "EditTaskViewController.h"
#import "TaskDetailsViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface ToDoViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

-(void) addTask;

@end

NS_ASSUME_NONNULL_END
