#import "ColorBoxesViewController.h"
#import "FavoriteColorViewController.h"

@interface ColorBoxesViewController () <FavoriteColorViewControllerDelegate>
@end

@implementation ColorBoxesViewController

- (IBAction)buttAction:(UIButton *)sender
{
    FavoriteColorViewController *favColorVC = [[FavoriteColorViewController alloc] init];
    favColorVC.color = sender.backgroundColor;
    favColorVC.delegate = self;

    // modalPresentationStyle
    favColorVC.modalPresentationStyle = UIModalPresentationFullScreen; // Default
    //favColorVC.modalPresentationStyle = UIModalPresentationPageSheet;
    //favColorVC.modalPresentationStyle = UIModalPresentationFormSheet;
    // Note: All these are iPad Only -- for iPhone it's always full screen

    // modalTransitionStyle
    //favColorVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //favColorVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //favColorVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //favColorVC.modalTransitionStyle = UIModalTransitionStylePartialCurl; // Very broken, don't use in production

    [self presentViewController:favColorVC animated:YES completion:^{
        NSLog(@"presentation complete!");
    }];
}

#pragma - FavoriteColorViewControllerDelegate

- (void)closeRequestedFromFavoriteColorViewController:(FavoriteColorViewController *)vc;
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
