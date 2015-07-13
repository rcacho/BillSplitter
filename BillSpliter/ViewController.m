//
//  ViewController.m
//  BillSpliter
//
//  Created by ricardo antonio cacho on 2015-07-12.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;

@property (weak, nonatomic) IBOutlet UIButton *calculateBillButton;

@property (weak, nonatomic) IBOutlet UISlider *numberOfBillSlider;

@property (weak, nonatomic) IBOutlet UILabel *splitBillAmountLabel;

@property NSDecimalNumber *billAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.billAmountTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateSplitAmount:(UIButton *)sender {
    NSDecimalNumber *splitbill = [self.billAmount decimalNumberByDividingBy:[[NSDecimalNumber alloc] initWithFloat:self.numberOfBillSlider.value]];
    NSLog(@"This is the bill amount :%@",self.billAmount);
    self.splitBillAmountLabel.text = [NSString stringWithFormat:@"%@",splitbill];
    
}

- (IBAction)sliderChanged:(id)sender
{
    int sliderValue;
    sliderValue = lroundf(self.numberOfBillSlider.value);
    [self.numberOfBillSlider setValue:sliderValue animated:YES];
}

#pragma mark text field

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"User is typing");
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"This is what is in the slider: %f", self.numberOfBillSlider.value);
    self.billAmount = [NSDecimalNumber decimalNumberWithString:textField.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
