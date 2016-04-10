//
//  IntroViewController.swift
//  CarouselDemo
//
//  Created by Hollins, Richie on 4/7/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = introImage.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // called as the user scrolls
        
        
        // big tile 1
        let tile1Offset = Float(scrollView.contentOffset.y)
        
        let tile1x = convertValue(CGFloat(tile1Offset), r1Min: 0, r1Max: 568, r2Min: -50, r2Max: 0)
        let tile1y = convertValue(CGFloat(tile1Offset), r1Min: 0, r1Max: 568, r2Min: -320, r2Max: 0)
        
        let tile1Rotation = convertValue(CGFloat(tile1Offset), r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1.transform = CGAffineTransformMakeTranslation(CGFloat(tile1x),CGFloat(tile1y))
        tile1.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(tile1Rotation) * M_PI / 180))
        
        
        // tile 2
        let tile2Offset = Float(scrollView.contentOffset.y)
        
        let tile2x = convertValue(CGFloat(tile2Offset), r1Min: 0, r1Max: 568, r2Min: -40, r2Max: 0)
        let tile2y = convertValue(CGFloat(tile2Offset), r1Min: 0, r1Max: 568, r2Min: -330, r2Max: 0)
        
        let tile2Scale = convertValue(CGFloat(tile2Offset), r1Min: 0, r1Max: 568, r2Min: 2, r2Max: 1)
        let tile2Rotation = convertValue(CGFloat(tile2Offset), r1Min: 0, r1Max: 568, r2Min: 4, r2Max: 0)
        
        tile2.transform = CGAffineTransformMakeTranslation(CGFloat(tile2x),CGFloat(tile2y))
        tile2.transform = CGAffineTransformRotate(tile2.transform, CGFloat(Double(tile2Rotation) * M_PI / 180))
        tile2.transform = CGAffineTransformScale(tile2.transform, CGFloat(tile2Scale), CGFloat(tile2Scale))
        
        
        // tile 3
        let tile3Offset = Float(scrollView.contentOffset.y)
        
        let tile3x = convertValue(CGFloat(tile3Offset), r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        let tile3y = convertValue(CGFloat(tile3Offset), r1Min: 0, r1Max: 568, r2Min: -340, r2Max: 0)
        
        let tile3Scale = convertValue(CGFloat(tile3Offset), r1Min: 0, r1Max: 568, r2Min: 1.8, r2Max: 1)
        let tile3Rotation = convertValue(CGFloat(tile3Offset), r1Min: 0, r1Max: 568, r2Min: 8, r2Max: 0)
        
        tile3.transform = CGAffineTransformMakeTranslation(CGFloat(tile3x),CGFloat(tile3y))
        tile3.transform = CGAffineTransformRotate(tile3.transform, CGFloat(Double(tile3Rotation) * M_PI / 180))
        tile3.transform = CGAffineTransformScale(tile3.transform, CGFloat(tile3Scale), CGFloat(tile3Scale))
        
        
        // tile 4
        let tile4Offset = Float(scrollView.contentOffset.y)
        
        let tile4x = convertValue(CGFloat(tile4Offset), r1Min: 0, r1Max: 568, r2Min: -50, r2Max: 0)
        let tile4y = convertValue(CGFloat(tile4Offset), r1Min: 0, r1Max: 568, r2Min: -480, r2Max: 0)
        
        let tile4Scale = convertValue(CGFloat(tile4Offset), r1Min: 0, r1Max: 568, r2Min: 2, r2Max: 1)
        let tile4Rotation = convertValue(CGFloat(tile4Offset), r1Min: 0, r1Max: 568, r2Min: -6, r2Max: 0)
        
        tile4.transform = CGAffineTransformMakeTranslation(CGFloat(tile4x),CGFloat(tile4y))
        tile4.transform = CGAffineTransformRotate(tile4.transform, CGFloat(Double(tile4Rotation) * M_PI / 180))
        tile4.transform = CGAffineTransformScale(tile4.transform, CGFloat(tile4Scale), CGFloat(tile4Scale))
        
        
        // tile 5
        let tile5Offset = Float(scrollView.contentOffset.y)
        
        let tile5x = convertValue(CGFloat(tile5Offset), r1Min: 0, r1Max: 568, r2Min: 0, r2Max: 0)
        let tile5y = convertValue(CGFloat(tile5Offset), r1Min: 0, r1Max: 568, r2Min: -440, r2Max: 0)
        
        let tile5Scale = convertValue(CGFloat(tile5Offset), r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        let tile5Rotation = convertValue(CGFloat(tile5Offset), r1Min: 0, r1Max: 568, r2Min: -12, r2Max: 0)
        
        tile5.transform = CGAffineTransformMakeTranslation(CGFloat(tile5x),CGFloat(tile5y))
        tile5.transform = CGAffineTransformRotate(tile5.transform, CGFloat(Double(tile5Rotation) * M_PI / 180))
        tile5.transform = CGAffineTransformScale(tile5.transform, CGFloat(tile5Scale), CGFloat(tile5Scale))
        
        
        // tile 6
        let tile6Offset = Float(scrollView.contentOffset.y)
        
        let tile6x = convertValue(CGFloat(tile6Offset), r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        let tile6y = convertValue(CGFloat(tile6Offset), r1Min: 0, r1Max: 568, r2Min: -490, r2Max: 0)
        
        let tile6Scale = convertValue(CGFloat(tile6Offset), r1Min: 0, r1Max: 568, r2Min: 2, r2Max: 1)
        let tile6Rotation = convertValue(CGFloat(tile6Offset), r1Min: 0, r1Max: 568, r2Min: 7, r2Max: 0)
        
        tile6.transform = CGAffineTransformMakeTranslation(CGFloat(tile6x),CGFloat(tile6y))
        tile6.transform = CGAffineTransformRotate(tile6.transform, CGFloat(Double(tile6Rotation) * M_PI / 180))
        tile6.transform = CGAffineTransformScale(tile6.transform, CGFloat(tile6Scale), CGFloat(tile6Scale))

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    /*  resets scroll view to top before page appears.
        override func viewWillAppear(animated: Bool) {
        self.scrollView.contentOffset = CGPointZero
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
