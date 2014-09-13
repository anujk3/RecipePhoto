//
//  RecipeViewController.h
//  RecipePhoto
//
//  Created by Anuj Katiyal on 10/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;


- (IBAction)close:(id)sender;


@property (weak, nonatomic) NSString *recipeImageName;

@end
