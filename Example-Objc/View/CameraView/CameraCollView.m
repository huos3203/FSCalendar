//
//  CameraCollView.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/21.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CameraCollView.h"
#import "CameraCell.h"
@implementation ShadeBootomView
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //x小于60  大于screen.frame.y - 60
    //y小于20  大于screen.frame.maxx - 10
    CGFloat xx = 20;
    CGFloat yy = 60;
    CGFloat kx = [gestureRecognizer locationInView:self].x;
    CGFloat ky = [gestureRecognizer locationInView:self].y;
    BOOL xB = (kx > self.frame.size.width - xx) || (kx < xx);
    BOOL yB = (ky > self.frame.size.height - yy) || (ky < yy);
    if (xB || yB) {
        return true;
    }
    return false;
}

- (IBAction)ibaHiddenView:(id)sender {
    [self removeFromSuperview];
}

@end

@interface CameraCollView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ibCollectionViewHeightConstraint;
@end

@implementation CameraCollView

- (void)awakeFromNib
{
    [super awakeFromNib];
    CameraModel *item = [CameraModel new];
    item.image = [UIImage imageNamed:@"camera"];
    item.hideDel = YES;
    self.imgArr = [NSMutableArray arrayWithObjects:item, nil];
    
    //圆角
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

#pragma mark Data
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imgArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CameraCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CameraCell" forIndexPath:indexPath];
    cell.model = self.imgArr[indexPath.row];
    __weak typeof(self) weakSelf = self;
    cell.DeleteCellBlock = ^(CameraModel *model) {
        [weakSelf.imgArr removeObject:model];
        [weakSelf reloadCell];
    };
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.imgArr.count == 6) {
        NSLog(@"仅支持采集5张图片");
        return;
    }
    //载入数据，如图片等
    CameraModel *item = [CameraModel new];
    item.image = [UIImage imageNamed:@"example"];
    if ((indexPath.row == self.imgArr.count - 1)) {
        //TODO:拍照功能
        [self.imgArr insertObject:item atIndex:self.imgArr.count - 1];
    }else{
        //TODO:预览图片
        self.imgArr[indexPath.row] = item;
    }
    [self reloadCell];
}

-(void)reloadCell
{
    [self.collectionView reloadData];
    CGFloat height = self.collectionView.collectionViewLayout.collectionViewContentSize.height;
    self.ibCollectionViewHeightConstraint.constant = height;
}
#pragma mark getter/setter
-(void)setImgArr:(NSMutableArray *)imgArr
{
    _imgArr = imgArr;
    [self reloadCell];
}

@end
