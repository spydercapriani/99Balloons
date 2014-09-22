//
//  ViewController.swift
//  99Balloons
//
//  Created by Daniel Gilbert on 9/22/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblBalloonNumber: UILabel!
    @IBOutlet weak var balloonImageView: UIImageView!
    
    var myBalloons:[Balloon] = []
    var imageArray:[UIImage] = []
    var currentIndex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageArray += [UIImage(named:"RedBalloon1.jpg"),
                    UIImage(named:"RedBalloon2.jpg"),
                    UIImage(named:"RedBalloon3.jpg"),
                    UIImage(named:"RedBalloon4.jpg")]
        
        let mainPage = Balloon(number: 0, image: UIImage(named: "BerlinTvTower.jpg"))
        myBalloons.append(mainPage)
        lblBalloonNumber.text = "\(mainPage.number) Balloons"
        balloonImageView.image = mainPage.image
        
        createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnBarNextPressed(sender: UIBarButtonItem) {
        if currentIndex == 99 {
            currentIndex = 0
        }else {
            currentIndex++
        }
        var balloon = myBalloons[currentIndex]
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.lblBalloonNumber.text = "\(balloon.number) Balloons"
                self.balloonImageView.image = balloon.image
            }, completion: { (finished: Bool) -> () in
                
        })
    }
    
    func createBalloons() {
        var lastPictureIndex:Int = 0
        for var balloonCount = 1; balloonCount <= 99; balloonCount++ {
            var randomPictureIndex = Int(arc4random_uniform(UInt32(imageArray.count)))
            while randomPictureIndex == lastPictureIndex { // ensure each balloon image is different from the last
                randomPictureIndex = Int(arc4random_uniform(UInt32(imageArray.count)))
            }
            var aBalloon:Balloon = Balloon(number: balloonCount, image: imageArray[randomPictureIndex])
            lastPictureIndex = randomPictureIndex
            myBalloons.append(aBalloon)
        }
    }
}

