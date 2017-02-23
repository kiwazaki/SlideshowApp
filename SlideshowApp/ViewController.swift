//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Iwazaki on 2017/02/23.
//  Copyright © 2017年 Iwazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func maeButton(_ sender: Any) {
        imageNo -= 1
        displayImage()
    }
    
    @IBAction func tugiButton(_ sender: Any) {
        imageNo += 1
        displayImage()
    }
    

    @IBAction func playButton(_ sender: Any) {
        // タイマーを設定
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
    }
    
    
    var timer: Timer?
    
    var imageNo = 0
    
    func displayImage() {
        
        let imageNameArray = [
        "img1", "img2", "img3", "img4", "img5",
        ]
        if imageNo < 0 {
            imageNo = 4
        }
        if imageNo > 4 {
            imageNo = 0
        }
        let name = imageNameArray[imageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "img1")
        imageView.image = image
    }
    
    /// Timerによって、一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        print("onTimer")
        
        imageNo += 1
        displayImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
