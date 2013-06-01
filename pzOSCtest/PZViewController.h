//
//  PZViewController.h
//  pzOSCtest
//
//  Created by 蒲 众 on 5/12/13.
//  Copyright (c) 2013 蒲 众. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AsyncUdpSocket.h"

@interface PZViewController : UIViewController{
    long tag;
	AsyncUdpSocket *udpSocket;
}
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (nonatomic, strong) AsyncUdpSocket *socket;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;





@end
