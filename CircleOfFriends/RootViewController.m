//
//  RootViewController.m
//  CircleOfFriends
//
//  Created by Zlien on 8/24/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "RootViewController.h"
#import "CircleOfFriendsViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
#import "pop.h"
#import "VBFDoubleSegment.h"
#import "VBFPopFlatButton.h"
#import "LoadContent.h"
#import "UIColor+FlatColors.h"


@interface RootViewController () {
  UIView *backgroundView;
  UIView *yellowView;
  UIView *greenView;
  UIView *blueView;
  UIView *blackView;
  UIView *grayView;
  UIView *redView;
  UIView *orangeView;
  UIView *purpleView;
  UIView *cyanView;
    UISearchBar * searchBar;
    UISwitch * switchBar;

}
@property(nonatomic, strong) VBFPopFlatButton *flatRoundedButton;
@property(nonatomic, strong) VBFPopFlatButton *flatPlainButton;
@end
@implementation RootViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self firstload];
  }
-(void) firstload{
    backgroundView                 = [UIView new];
    backgroundView.backgroundColor = [UIColor redColor];
    [self.view addSubview:backgroundView];
    
    searchBar = [UISearchBar new];
    searchBar.backgroundColor = [UIColor greenColor];
    searchBar.placeholder = @"please";

    [self.view addSubview:searchBar];
    

    
    switchBar =[UISwitch new];
    [self.view addSubview:switchBar];



    
    greenView                      = [UIView new];
    greenView.backgroundColor      = [UIColor greenColor];
    [self.view addSubview:greenView];
    

    
    cyanView = [UIView new];
    cyanView.backgroundColor = [UIColor grayColor];
    CALayer *calayer2 = [cyanView layer];
    calayer2.cornerRadius = 10;
    calayer2.masksToBounds = YES;
    
    [self.view addSubview:cyanView];
    
    UILabel *cyanViewText =
    [[UILabel alloc] initWithFrame:CGRectMake(35, 10, 20, 20)];
    
    [cyanViewText setTextColor:[UIColor whiteColor]];
    [cyanViewText setText:@"赞"];
    [cyanViewText setFont:[UIFont fontWithName:@"Trebuchet MS" size:14.0f]];
    [cyanView addSubview:cyanViewText];
    
    UIImageView *cyanViewImage =
    [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 20, 20)];
    [cyanViewImage setImage:[UIImage imageNamed:@"like"]];
    [cyanView addSubview:cyanViewImage];
    
    yellowView = [UIView new];
    yellowView.backgroundColor = [UIColor grayColor];
    CALayer *calayer = [yellowView layer];
    calayer.cornerRadius = 10;
    calayer.masksToBounds = YES;
    [self.view addSubview:yellowView];
    
    blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    blackView = [UIView new];
    
    blackView.backgroundColor = [UIColor yellowColor];
    CALayer *calayer1 = [blackView layer];
    calayer1.cornerRadius = 10;
    calayer1.masksToBounds = YES;
    calayer1.borderWidth = 3;
    calayer1.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview:blackView];
    
    grayView = [UIView new];
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
    
    redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    orangeView = [UIView new];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    
    purpleView = [UIView new];
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:purpleView];
    

    
    [yellowView addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(demoAnimate:)]];
    
    [cyanView addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(demoAnimate1:)]];

    
    
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(yellowView).offset(-50);
        make.centerX.equalTo(yellowView);
        make.size.width.mas_equalTo(CGSizeMake(200, 40));
    }];
    
    [switchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(yellowView.mas_top);
    }];
    
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.center.mas_equalTo(self.view);
        
    }];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(yellowView);
        // 添加大小约束（make就是要添加约束的控件view）
        // 添加居中约束（居中方式与self相同）
        make.left.mas_equalTo(greenView);
        make.bottom.mas_equalTo(greenView.mas_top).offset(-8);
    }];
    
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.mas_equalTo(blackView);
        make.left.mas_equalTo(yellowView);
        make.centerX.mas_equalTo(self.view);
    }];
    
    [redView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.mas_equalTo(blackView);
        make.right.mas_equalTo(blueView);
    }];
    
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.left.mas_equalTo(greenView);
        make.top.mas_equalTo(greenView.mas_bottom).offset(8);
        
    }];
    
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.mas_equalTo(yellowView);
        make.centerY.mas_equalTo(orangeView);
    }];
    
    [cyanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(blueView);
        make.center.mas_equalTo(yellowView);
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];

}
- (void)demoAnimate:(UITapGestureRecognizer *)tap {

  POPBasicAnimation *buttonAnimation =
      [POPBasicAnimation animationWithPropertyNamed:kPOPLayerSize];

  buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(50, 50)];

  [yellowView.layer pop_addAnimation:buttonAnimation forKey:@"pop"];

  POPSpringAnimation *popOutAnimation =
      [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];

  popOutAnimation.toValue =
      [NSValue valueWithCGRect:CGRectMake(yellowView.center.x - 110, yellowView.center.y - 20, 80, 40)];

  popOutAnimation.springBounciness = 10.0;
  popOutAnimation.springSpeed = 20.0;

  [cyanView.layer pop_addAnimation:popOutAnimation forKey:@"slide"];
}
- (void)demoAnimate1:(UITapGestureRecognizer *)tap {

  POPSpringAnimation *buttonAnimation =
      [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];

  buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(60, 60)];

  buttonAnimation.springBounciness = 10.0;
  buttonAnimation.springSpeed = 20.0;

  [yellowView.layer pop_addAnimation:buttonAnimation forKey:@"pop"];

  POPBasicAnimation *popOutAnimation =
      [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];

  popOutAnimation.toValue =
      [NSValue valueWithCGRect:CGRectMake(yellowView.center.x - 30,
                                          yellowView.center.y - 30, 60, 60)];

  [cyanView.layer pop_addAnimation:popOutAnimation forKey:@"slide"];
}

- (IBAction)goToCircleOfFriends:(id)sender {
  CircleOfFriendsViewController *viewController =
      [[CircleOfFriendsViewController alloc] init];
  [self.navigationController pushViewController:viewController animated:YES];
  viewController.title = @"朋友圈";
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little
 preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end
