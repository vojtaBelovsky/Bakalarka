//
//  BCViewController.m
//  Bakalarka1
//
//  Created by Vojtech Belovsky on 3/18/13.
//  Copyright (c) 2013 vojta. All rights reserved.
//

#import "VBHTTPClient.h"

@interface BCViewController ()
- (IBAction)getIssue:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation BCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getIssue:(id)sender {
    
    [[VBHTTPClient sharedInstance] getPath:@"user/issues" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSArray *response = [NSArray arrayWithArray:responseObject];
        NSLog(@"BCViewController");
        NSLog(@"%d", [response count]);
        NSLog(@"%@", response);
        //NSLog(@"%@", response[1]);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"fail");
    }];
    
    /*VBHTTPClient *myInstance = [VBHTTPClient sharedInstance];
    [myInstance getPath:@"user/issues" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
    NSArray *response = [NSArray arrayWithArray:responseObject];
    NSLog(@"BCViewController");
    NSLog(@"%d", [response count]);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error){
    NSLog(@"fail");
    }];
    */
    NSLog(@"its here");
    
    
    /*NSURL *url = [NSURL URLWithString:@"https://api.github.com/"];
    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:url];
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    [client setAuthorizationHeaderWithUsername:@"vojtaBelovsky" password:@"tr1n1t1"];
    
    [client getPath:@"user/issues" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *response = [NSArray arrayWithArray:responseObject];
        NSLog(@"success");
        NSLog(@"%d", [response count]);
        NSLog(@"%@", [response valueForKey:@"url"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"log");
    }];
    */
    
    
    /*
    id * JSON;
    NSDictionary * myDictionary;
    AFHTTPClient * myClient;
    //[myClient setAuthorizationHeaderWithUsername:@"vojtaBelovsky" password:@"tr1n1t1"];
    //[myClient requestWithMethod:@"POST" path:@"https://api.github.com/user/issues" parameters:myDictionary];
    [myClient requestWithMethod:@"POST" path:@"https://api.github.com/users/defunk" parameters:myDictionary];
    self.label.text = [myDictionary valueForKey:@"url"];
    if(myDictionary != NULL){
        NSLog(@"JSON");
    }
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/user/issues"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSString * myString = [NSString stringWithFormat:@"URL address: %@",[JSON valueForKeyPath:@"url"]];
        //[JSON ]
        self.label.text = myString;
    } failure:nil];
    
    [operation start];
    */
}
@end








