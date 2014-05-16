//
//  MSDViewController.m
//  Hasher
//
//  Created by Matthew Dobson on 5/16/14.
//  Copyright (c) 2014 Matthew Dobson. All rights reserved.
//

#import "MSDViewController.h"
#import <CommonCrypto/CommonHMAC.h>

@interface MSDViewController ()

@end

@implementation MSDViewController

- (IBAction)performHash:(id)sender {
    NSString * results = [self createHash:self.source.text];
    self.target.text = results;
}

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

-(NSString *)createHash:(NSString *)string {
    const char *cstr = [string cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [NSData dataWithBytes:cstr length:string.length];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data.bytes, data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
