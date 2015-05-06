import UIKit

protocol FavoriteColorViewControllerDelegate {
    func closeRequestedFromFavoriteColorViewController(favoriteColorViewController: FavoriteColorViewController)
}

class FavoriteColorViewController: UIViewController {
    
    @IBOutlet weak var colorDescriptionLabel: UILabel!
    @IBOutlet weak var colorPreviewView: UIView!
    
    var color: UIColor?
    var delegate: FavoriteColorViewControllerDelegate?
    
    // MARK: UIViewController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "FavoriteColorViewController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    // MARK: Actions
    
    @IBAction func closeButtonAction(sender: AnyObject) {
        
        // Tell the delegate a close was requested
        self.delegate?.closeRequestedFromFavoriteColorViewController(self)
        
        // If we didn't have a delegate this could be a way to tell the thing presenting us
        // to dismiss us. I don't like this pattern since it requires a lot of assumptions
        // about how things are architected. The delegate pattern here helps express intention 
        // without assuming implementation details.
//        presentingViewController?.dismissViewControllerAnimated(true, completion:{
//            println("dismissal complete!")
//        })
    }
    
    @IBAction func cameraButtonAction(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .Popover
        imagePicker.popoverPresentationController?.barButtonItem = sender as! UIBarButtonItem
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: Private
    
    func updateUI() {
        colorDescriptionLabel.text = color?.description
        colorPreviewView.backgroundColor = color
    }
    
}

extension FavoriteColorViewController: UIImagePickerControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        // Normally we'd inspect the info dictionary and pull out and use the photo the user took 
        // or chose but are skipping that for demo simplicity
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension FavoriteColorViewController: UINavigationControllerDelegate {
    // While I have to declare I honor the UINavigationCOntrollerDelegate protocol, the protocol itself has no required methods.
}
