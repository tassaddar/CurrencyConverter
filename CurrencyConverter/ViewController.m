//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Oleg KozhevniKov on 06/09/2017.
//  Copyright © 2017 WitchwoodLabs. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *yenesCurrency;
@property (weak, nonatomic) IBOutlet UILabel *euroCurrency;
@property (weak, nonatomic) IBOutlet UILabel *poundsCurrency;



@end

@implementation ViewController



- (IBAction)buttonTapped:(id)sender {
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    
    self.convertButton.enabled = YES;
    
    double inputValue = [self.inputField.text floatValue];
    
    double yenesValue = inputValue * currencies.JPY;
    double euroValue = inputValue * currencies.EUR;
    double poundsValue = inputValue * currencies.GBP;
    
    NSString *yenesToString = [NSString stringWithFormat:@"%.2f", yenesValue];
    NSString *euroToString = [NSString stringWithFormat:@"%.2f", euroValue];
    NSString *poundsToString = [NSString stringWithFormat:@"%.2f", poundsValue];
    
    self.yenesCurrency.text = yenesToString;
    self.euroCurrency.text = euroToString;
    self.poundsCurrency.text = poundsToString;

}

@end
