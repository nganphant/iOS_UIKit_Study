//
//  ViewController.m
//  UITableView_Basic
//
//  Created by ngan on 2022/06/19.
//

#import "ViewController.h"
#import "CountryTableViewCell.h"
#import "Models.h"

#define ROW_HEIGHT (44)

@interface ViewController ()

@end

@implementation ViewController {

  __weak IBOutlet UITableView *_tableCountry;
  NSMutableArray<Country *> *_listCountry;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // this is tableview data
    [self initTableView];

  // Build data for demo
    [self initDemoData];
}

- (void)initTableView {
    
    // for number of item and cell data
    _tableCountry.dataSource = self;
    
    // for adjust cell height, header height....
    _tableCountry.delegate = self;
    
    // register nib of custom cell
    UINib *nib = [UINib nibWithNibName:@"CountryTableViewCell" bundle:nil];
    [_tableCountry registerNib:nib
        forCellReuseIdentifier:[CountryTableViewCell CELL_ID]];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return _listCountry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CountryTableViewCell *cell    = [tableView dequeueReusableCellWithIdentifier:[CountryTableViewCell CELL_ID]
                                                                           forIndexPath:indexPath];
    cell.country=_listCountry[indexPath.row];
  return cell;
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ROW_HEIGHT;
}

#pragma mark - HELPER

- (void)initDemoData {
    _listCountry = [NSMutableArray new];
    
    NSArray *countryNames = @[
        @"Afghanistan",
        @"Albania",
        @"Algeria",
        @"Andorra",
        @"Angola",
        @"Antigua and Barbuda",
        @"Argentina",
        @"Armenia",
        @"Australia",
        @"Austria",
        @"Azerbaijan",
        @"Bahamas",
        @"Bahrain",
        @"Bangladesh",
        @"Barbados",
        @"Belarus",
        @"Belgium",
        @"Belize",
        @"Benin",
        @"Bhutan",
        @"Bolivia",
        @"Bosnia and Herzegovina",
        @"Botswana",
        @"Brazil",
        @"Brunei",
        @"Bulgaria",
        @"Burkina Faso",
        @"Burundi",
        @"Côte d'Ivoire",
        @"Cabo Verde",
        @"Cambodia",
        @"Cameroon",
        @"Canada",
        @"Central African Republic",
        @"Chad",
        @"Chile",
        @"China",
        @"Colombia",
        @"Comoros",
        @"Congo (Congo-Brazzaville)",
        @"Costa Rica",
        @"Croatia",
        @"Cuba",
        @"Cyprus",
        @"Czechia (Czech Republic)",
        @"Democratic Republic of the Congo",
        @"Denmark",
        @"Djibouti",
        @"Dominica",
        @"Dominican Republic",
        @"Ecuador",
        @"Egypt",
        @"El Salvador",
        @"Equatorial Guinea",
        @"Eritrea",
        @"Estonia",
        @"Eswatini (fmr. Swaziland)",
        @"Ethiopia",
        @"Fiji",
        @"Finland",
        @"France",
        @"Gabon",
        @"Gambia",
        @"Georgia",
        @"Germany",
        @"Ghana",
        @"Greece",
        @"Grenada",
        @"Guatemala",
        @"Guinea",
        @"Guinea-Bissau",
        @"Guyana",
        @"Haiti",
        @"Holy See",
        @"Honduras",
        @"Hungary",
        @"Iceland",
        @"India",
        @"Indonesia",
        @"Iran",
        @"Iraq",
        @"Ireland",
        @"Israel",
        @"Italy",
        @"Jamaica",
        @"Japan",
        @"Jordan",
        @"Kazakhstan",
        @"Kenya",
        @"Kiribati",
        @"Kuwait",
        @"Kyrgyzstan",
        @"Laos",
        @"Latvia",
        @"Lebanon",
        @"Lesotho",
        @"Liberia",
        @"Libya",
        @"Liechtenstein",
        @"Lithuania",
        @"Luxembourg",
        @"Madagascar",
        @"Malawi",
        @"Malaysia",
        @"Maldives",
        @"Mali",
        @"Malta",
        @"Marshall Islands",
        @"Mauritania",
        @"Mauritius",
        @"Mexico",
        @"Micronesia",
        @"Moldova",
        @"Monaco",
        @"Mongolia",
        @"Montenegro",
        @"Morocco",
        @"Mozambique",
        @"Myanmar (formerly Burma)",
        @"Namibia",
        @"Nauru",
        @"Nepal",
        @"Netherlands",
        @"New Zealand",
        @"Nicaragua",
        @"Niger",
        @"Nigeria",
        @"North Korea",
        @"North Macedonia",
        @"Norway",
        @"Oman",
        @"Pakistan",
        @"Palau",
        @"Palestine State",
        @"Panama",
        @"Papua New Guinea",
        @"Paraguay",
        @"Peru",
        @"Philippines",
        @"Poland",
        @"Portugal",
        @"Qatar",
        @"Romania",
        @"Russia",
        @"Rwanda",
        @"Saint Kitts and Nevis",
        @"Saint Lucia",
        @"Saint Vincent and the Grenadines",
        @"Samoa",
        @"San Marino",
        @"Sao Tome and Principe",
        @"Saudi Arabia",
        @"Senegal",
        @"Serbia",
        @"Seychelles",
        @"Sierra Leone",
        @"Singapore",
        @"Slovakia",
        @"Slovenia",
        @"Solomon Islands",
        @"Somalia",
        @"South Africa",
        @"South Korea",
        @"South Sudan",
        @"Spain",
        @"Sri Lanka",
        @"Sudan",
        @"Suriname",
        @"Sweden",
        @"Switzerland",
        @"Syria",
        @"Tajikistan",
        @"Tanzania",
        @"Thailand",
        @"Timor-Leste",
        @"Togo",
        @"Tonga",
        @"Trinidad and Tobago",
        @"Tunisia",
        @"Turkey",
        @"Turkmenistan",
        @"Tuvalu",
        @"Uganda",
        @"Ukraine",
        @"United Arab Emirates",
        @"United Kingdom",
        @"United States of America",
        @"Uruguay",
        @"Uzbekistan",
        @"Vanuatu",
        @"Venezuela",
        @"Vietnam",
        @"Yemen",
        @"Zambia",
        @"Zimbabwe"
    ];
    
    NSInteger population[]={
        38928346,
        2877797,
        43851044,
        77265,
        32866272,
        97929,
        45195774,
        2963243,
        25499884,
        9006398,
        10139177,
        393244,
        1701575,
        164689383,
        287375,
        9449323,
        11589623,
        397628,
        12123200,
        771608,
        11673021,
        3280819,
        2351627,
        212559417,
        437479,
        6948445,
        20903273,
        11890784,
        26378274,
        555987,
        16718965,
        26545863,
        37742154,
        4829767,
        16425864,
        19116201,
        1439323776,
        50882891,
        869601,
        5518087,
        5094118,
        4105267,
        11326616,
        1207359,
        10708981,
        89561403,
        5792202,
        988000,
        71986,
        10847910,
        17643054,
        102334404,
        6486205,
        1402985,
        3546421,
        1326535,
        1160164,
        114963588,
        896445,
        5540720,
        65273511,
        2225734,
        2416668,
        3989167,
        83783942,
        31072940,
        10423054,
        112523,
        17915568,
        13132795,
        1968001,
        786552,
        11402528,
        801,
        9904607,
        9660351,
        341243,
        1380004385,
        273523615,
        83992949,
        40222493,
        4937786,
        8655535,
        60461826,
        2961167,
        126476461,
        10203134,
        18776707,
        53771296,
        119449,
        4270571,
        6524195,
        7275560,
        1886198,
        6825445,
        2142249,
        5057681,
        6871292,
        38128,
        2722289,
        625978,
        27691018,
        19129952,
        32365999,
        540544,
        20250833,
        441543,
        59190,
        4649658,
        1271768,
        128932753,
        548914,
        4033963,
        39242,
        3278290,
        628066,
        36910560,
        31255435,
        54409800,
        2540905,
        10824,
        29136808,
        17134872,
        4822233,
        6624554,
        24206644,
        206139589,
        25778816,
        2083374,
        5421241,
        5106626,
        220892340,
        18094,
        5101414,
        4314767,
        8947024,
        7132538,
        32971854,
        109581078,
        37846611,
        10196709,
        2881053,
        19237691,
        145934462,
        12952218,
        53199,
        183627,
        110940,
        198414,
        33931,
        219159,
        34813871,
        16743927,
        8737371,
        98347,
        7976983,
        5850342,
        5459642,
        2078938,
        686884,
        15893222,
        59308690,
        51269185,
        11193725,
        46754778,
        21413249,
        43849260,
        586632,
        10099265,
        8654622,
        17500658,
        9537645,
        59734218,
        69799978,
        1318445,
        8278724,
        105695,
        1399488,
        11818619,
        84339067,
        6031200,
        11792,
        45741007,
        43733762,
        9890402,
        67886011,
        331002651,
        3473730,
        33469203,
        307145,
        28435940,
        97338579,
        29825964,
        18383955,
        14862924
    };
    
    for (NSUInteger idx=0; idx<countryNames.count; idx++) {
        
        Country *cnty = [Country new];
        cnty.name = countryNames[idx];
        cnty.population=population[idx];
        [_listCountry addObject:cnty];
    }
}
@end
