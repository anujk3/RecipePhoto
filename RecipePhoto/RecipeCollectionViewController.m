//
//  RecipeCollectionViewController.m
//  RecipePhoto
//
//  Created by Anuj Katiyal on 09/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import "RecipeCollectionViewController.h"
#import "RecipeCollectionHeaderView.h"
#import "RecipeViewController.h"

@interface RecipeCollectionViewController ()
@end

@implementation RecipeCollectionViewController{
    NSArray *recipeImages;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Initialize recipe image array
    // Initialize recipe image array
    NSArray *mainDishImages = [NSArray arrayWithObjects:@"egg_benedict.jpg",
                               @"full_breakfast.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg",
                               @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg",
                               @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"thai_shrimp_cake.jpg",
                               @"vegetable_curry.jpg", nil];
    NSArray *drinkDessertImages = [NSArray arrayWithObjects:@"angry_birds_cake.jpg",
                                   @"creme_brelee.jpg", @"green_tea.jpg", @"starbucks_coffee.jpg", @"white_chocolate_donut.jpg",
                                   nil];
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    recipeImages = [NSArray arrayWithObjects:mainDishImages, drinkDessertImages, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [recipeImages count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[recipeImages objectAtIndex:section]count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    
    recipeImageView.image = [UIImage imageNamed:[recipeImages[indexPath.section]objectAtIndex:indexPath.row]];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%i", indexPath.section+1];
        headerView.titleLabel.text = title;
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        reusableview = footerView;
    }
    
    return reusableview;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showRecipePhoto"]){
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        RecipeViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        destViewController.recipeImageName = [recipeImages[indexPath.section] objectAtIndex:indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
}


- (IBAction)shareButtonTapped:(id)sender {
}
@end
