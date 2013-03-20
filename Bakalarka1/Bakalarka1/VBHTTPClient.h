//
//  VBHTTPClient.h
//  Bakalarka1
//
//  Created by Vojtech Belovsky on 3/19/13.
//  Copyright (c) 2013 vojta. All rights reserved.
//

#import "BCViewController.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"

@interface VBHTTPClient : AFHTTPClient

+ (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

+ (VBHTTPClient *)sharedInstance;

@end
