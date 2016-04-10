//
//  LoginViewController.swift
//  CarouselDemo
//
//  Created by Hollins, Richie on 4/7/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var loginText: UIImageView!
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
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
    
    // the main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        // set initial transform values to 20% of original size
        let transform = CGAffineTransformMakeScale(0.02, 0.02)
        //Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        loginText.transform = transform
        // also set the alpha properties
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
        loginText.alpha = 0
    }
    
    // the main view appeared!
    override func viewDidAppear(animated: Bool) {
        // animate it over .3 sec
        UIView.animateWithDuration(0.3) { () -> Void in
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            self.loginText.transform = CGAffineTransformIdentity
            
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
            self.loginText.alpha = 1
        }
    }
    
    @IBAction func didTapSignInButton(sender: AnyObject) {
        spinner.startAnimating()
        delay(2) { () -> () in
            if self.emailInput.text!.isEmpty || self.passwordInput.text!.isEmpty {
                self.spinner.stopAnimating()
                self.presentErrorAlert()
            } else if self.emailInput.text! == "richie@gmail.com" && self.passwordInput.text! == "password" {
                self.spinner.stopAnimating()
                self.performSegueWithIdentifier("loginToTutorial", sender: self)
            } else {
                self.spinner.stopAnimating()
                self.presentOtherErrorAlert()
            }
        }
    }
    
    func presentErrorAlert() {
        let alertController = UIAlertController(title: "Something's Missing...", message: "Enter an email address and password.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: { (action) -> Void in
            // do stuff
        })
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: { () -> Void in
            // do stuff
        })
    }
    
    func presentOtherErrorAlert() {
        let alertController = UIAlertController(title: "Something's Funky", message: "Email address and password don't match.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: { (action) -> Void in
            // do stuff
        })
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: { () -> Void in
            // do stuff
        })
    }

    @IBAction func didTapBackArrow(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
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
