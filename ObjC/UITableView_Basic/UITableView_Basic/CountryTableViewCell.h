//
//  CountryTableViewCell.h
//  UITableView_Basic
//
//  Created by ngan on 2022/06/19.
//

#import <UIKit/UIKit.h>
#import "Models.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountryTableViewCell : UITableViewCell
@property(class, readonly) NSString* CELL_ID;
@property(nonatomic) Country* country;
@end

NS_ASSUME_NONNULL_END
