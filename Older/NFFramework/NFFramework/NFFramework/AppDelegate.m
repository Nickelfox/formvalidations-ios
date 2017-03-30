//
//  AppDelegate.m
//  NFFramework
//
//  Created by ras-fueled on 21/08/2014.
//  Copyright (c) 2014 Nickelfox. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  MenuViewController *menuVC = [[MenuViewController alloc] init];
  UINavigationController *navigationController =
  [[UINavigationController alloc] initWithRootViewController:menuVC];
  self.window.rootViewController = navigationController;
  [self.window makeKeyAndVisible];
    return YES;
}
							
@end
