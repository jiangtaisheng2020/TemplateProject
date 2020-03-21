//
//  FileLoger.h
//  FileLoger
//
//  Created by wangpc on 11-11-16.
//  Copyright (c) 2015年 __MyCompanyName__. All rights reserved.
//


//#define log(fmt,arg...)  [loger log:fmt,##arg]

#import <Foundation/Foundation.h>

/*日志模块*/
@interface FileLoger:NSObject {
    dispatch_queue_t _queue;
    NSString *path;
    NSDateFormatter *dateFormatter;
    NSFileHandle *handle;
}
@property(nonatomic,strong) NSFileHandle *handle;
@property(nonatomic,strong) NSDateFormatter *dateFormatter;
@property(nonatomic,readonly) NSString *path;

- (void)log:(NSString*)format,...;
//-(NSString*)compressLogFile;

/*必须调用该单例初始化方法，不能直接alloc init*/
+ (FileLoger*)instance;

@end
