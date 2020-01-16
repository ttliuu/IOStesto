//
//  ViewController.swift
//  Testo12051353
//
//  Created by Tianwei Liu on 12/5/19.
//  Copyright © 2019 Tianwei Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    
    //initialize all settings and link all outlets
    
    
    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var randButton: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var textDesc: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var imageViewWidth: NSLayoutConstraint!
    @IBOutlet var imageViewHeight: NSLayoutConstraint!
    
    
    //creat index variable and link picture name to a new ui picture, store them in 
    
    
    var i = [1,2,3,4,5]
    var index = -1
    var stringArr = ["Trinity-Pawling School","Cluett Hall","School Crest","Lion","Dining Hall"]
    var nameArr = ["CampusPhoto.jpg","Cluett_Hall.jpg","Trinity-Pawling_School_Crest.jpg","Trinity-Pawling-Lion.jpg.png","TuitionFA_TrinityPawlingSchool.jpg"]
    var time = Timer()
    var isLooping = -1
    var newImageView = UIImageView()
    @IBOutlet weak var scrollView: UIScrollView!
    var imagesArr = [UIImage(named: "CampusPhoto.jpg"), UIImage(named: "Cluett_Hall.jpg"),UIImage(named: "Trinity-Pawling_School_Crest.jpg"),UIImage(named: "Trinity-Pawling-Lion.jpg.png"),UIImage(named: "TuitionFA_TrinityPawlingSchool.jpg")]
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    @IBAction func loop(_ sender: UIButton) {
        isLooping = isLooping + 1
        if(isLooping == 0){
        time = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(Action),userInfo: nil,repeats: true)
        }
        if(isLooping == 1){
            time.invalidate()
            isLooping = -1
        }
    }
    
    @objc func Action(_ sender: Any){
        if(index == 4){
            index = -1
        }
        index = index + 1
        
        
        if (i[index] == 0){
            if i != [0,0,0,0,0]{
            onPress(buttonA)
            }
            else
            {
                textDesc.text = "You've successfully broke the app"
            }
        }
        if(i[index] == 1){
            imageView.image = imagesArr[0]
            newImageView.image = imagesArr[0]
            textDesc.text = stringArr[0]
        }
        if(i[index] == 2){
            imageView.image = imagesArr[1]
            newImageView.image = imagesArr[1]
            textDesc.text = stringArr[1]
        }
        if(i[index] == 3){
            imageView.image = imagesArr[2]
            newImageView.image = imagesArr[2]
            textDesc.text = stringArr[2]
        }
        if(i[index] == 4){
            imageView.image = imagesArr[3]
            newImageView.image = imagesArr[3]
            textDesc.text = stringArr[3]
        }
        if(i[index] == 5){
            imageView.image = imagesArr[4]
            newImageView.image = imagesArr[4]
            textDesc.text = stringArr[4]
        }
        
    }
    
    @IBAction func onPress(_ sender: UIButton) {
        if(index == 4){
            index = -1
        }
        index = index + 1
        
        
        if (i[index] == 0){
            if i != [0,0,0,0,0]{
            onPress(buttonA)
            }
            else
            {
                textDesc.text = "You've successfully broke the app"
            }
        }
        if(i[index] == 1){
            imageView.image = imagesArr[0]
            textDesc.text = stringArr[0]
        }
        if(i[index] == 2){
            imageView.image = imagesArr[1]
            textDesc.text = stringArr[1]
        }
        if(i[index] == 3){
            imageView.image = imagesArr[2]
            textDesc.text = stringArr[2]
        }
        if(i[index] == 4){
            imageView.image = imagesArr[3]
            textDesc.text = stringArr[3]
        }
        if(i[index] == 5){
            imageView.image = imagesArr[4]
            textDesc.text = stringArr[4]
        }
        
        
    }
    
    @IBAction func onHide(_ sender: UIButton) {
        
        
        print(i)
        print(index)
        i[index] = 0
        
        
        
    }
    @IBAction func unhidePress	(_ sender: UIButton) {
        i = [1,2,3,4,5]
        
        
        
        
    }
    @IBAction func randPress(_ sender: UIButton) {
        let j = Int.random(in: 0...4)
        index = j
        if(i[j] == 0){
            randPress(randButton)
        }
        
        if(i[j] == 1){
            imageView.image = imagesArr[0]
            textDesc.text = stringArr[0]
        }
        if(i[j] == 2){
            imageView.image = imagesArr[1]
            textDesc.text = stringArr[1]
        }
        if(i[j] == 3){
            imageView.image = imagesArr[2]
            textDesc.text = stringArr[2]
        }
        if(i[j] == 4){
            imageView.image = imagesArr[3]
            textDesc.text = stringArr[3]
        }
        if(i[j] == 5){
            imageView.image = imagesArr[4]
            textDesc.text = stringArr[4]
        }
        
        
    }
    
    @IBAction func onCrop(_ sender: UIButton) {
        if index != -1{
        imagesArr[index] = cropImage()
        }
        imageView.image = imagesArr[index]
        scrollView.zoomScale = 1
        
        
    }
    func cropImage() -> UIImage {
        
        let scale:CGFloat = 1/scrollView.zoomScale
        let x:CGFloat = scrollView.contentOffset.x * scale
        let y:CGFloat = scrollView.contentOffset.y * scale
        let width:CGFloat = scrollView.frame.size.width * scale
        let height:CGFloat = scrollView.frame.size.height * scale
        let croppedCGImage = imageView.image?.cgImage?.cropping(to: CGRect(x: x, y: y, width: width, height: height))
        let croppedUIImage = UIImage(cgImage: croppedCGImage!)
        return croppedUIImage
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(pictureTap)
        imageView.isUserInteractionEnabled = true
        
        scrollView.minimumZoomScale=1
        scrollView.maximumZoomScale=6
        // Do any additional setup after loading the view.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }


}

