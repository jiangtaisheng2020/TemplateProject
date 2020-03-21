//
//  FileLoger.m
//  FileLoger
//
//  Created by wangpc on 11-11-16.
//  Copyright (c) 2015年 __MyCompanyName__. All rights reserved.
//

#import "FileLoger.h"

@implementation FileLoger
@synthesize handle, dateFormatter, path;

- (id)init {
    self = [super init];
    if (self) {
        _queue = dispatch_queue_create([[NSString stringWithFormat:@"FileLoger.%@", self] UTF8String], NULL);
        
#ifdef DEBUG
        
        NSString *path1 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:path1]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:path1 withIntermediateDirectories:YES attributes:nil error:nil];
        }
        NSString *filePath = [path1 stringByAppendingPathComponent:@"log"];
        NSString *logFilePath = filePath;
        
        //logFilePath=[logFilePath stringByAppendingPathComponent:@"log"];
        //logFilePath=@"/Users/youq/log/";
        //NSLog(@"log file path:%@",logFilePath);
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
        NSFileManager *fm = [NSFileManager defaultManager];
        if (![fm fileExistsAtPath:logFilePath]) {
            [fm createDirectoryAtPath:logFilePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        path = [logFilePath stringByAppendingPathComponent:@"iPhoneRec.xml"];
        if ([fm fileExistsAtPath:path]) {
            NSDictionary *attrs =[fm attributesOfItemAtPath:path error:nil];
            NSInteger fileSize = [[attrs objectForKey:NSFileSize] intValue];
            
            printf("log file size: %ld bytes from %s \n ", (long)fileSize, [path UTF8String] );
            
            unsigned long long maxFilesize = 1024*1024*2;
            if (fileSize > maxFilesize) {
                NSFileHandle *oldHandleTemp = [NSFileHandle fileHandleForReadingAtPath:path];
                [oldHandleTemp seekToFileOffset:fileSize/2];
                NSData *halfData = [oldHandleTemp readDataToEndOfFile];//后半部分数据
                if ([fm removeItemAtPath:path error:nil]) {
                    if ([fm createFileAtPath:path contents:nil attributes:nil]) {
                        NSFileHandle *handleTemp = [NSFileHandle fileHandleForWritingAtPath:path];
                        [handleTemp writeData:halfData];
                    }
                }
                //            NSLog(@"log file is large than 100KB, del log file, size: %d bytes",fileSize);
            }
        } else {
            [fm createFileAtPath:path contents:nil attributes:nil];
            //    NSLog(@"log file not exist,create new log file");
        }
        
        self.handle = [NSFileHandle fileHandleForWritingAtPath:path];
        [self.handle seekToEndOfFile];
#else
#endif
        
    }
    return self;
}


+ (FileLoger*)instance {
    static FileLoger *loger = nil;
    @synchronized(self){
        if (loger == nil) {
            loger = [[self alloc] init];
        }
    }
    return loger;
}

- (void)log:(NSString *)format,... {
    if ([format length] > 0) {
        @synchronized(self) {
            va_list args;
            va_start(args, format);
            NSString *newFormat = [NSString stringWithFormat:@"%@:%@\n", [self.dateFormatter stringFromDate:[NSDate date]], format];
            NSString *content = [[NSString alloc] initWithFormat:newFormat arguments:args];
            va_end(args);
            
            dispatch_async(_queue, ^() {
                [handle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
            });
        }
    }
}

- (void)dealloc {
//    dispatch_release(_queue);
    [self.handle closeFile];
}

@end





