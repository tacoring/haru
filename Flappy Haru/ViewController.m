//
//  ViewController.m
//  Flappy Haru
//
//  Created by Chang-Che Lu on 2/28/14.
//  Copyright (c) 2014 Chang-Che Lu. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"
#import <iAd/iAd.h>

//#import "GADBannerView.h"

@interface ViewController () <MySceneDelegate>
@end

@implementation ViewController

@synthesize turniAddON;

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];

//    ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
//    [adView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
//    [self.view addSubview:adView];
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    
    // Create and configure the scene.
    SKScene * scene = [[MyScene alloc] initWithSize:skView.bounds.size delegate:self state:GameStateMainMenu];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    turniAddON = YES;
    self.canDisplayBannerAds = turniAddON;
    
    // Present the scene.
    [skView presentScene:scene];
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(BOOL)prefersStatusBarHidden {
    
    return YES;
}

- (UIImage *)screenshot {
  UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 1.0);
  [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}

- (void)shareString:(NSString *)string url:(NSURL*)url image:(UIImage *)image {
  UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:@[string, url, image] applicationActivities:nil];
  [self presentViewController:vc animated:YES completion:nil];

}

-(void)setTurniAddONFF:(BOOL)turnONOFF {
    NSLog(@"setTurniAddON on, %d", turnONOFF);
    self.canDisplayBannerAds = turnONOFF;
    turniAddON = turnONOFF;
    
}
@end
