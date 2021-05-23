//
//  ViewController.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/21.
//

import UIKit
import Prestyler
import SocketIO

class ViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var LoginTextView: UITextField!
//    @IBOutlet weak var textView: UITextView! {
//        didSet {
//            textView.textAlignment = .center
//            textView.isEditable = false
//            textView.showsVerticalScrollIndicator = false
//        }
//    }
   
    @IBOutlet weak var buttonView: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.layer.cornerRadius = 10
    }

//
//    @objc func objectsTapLabel(_ gesture: UITapGestureRecognizer) {
//        let text = (textView.text)!
//
//        let location = gesture.location(in: textView)
//        let position = CGPoint(x: location.x, y: location.y)
//        let tapPosition = textView.closestPosition(to: position)
//        let tappedRange = textView.tokenizer.rangeEnclosingPosition(tapPosition!, with: UITextGranularity.word, inDirection: UITextDirection(rawValue: 1))
//        var tappedWord: String?
//        if tappedRange != nil {
//            tappedWord = textView.text(in:tappedRange!)
//        }
//        print("tapped word: \(tappedWord)")
//
//    }


    
    @IBAction func LoginButton(_ sender: Any) {
     
    }
    
}

