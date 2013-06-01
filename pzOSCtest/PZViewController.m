//
//  PZViewController.m
//  pzOSCtest
//
//  Created by 蒲 众 on 5/12/13.
//  Copyright (c) 2013 蒲 众. All rights reserved.
//

#import "PZViewController.h"
//#define FORMAT(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]

@interface PZViewController ()
//@property (strong,nonatomic) UInt16 * kUDP_PORT;


@end


@implementation PZViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    udpSocket = [[AsyncUdpSocket alloc] initWithDelegate:self];
	
	//NSError *error = nil;
	/*
	if (![udpSocket bindToPort:0 error:&error])
	{
		NSLog(@"Error binding: %@", error);
		return;
	}
	*/
	[udpSocket receiveWithTimeout:-1 tag:0];
	
	NSLog(@"Ready");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)didSliderChange:(id)sender {
    int value = (int)self.mySlider.value;
    NSString *msg =[NSString stringWithFormat:@"p%i",value];
    self.myLabel.text=msg;
    NSString *host = @"192.168.1.177" ;
    int port = 80;
  
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    [udpSocket sendData:data toHost:host port:port withTimeout:-1 tag:tag];
    //[self logMessage:FORMAT(@"SENT (%i): %@", (int)tag, msg)];
    tag++;
    //NSLog(@"hello");
}

- (IBAction)buttonPressed:(id)sender {
    NSString *host = @"192.168.1.177" ;
    int port = 80;
    NSString *msg =@"hello";
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    [udpSocket sendData:data toHost:host port:port withTimeout:-1 tag:tag];
    //[self logMessage:FORMAT(@"SENT (%i): %@", (int)tag, msg)];
    tag++;
    NSLog(@"hello");

}





@end
