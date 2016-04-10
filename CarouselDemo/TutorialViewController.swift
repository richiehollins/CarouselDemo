//
//  TutorialViewController.swift
//  CarouselDemo
//
//  Created by Hollins, Richie on 4/9/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var wideScrollView: UIScrollView!
    @IBOutlet weak var takeSpinButton: UIImageView!
    @IBOutlet weak var paginationDots: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wideScrollView.contentSize = CGSize(width:1280, height:568)
        wideScrollView.delegate = self
        paginationDots.numberOfPages = 4
        
        takeSpinButton.alpha = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page : Int = Int(round(wideScrollView.contentOffset.x / 320))
        paginationDots.currentPage = page
        
        if page == 3 {
            paginationDots.hidden = true
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.takeSpinButton.alpha = 1
            })
        } else {
            paginationDots.hidden = false
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.takeSpinButton.alpha = 0
            })
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
