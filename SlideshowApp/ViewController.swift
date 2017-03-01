//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Iwazaki on 2017/02/23.
//  Copyright © 2017年 Iwazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var maeButton: UIButton!
    
    @IBOutlet weak var tugiButton: UIButton!
    
    var timer: Timer!
    var imageNo = 0
    
    
    @IBAction func maeButton(_ sender: Any){
            imageNo -= 1
            displayImage()
    }
    
    @IBAction func tugiButton(_ sender: Any) {
        imageNo += 1
        displayImage()
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
    }

    @IBAction func playButton(_ sender: Any) {
        // タイマーを設定
        
        if self.timer == nil {
            
          (sender as AnyObject).setTitle("停止", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
            maeButton.isEnabled = false
            tugiButton.isEnabled = false            
        }else{
            
            (sender as AnyObject).setTitle("再生", for: .normal)
            self.timer.invalidate()
            self.timer = nil
            maeButton.isEnabled = true
            tugiButton.isEnabled = true
        }
        
    }
    
    
    func displayImage() {
        
        let imageNameArray = [
        "img1.jpg", "img2.jpg", "img3.jpg",
        ]
        if imageNo < 0 {
            imageNo = 2
        }
        if imageNo > 2 {
            imageNo = 0
        }
        let name = imageNameArray[imageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "img1.jpg")
        imageView.image = image
    }
    
    /// Segueで遷移する際のメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let kakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
        kakudaiViewController.image = imageView.image!

        if self.timer !== nil {
            self.timer.invalidate()
        }
        
    }
    
    
    /// Timerによって、一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        imageNo += 1
        displayImage()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
