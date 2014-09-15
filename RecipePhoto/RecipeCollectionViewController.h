//
//  RecipeCollectionViewController.h
//  RecipePhoto
//
//  Created by Anuj Katiyal on 09/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCollectionViewController : UICollectionViewController <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;
- (IBAction)shareButtonTapped:(id)sender;

@end
