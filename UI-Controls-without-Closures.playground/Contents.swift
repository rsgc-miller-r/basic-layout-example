//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// First, we will define a custom view controller named ViewController that
// is a sub-class of UIViewController
class ViewController : UIViewController {
    
    // Make the text fields global to the ViewController class, so it can be used in the determineTip method below
    let amountGiven = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
    let tipGiven = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    
    // This method determines the actual tip
    func determineTip() {
        
        // Verify that the method was activated
        print("touched the button...")
        
        // Unwrap the optional (a value might not have been given in the text field)
        if let amountProvided = amountGiven.text {
            print("something was provided in the text field...")
            
            // Now try to make the value be a double
            if let amount = Double(amountProvided) {
                print("...and the value is \(amount)")
            }
            
        }
        
    }
    
    // This method runs when the superview loads
    override func viewDidLoad() {
        
        // Sub-classes of UIViewController must invoke the superclass method viewDidLoad in their
        // own version of viewDidLoad()
        super.viewDidLoad()

        // Make the view's background be gray
        view.backgroundColor = UIColor.lightGrayColor()
        
        /*
         * Create label that will be the title
         */
        let title = UILabel()
        
        // Set the label text and appearance
        title.text = "Tip Calculator"
        title.font = UIFont.boldSystemFontOfSize(36)
        
        // Required to autolayout this label
        title.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the superview
        view.addSubview(title)
        
        /*
         * Create label for the amount field
         */
        let amount = UILabel()
        
        // Set the label text and appearance
        amount.text = "Amount"
        amount.font = UIFont.systemFontOfSize(24)
        
        // Required to autolayout this label.
        amount.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the amount label into the superview
        view.addSubview(amount)

        /*
         * Set up text field for the amount
         */
        // Set the label text and appearance
        amountGiven.borderStyle = UITextBorderStyle.RoundedRect
        amountGiven.font = UIFont.systemFontOfSize(15)
        amountGiven.placeholder = "Enter an amount"
        amountGiven.backgroundColor = UIColor.whiteColor()
        amountGiven.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        
        // Required to autolayout this field
        amountGiven.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the amount text field into the superview
        view.addSubview(amountGiven)
        
        /*
         * Create label for the tip field
         */
        let tip = UILabel()
        
        // Set the label text and appearance
        tip.text = "Tip Percentage"
        tip.font = UIFont.systemFontOfSize(24)
        
        // Required to autolayout this label.
        tip.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the tip label into the superview
        view.addSubview(tip)
        
        /*
         * Set up text field for the tip percentage
         */
        // Set the label text and appearance
        tipGiven.borderStyle = UITextBorderStyle.RoundedRect
        tipGiven.font = UIFont.systemFontOfSize(15)
        tipGiven.placeholder = "15%"
        tipGiven.backgroundColor = UIColor.whiteColor()
        tipGiven.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        
        // Required to autolayout this field
        tipGiven.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the tip percentage text field into the superview
        view.addSubview(tipGiven)

        /*
         * Add a button
         */
        let calculate = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        
        // Make the button, when touched, run the calculate method
        calculate.addTarget(self, action: #selector(ViewController.determineTip), forControlEvents: UIControlEvents.TouchUpInside)
        
        // Set the button's title
        calculate.setTitle("Calculate", forState: UIControlState.Normal)
        
        // Required to auto layout this button
        calculate.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the button into the super view
        view.addSubview(calculate)
        
        /*
         * Layout all the interface elements
         */

        // This is required to lay out the interface elements
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Create an empty list of constraints
        var allConstraints = [NSLayoutConstraint]()
        
        // Create a dictionary of views that will be used in the layout constraints defined below
        let viewsDictionary : [String : AnyObject] = [
                     "label1": title,
                     "label2": amount,
                     "inputField1": amountGiven,
                     "label3": tip,
                     "inputField2": tipGiven,
                     "button": calculate]
        
        // Define the vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label1][label2][inputField1][label3][inputField2][button]",
            options: [],
            metrics: nil,
            views: viewsDictionary)

        // Add the vertical constraints to the list of constraints
        allConstraints += verticalConstraints

        // Define the horizontal constraints
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[label1]",
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
