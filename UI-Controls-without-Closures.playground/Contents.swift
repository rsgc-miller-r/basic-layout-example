//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// An extension is a Swift language construct that, as the name implies,
// allows you to extend, or add functionality to, an existing type or class.
// In this case, we are adding functionality to the UIView class.
//
// Note that UIView class is a super-class for all the UI elements we are using
// here (UILabel, UITextField, UIButton).
// So if we write an extension for UIView, all the sub-classes of UIView have this
// new functionality as well.
extension UIView {
    
    // A convenience function that saves us directly invoking the rather verbose
    // NSLayoutConstraint initializer on each and every object in the interface.
    func centerHorizontallyInSuperview(){
        let c: NSLayoutConstraint = NSLayoutConstraint(item: self,
                                                    attribute: NSLayoutAttribute.CenterX,
                                                    relatedBy: NSLayoutRelation.Equal,
                                                    toItem: self.superview,
                                                    attribute: NSLayoutAttribute.CenterX,
                                                    multiplier:1,
                                                    constant: 0)
        
        // Add this constraint to the superview
        self.superview?.addConstraint(c)
        
    }
    
}

// First, we will define a custom view controller named ViewController that
// is a sub-class of UIViewController
class ViewController : UIViewController {
    
    // Make these views global to the ViewController class, so it can be used in the determineTip method below
    let amountGiven = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
    let tipGiven = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    let payThisMuch = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 300))
    
    // This method determines the actual tip
    func determineTip() {
        
        // Error message
        var error : String = ""
        
        // Cleaned up values for determining tip
        var amountAsDouble : Double = 0
        var tipAsDouble : Double = 0
        
        // Verify that the method was activated
        print("touched the button...")
        
        // Unwrap the optional (a value might not have been given in the amount text field)
        if let amountProvided = amountGiven.text {
            
            print("something was provided in the amount text field...")

            // We at least have a string for the dollar amount, strip out the $ sign if it is present
            var amountProvidedClean : String = ""
            for character in amountProvided.characters {
                if character != "$" {
                    amountProvidedClean += String(character)
                }
            }
            
            // We at least have a string, now try to make the value be a double
            if let amount = Double(amountProvidedClean) {
                print("...and the value is \(amount)")
                amountAsDouble = amount
            } else {
                error += "Please provide a valid\ndollar amount, e.g.: 27.50\n\n"
            }
            
        }
        
        // Unwrap the optional (a value might not have been given in the amount text field)
        if let tipProvided = tipGiven.text {
            
            print("something was provided in the tip text field...")
            
            // We at least have a string for the tip %, strip out the % sign if it is present
            var tipPercentageClean : String = ""
            for character in tipProvided.characters {
                if character != "%" {
                    tipPercentageClean += String(character)
                }
            }
            
            // Try to convert the value to a Double
            if let tipPercent = Double(tipPercentageClean) {
                print("...and the percentage is \(tipPercent)")
                tipAsDouble = tipPercent
            } else {
                error += "Please provide a valid\ntip percentage, eg: 20%"
            }
            
        }
        
        // Calculate the values if there were no errors
        if error == "" {
            // Actually calculate the value
            let total : Double = amountAsDouble * (1 + tipAsDouble / 100)
            payThisMuch.text = String.localizedStringWithFormat("Leave\n$%.2f", total)
        } else {
            // Report the error
            payThisMuch.text = error
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
        amountGiven.placeholder = "$100.00"
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
         * Create label for the amount that should be paid
         */
        // Set the label text and appearance
        payThisMuch.text = ""
        payThisMuch.font = UIFont.systemFontOfSize(24)
        payThisMuch.textColor = UIColor.blueColor()
        payThisMuch.numberOfLines = 0   // makes number of lines dynamic
                                        // e.g.: multiple lines will show up
        
        // Required to autolayout this label.
        payThisMuch.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the tip label into the superview
        view.addSubview(payThisMuch)
        
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
            "button": calculate,
            "label4": payThisMuch]
        
        // Define the vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[label1]-20-[label2][inputField1]-15-[label3][inputField2]-15-[button]-20-[label4]",
            options: [],
            metrics: nil,
            views: viewsDictionary)
        
        // Add the vertical constraints to the list of constraints
        allConstraints += verticalConstraints
        
        // Centre all views in the superview
        title.centerHorizontallyInSuperview()
        amount.centerHorizontallyInSuperview()
        amountGiven.centerHorizontallyInSuperview()
        tip.centerHorizontallyInSuperview()
        tipGiven.centerHorizontallyInSuperview()
        calculate.centerHorizontallyInSuperview()
        payThisMuch.centerHorizontallyInSuperview()
        
        // Activate all defined constraints
        NSLayoutConstraint.activateConstraints(allConstraints)

        
    }
}

// Embed the view controller in the live view for the current playground page
XCPlaygroundPage.currentPage.liveView = ViewController()
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
