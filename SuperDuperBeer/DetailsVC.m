//
//  DetailsVC.m
//  SuperDuperBeer
//
//  Created by Filipe Patrício on 08/05/15.
//  Copyright (c) 2015 Filipe Patrício. All rights reserved.
//

#import "DetailsVC.h"
#import "Country.h"

@interface DetailsVC ()
@property (weak, nonatomic) IBOutlet UIImageView *beerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *countryFlagImageView;
@property (weak, nonatomic) IBOutlet UILabel *alcoholLabel;
@property (nonatomic, strong) NSMutableArray *countriesArray;   //Of Country
@end

@implementation DetailsVC


-(NSMutableArray*)countriesArray
{
    
    if(!_countriesArray)
    {
        _countriesArray = [[NSMutableArray alloc]init];
        NSArray *beersPList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Countries" ofType:@"plist"]]; //Of NSDictionary
        for(NSDictionary *dict in beersPList)
        {
            [_countriesArray addObject:[[Country alloc] initWithCountryID:[(NSNumber*)dict[kKeyCountryID] integerValue]
                                                                 withName: dict[kKeyName]
                                                             withFlagIcon: dict[kKeyFlagIcon]]];
        }
    }
    return _countriesArray;
}

- (void)showBeer
{
    // Do any additional setup after loading the view, typically from a nib.
    
    Beer *currentBeer = self.currentBeer;
    Country *currentBeerCountry = (Country*)self.countriesArray[currentBeer.countryID];
    
    self.beerImage.image = [UIImage imageNamed:currentBeer.imageName];
    self.navigationController.navigationBar.topItem.title = currentBeer.name;
    self.nameLabel.text = currentBeer.name;
    self.countryLabel.text = currentBeerCountry.name;
    self.countryFlagImageView.image = [UIImage imageNamed:currentBeerCountry.flagIcon];
    self.alcoholLabel.text = [NSString stringWithFormat:@"%lu %%", self.currentBeer.alcoholPercent];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showBeer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
