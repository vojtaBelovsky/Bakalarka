//
//  VBHTTPClient.m
//  Bakalarka1
//
//  Created by Vojtech Belovsky on 3/19/13.
//  Copyright (c) 2013 vojta. All rights reserved.
//

#import "BCHTTPClient.h"
#define BCHTTPCLIENT_BASE_URL @"https://api.github.com/"

@implementation BCHTTPClient

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if ( self ) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self setAuthorizationHeaderWithUsername:@"vojtaBelovsky" password:@"tr1n1t1"];
        
        
        
    }
    return self;
}

/*- (void)processSuccessResponse:(AFHTTPRequestOperation *)operation
                      response:(id)response
                       success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    NSLog(@"getPath Succeded");
}

- (void)processFailureResponse:(AFHTTPRequestOperation *)operation
                         error:(NSError *)error
                       success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    //SignOut when 401 returned
    if ( operation.response.statusCode == 401 ) {
        NSLog(@"SignOut code returned");
    }
    NSLog(@"getPath failed with error code: %d", [error code]);
}

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    __weak VBHTTPClient *weakSelf = self;
    
    [super getPath:path
        parameters:parameters
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               [weakSelf processSuccessResponse:operation
                                       response:responseObject
                                        success:success
                                        failure:failure];
           }
           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               [weakSelf processFailureResponse:operation
                                          error:error
                                        success:success
                                        failure:failure];
           }];
}*/

+ (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [[self sharedInstance] getPath:path parameters:parameters success:success failure:failure];
}

+ (BCHTTPClient *)sharedInstance {
    static BCHTTPClient *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithBaseURL:[NSURL URLWithString:BCHTTPCLIENT_BASE_URL]];
    });
    return instance;
}

@end
