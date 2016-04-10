//
//  CreateViewController.swift
//  CarouselDemo
//
//  Created by Hollins, Richie on 4/9/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var formParentView: UIView!
    @IBOutlet weak var createNav: UIImageView!
    
    @IBOutlet weak var firstNameIput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var checkbox: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -95
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }

    @IBAction func didTapBackArrow(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func didTapCheckbox(sender: AnyObject) {
        checkbox.selected = !checkbox.selected
    }
    
    // the main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        // set initial transform values to 20% of original size
        let transform = CGAffineTransformMakeScale(0.02, 0.02)
        //Apply the transform properties of the views
        createNav.transform = transform
        formParentView.transform = transform
        // also set the alpha properties
        createNav.alpha = 0
        formParentView.alpha = 0
    }
    
    // the main view appeared!
    override func viewDidAppear(animated: Bool) {
        // animate it over .3 sec
        UIView.animateWithDuration(0.3) { () -> Void in
            self.formParentView.transform = CGAffineTransformIdentity
            self.createNav.transform = CGAffineTransformIdentity
            
            self.formParentView.alpha = 1
            self.createNav.alpha = 1
        }
    }
    
    @IBAction func didTapCreateButton(sender: AnyObject) {
        spinner.startAnimating()
        delay(2) { () -> () in
            self.spinner.stopAnimating()
            self.performSegueWithIdentifier("createToTutorial", sender: self)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
