//
//  AgeCalculateViewController.m
//  XMPPDemo
//
//  Created by Hexun pro on 15/6/24.
//  Copyright (c) 2015年 Hexun. All rights reserved.
//

#import "AgeCalculateViewController.h"
#import "UIImage+SimplifyImage.h"
#import <CoreImage/CoreImage.h>
@interface AgeCalculateViewController ()
{
    UITextField *inputTextField;
    UILabel *tipLable;
    UIButton *calculBtn;
}
@end

@implementation AgeCalculateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(100, 0, 40, 40)];
    img.image = [[UIImage imageNamed:@"IMG_0141"] processSimplifyImageWithSource];
    [self.view addSubview:img];
//    [img release];
    // Do any additional setup after loading the view.
}

- (void)initUI
{
    inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-100, 200, 30)];
    inputTextField.backgroundColor = [UIColor grayColor];
    inputTextField.delegate = self;
    [self.view addSubview:inputTextField];
    
    calculBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    calculBtn.frame = CGRectMake( 0, SCREEN_HEIGHT/2, 100, 30);
    calculBtn.backgroundColor = [UIColor greenColor];
    [calculBtn setTitle:@"calcaulate" forState:UIControlStateNormal];
    [calculBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [calculBtn addTarget:self action:@selector(calculateAge) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:calculBtn];
    
    tipLable = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 100, 100, 30)];
    tipLable.textAlignment = NSTextAlignmentCenter;
    tipLable.backgroundColor = [UIColor greenColor];
    tipLable.font = [UIFont systemFontOfSize:16];
    tipLable.textColor = [UIColor blackColor];
    [self.view addSubview:tipLable];
}



- (void)calculateAge
{
    
    NSDate *date = [self calculateA:inputTextField.text];
    CLog(@"%@",date);
}


+ (NSString *)calculateAgeWithBirthday:(NSString *)date
{
   
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    [formatter setTimeZone:zone];
    [formatter setDateFormat : @"YYYY-MM-dd HH:mm:ss am"];
    
    NSDate *dateTime = [formatter dateFromString:date];
    
    NSInteger interval = [zone secondsFromGMTForDate: dateTime];
    
    NSDate *localeDate = [dateTime  dateByAddingTimeInterval: interval];
    
    NSLog(@"%@", dateTime);//打印2011-12-04 19:04:00 +0000，这里+0000表示时区
    
    NSDate *dateNow = [NSDate date];
    
    NSLog(@"%@", dateNow);//打印2011-08-17 08:26:57 +0000，这里+0000表示时区
    
//    [formatter setDateFormat : @"yyyy年M月d日 H点m分"];
    
//    NSLog(@"%@", [formatter stringFromDate:dateNow]);//打印2011年8月17日 16点26分
    
    
    NSTimeInterval dateDiff = [dateTime timeIntervalSinceNow];
    
    int age=trunc(dateDiff/(60*60*24))/365;
    
    
    return localeDate;
}


- (NSDate *)calculateA:(NSString *)date
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat : @"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *dateTime = [formatter dateFromString:date];
    
    NSInteger interval = [zone secondsFromGMTForDate: dateTime];
    
    NSDate *localeDate = [dateTime  dateByAddingTimeInterval: interval];
    
    NSLog(@"%@", localeDate);//打印2011-12-04 19:04:00 +0000，这里+0000表示时区
    
    NSDate *dateNow = [NSDate date];
    
    NSLog(@"%@", dateNow);//打印2011-08-17 08:26:57 +0000，这里+0000表示时区
    
    //    [formatter setDateFormat : @"yyyy年M月d日 H点m分"];
    
    //    NSLog(@"%@", [formatter stringFromDate:dateNow]);//打印2011年8月17日 16点26分
    
    
//    NSTimeInterval dateDiff = [dateTime timeIntervalSinceNow];
    
//    int age=trunc(dateDiff/(60*60*24))/365;
    
    
    return localeDate;
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
