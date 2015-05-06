import UIKit

class ColorBoxesViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "ColorBoxesViewController", bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Actions
    
    @IBAction func buttonAction(sender: UIButton) {
        let newVC = FavoriteColorViewController()
        newVC.color = sender.backgroundColor
        newVC.delegate = self
        
        // modalPresentationStyle
        //newVC.modalPresentationStyle = .FullScreen // Default
        //newVC.modalPresentationStyle = .PageSheet
        //newVC.modalPresentationStyle = .FormSheet
        // Note: All these are iPad Only -- for iPhone it's always full screen
        
        // modalTransitionStyle
        //newVC.modalTransitionStyle = .CoverVertical
        //newVC.modalTransitionStyle = .FlipHorizontal
        //newVC.modalTransitionStyle = .CrossDissolve
        //newVC.modalTransitionStyle = .PartialCurl // Very broken, don't use in production
        
        presentViewController(newVC, animated: true, completion: {
            println("presentation complete!")
        })
    }
    
}

extension ColorBoxesViewController: FavoriteColorViewControllerDelegate {
    func closeRequestedFromFavoriteColorViewController(favoriteColorViewController: FavoriteColorViewController) {
        self.dismissViewControllerAnimated(true, completion: {
            println("dismissal complete!")
        })
    }
}
