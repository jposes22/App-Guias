//
//  AppDelegate.h
//  Torres Oeste
//
//  Created by Jose Pose on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL isRotated;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
- (void)deleteAllEntities:(NSString *)nameEntity;

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window;
@end

