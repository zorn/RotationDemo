#import <UIKit/UIKit.h>

@protocol FavoriteColorViewControllerDelegate;

@interface FavoriteColorViewController : UIViewController

@property (nonatomic, copy) UIColor *color;
@property (nonatomic, weak) NSObject<FavoriteColorViewControllerDelegate> *delegate;

@end

@protocol FavoriteColorViewControllerDelegate <NSObject>
- (void)closeRequestedFromFavoriteColorViewController:(FavoriteColorViewController *)vc;
@end
