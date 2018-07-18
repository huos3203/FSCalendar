//
//  PatorlCalendarViewController.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/17.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "PatorlCalendarViewController.h"
#import "CalendarBottomCell.h"

@interface PatorlCalendarViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,FSCalendarDelegate>
@property (strong, nonatomic) IBOutlet FSCalendar *calendar;
@property (strong, nonatomic) IBOutlet UIView *ibWhiteView;
@property (strong, nonatomic) IBOutlet UICollectionView *ibCollectionView;

@property (strong, nonatomic) NSCalendar *gregorian;
@property (strong, nonatomic) NSDateFormatter *dateFormatter1;
@property (strong, nonatomic) NSDateFormatter *dateFormatter2;

@property (strong, nonatomic) NSDictionary *fillSelectionColors;
@property (strong, nonatomic) NSDictionary *fillDefaultColors;
@property (strong, nonatomic) NSDictionary *borderDefaultColors;
@property (strong, nonatomic) NSDictionary *borderSelectionColors;

@property (strong, nonatomic) NSArray *datesWithEvent;
@property (strong, nonatomic) NSArray *datesWithMultipleEvents;

@property (strong, nonatomic) NSDictionary<NSString *, UIImage *> *images;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation PatorlCalendarViewController
- (instancetype)init
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [board instantiateViewControllerWithIdentifier:@"PatorlCalendarViewController"];
    //    if (self = [super init]) {
    [self loadData];
    //    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.calendar.appearance.caseOptions = FSCalendarCaseOptionsWeekdayUsesSingleUpperCase;
    //圆角
    _ibWhiteView.layer.cornerRadius = 5;
    _ibWhiteView.layer.masksToBounds = YES;
}
-(void)loadData{
    self.title = @"FSCalendar";
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy/MM/dd";
    self.images = @{@"2018/07/08":[UIImage imageNamed:@"icon_cat"],
                    @"2018/07/06":[UIImage imageNamed:@"已查"],
                    @"2018/07/18":[UIImage imageNamed:@"已查"],
                    @"2018/07/22":[UIImage imageNamed:@"已查"]
                  };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UI
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBarType:YES];
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self setNavigationBarType:NO];
}
-(void)setNavigationBarType:(BOOL)isClear
{
    self.navigationController.navigationBar.translucent = YES;
    UIColor *color = isClear?[UIColor clearColor]:[UIColor whiteColor];
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.clipsToBounds = isClear;
}
#pragma mark UI事件

- (IBAction)ibaBackBarAction:(id)sender {
    
}
- (IBAction)ibaNewRecordAction:(id)sender {
    
}

#pragma mark - <FSCalendarDataSource>
- (UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date
{
    NSString *dateString = [self.dateFormatter stringFromDate:date];
    return self.images[dateString];
}
#pragma mark - <FSCalendarDelegate>
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"did select date %@",[self.dateFormatter stringFromDate:date]);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [self addActionTo:alertController from:@[@"检查报告",@"全项检查",@"常规检查"]];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)addActionTo:(UIAlertController *)alertVC from:(NSArray *)titleArr
{
    for (NSString *title in titleArr) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"这里是要调用销毁功能");
        }];
        [action setValue:[UIColor darkGrayColor] forKey:@"titleTextColor"];
        [alertVC addAction:action];
    }
}



#pragma mark -UIcollectionView Datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarBottomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarBottomCell" forIndexPath:indexPath];
    return cell;
}

@end
