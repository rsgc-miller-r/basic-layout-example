//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// First, we will define a custom view controller named ViewController that
// is a sub-class of UIViewController
class ViewController : UIViewController {
    
    // Create a method that runs when the switch is toggled
    func bing() {
        print("Bing!")
    }
    
    
    // This method runs when the superview loads
    override func viewDidLoad() {
        
        // Sub-classes of UIViewController must invoke the superclass method viewDidLoad in their
        // own version of viewDidLoad()
        super.viewDidLoad()

        // Make the view's background be gray
        view.backgroundColor = .grayColor()
        
        /* 
         * Create the switch object
         */
        let mySwitch : UISwitch = UISwitch()
        
        // Required to autolayout this label
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        
        // Make the "bing" method fire when the switch is used
        mySwitch.addTarget(self, action: #selector(ViewController.bing), forControlEvents: UIControlEvents.TouchUpInside)

        // Add the switch to the superview
        view.addSubview(mySwitch)
        
        /*
         * Create and position the label
         */
        let myLabel = UILabel()
        
        // Set the label text and appearance
        myLabel.text = "Toggle me!"
        myLabel.font = UIFont.boldSystemFontOfSize(36)
        
        // Required to autolayout this label
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(myLabel)
        
        /*
         * Layout all the interface elements
         */

        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Create an empty list of constraints
        var allConstraints = [NSLayoutConstraint]()
        
        // Create a dictionary of views that will be used in the layout constraints defined below
        let viewsDictionary : [String : AnyObject] = ["switch": mySwitch,
                     "label": myLabel]
        
        // Define the vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label][switch]",
            options: [],
            metrics: nil,
            views: viewsDictionary)

        // Add the vertical constraints to the list of constraints
        allConstraints += verticalConstraints

        // Define the horizontal constraints
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[label][switch]",
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
