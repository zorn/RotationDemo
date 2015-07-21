#import "FavoriteColorViewController.h"

@interface FavoriteColorViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *colorDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *colorPreviewView;

@end

@implementation FavoriteColorViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(IBAction)closeButtonAction:(id)sender
{
    // Tell the delegate a close was requested
    if (self.delegate) {
        [self.delegate closeRequestedFromFavoriteColorViewController:self];
    }

    // If we didn't have a delegate this could be a way to tell the thing presenting us
    // to dismiss us. I don't like this pattern since it requires a lot of assumptions
    // about how things are architected. The delegate pattern here helps express intention
    // without assuming implementation details.
    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cameraButtonAction:(UIBarButtonItem *)sender
{
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    pickerVC.delegate = self;
    pickerVC.modalPresentationStyle = UIModalPresentationPopover;
    pickerVC.popoverPresentationController.barButtonItem = sender;
    [self presentViewController:pickerVC animated:YES completion:nil];
}

#pragma mark - Private

- (void)updateUI
{
    self.colorDescriptionLabel.text = self.color.description;
    self.colorPreviewView.backgroundColor = self.color;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Normally we'd inspect the info dictionary and pull out and use the photo the user took
    // or chose but are skipping that for demo simplicity
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
