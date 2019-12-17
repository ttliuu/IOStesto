//
//  ViewController.swift
//  Testo12051353
//
//  Created by Tianwei Liu on 12/5/19.
//  Copyright © 2019 Tianwei Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var randButton: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var textDesc: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var i = [1,2,3,4,5]
    var index = -1
    var stringArr = ["Trinity-Pawling School","Cluett Hall","School Crest","Lion","Dining Hall"]
    
    
    
    
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
            imageView.image = UIImage(named: "CampusPhoto.jpg")
            textDesc.text = stringArr[0]
        }
        if(i[index] == 2){
            imageView.image = UIImage(named: "Cluett_Hall.jpg")
            textDesc.text = stringArr[1]
        }
        if(i[index] == 3){
            imageView.image = UIImage(named: "Trinity-Pawling_School_Crest.jpg")
            textDesc.text = stringArr[2]
        }
        if(i[index] == 4){
            imageView.image = UIImage(named: "Trinity-Pawling-Lion.jpg.png")
            textDesc.text = stringArr[3]
        }
        if(i[index] == 5){
            imageView.image = UIImage(named: "TuitionFA_TrinityPawlingSchool.jpg")
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
        var j = Int.random(in: 0...4)
        index = j
        if(i[j] == 0){
            randPress(randButton)
        }
        
        if(i[j] == 1){
            imageView.image = UIImage(named: "CampusPhoto.jpg")
            textDesc.text = stringArr[0]
        }
        if(i[j] == 2){
            imageView.image = UIImage(named: "Cluett_Hall.jpg")
            textDesc.text = stringArr[1]
        }
        if(i[j] == 3){
            imageView.image = UIImage(named: "Trinity-Pawling_School_Crest.jpg")
            textDesc.text = stringArr[2]
        }
        if(i[j] == 4){
            imageView.image = UIImage(named: "Trinity-Pawling-Lion.jpg.png")
            textDesc.text = stringArr[3]
        }
        if(i[j] == 5){
            imageView.image = UIImage(named: "TuitionFA_TrinityPawlingSchool.jpg")
            textDesc.text = stringArr[4]
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

