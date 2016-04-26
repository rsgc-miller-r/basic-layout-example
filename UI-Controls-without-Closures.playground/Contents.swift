//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// First, we will define a custom view controller named ViewController that
// is a sub-class of UIViewController
class ViewController : UIViewController {

    
    
    // This method runs when the superview loads
    override func viewDidLoad() {
        
        // Sub-classes of UIViewController must invoke the superclass method viewDidLoad in their
        // own version of viewDidLoad()
        super.viewDidLoad()

        // Make the view's background be gray
        view.backgroundColor = .grayColor()
        
   
        
        /*
         * Create and position the label
         */
        let firstTitle = UILabel()
        let amount = UILabel()
        
        
        // Set the label text and appearance
        firstTitle.text = "Tip Calculator"
        firstTitle.font = UIFont.boldSystemFontOfSize(36)
        amount.text = "Ammount"
        amount.font = UIFont.boldSystemFontOfSize(24)
        
        // Required to autolayout this label
        firstTitle.translatesAutoresizingMaskIntoConstraints = false
        amount.translatesAutoresizingMaskIntoConstraints = false
        // Add the label to the superview
        view.addSubview(firstTitle)
        view.addSubview(amount)
        
        /*
         * Layout all the interface elements
         */

        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Create an empty list of constraints
        var allConstraints = [NSLayoutConstraint]()
        
        // Create a dictionary of views that will be used in the layout constraints defined below
        let viewsDictionary : [String : AnyObject] = ["label": firstTitle, "label2": amount]
        
        // Define the vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label][label2]",
            options: [],
            metrics: nil,
            views: viewsDictionary)

        // Add the vertical constraints to the list of constraints
        allConstraints += verticalConstraints

        // Define the horizontal constraints
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[label]",
            options: [],
            metrics: nil,
            views: viewsDictionary)

        // Add the vertical constraints to the list of constraints
        allConstraints += horizontalConstraints
        
        // Activate all defined constraints
        NSLayoutConstraint.activateConstraints(allConstraints)
        
    }
}

// Embed the view controller in the live view for the current playground page
XCPlaygroundPage.currentPage.liveView = ViewController()
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
