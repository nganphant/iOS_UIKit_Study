//
//  CountryTableViewCell.m
//  UITableView_Basic
//
//  Created by ngan on 2022/06/19.
//

#import "CountryTableViewCell.h"

static NSString* S_CELL_ID = @"COUNTRY_CELL";

@implementation CountryTableViewCell{
    
    __weak IBOutlet UILabel *_lblPopulation;
    __weak IBOutlet UILabel *_lblTitle;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (NSString *)CELL_ID{
    return S_CELL_ID;
}

- (void)setCountry:(Country *)country{
    _country = country;
    
    _lblTitle.text = country.name;
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];

    _lblPopulation.text = [formatter stringFromNumber:@(country.population)];

    _lblPopulation.textColor=country.population>50000000?UIColor.redColor:UIColor.blackColor;
//    _lblPopulation.text=[NSString stringWithFormat:@"%ld", country.population];
}
@end
