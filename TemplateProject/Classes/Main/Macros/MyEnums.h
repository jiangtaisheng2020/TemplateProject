//
//  MyEnums.h
//  TemplateProject
//
//  Created by jiangtaisheng on 2020/3/15.
//  Copyright © 2020 jiangtaisheng. All rights reserved.
//

#ifndef MyEnums_h
#define MyEnums_h

typedef NS_ENUM (NSInteger,RMQWOrderRefundStatus){
      RMQWOrderRefundStatusHandlingMoney = 0,  //退款中
      RMQWOrderRefundStatusHandlingTicket ,  //退票中
      RMQWOrderRefundStatusHandled ,      //已退票
      RMQWOrderRefundStatusCanHandle ,    //可以退款
      RMQWOrderRefundStatusCanNotHandle ,    //不可以退票
    
};
#endif /* MyEnums_h */
