//
//  TaskManager.h
//  To-Do 2.0
//
//  Created by ZeyadEl3ssal on 12/22/19.
//  Copyright © 2019 ZeyadEl3ssal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface TaskManager : Task
{
    NSMutableArray *allTasks ;
    NSMutableArray *highTasks ;
    NSMutableArray *medTasks ;
    NSMutableArray *lowTasks ;
    NSMutableArray *toDoTasks ;
    NSMutableArray *inProgressTasks ;
    NSMutableArray *doneTasks ;
    NSUserDefaults *defaults;
    NSData  *tasksData;
}

-(void) addTask : (Task*)task ;
-(void) EditTask : (Task*)task : (int)index ;
-(void) deleteTask : (Task*)task  ;
-(NSMutableArray*) getAllTasks ;
-(NSMutableArray*) getHighTasks ;
-(NSMutableArray*) getMediumTasks ;
-(NSMutableArray*) getLowTasks ;
-(NSMutableArray*) getToDoTasks ;
-(NSMutableArray*) getInProgressTasks ;
-(NSMutableArray*) getDoneTasks ;
-(NSMutableArray*) getArray : (NSMutableArray*) taskArr Condition:(NSString*) condition Type:(int) type ;
-(void)saveToUserDefaults;
-(void)getFromUserDefaults;
+(id) sharedInstance;

@end

NS_ASSUME_NONNULL_END
