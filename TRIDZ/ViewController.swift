//
//  ViewController.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/21.
//

import UIKit
import Prestyler

class ViewController: UIViewController,UITextViewDelegate {

    
    
    @IBOutlet weak var LoginTextView: UITextField!
    
    
    
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.textAlignment = .center
                    textView.isEditable = false
                    textView.showsVerticalScrollIndicator = false
        }
    }
    var socket:SocketClientManager!
    
    let quote = "개발은 정말 어려워요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        SocketClientManager.shared.sendMessage(message: self.textView.text, who: "loginUserName")
        
        
        
        
        
        
        
        
        textView.text = quote

        Prestyler.defineRule("T", UIColor.blue)
        let aaa = quote.prefilter(text: "개발은", by: "T")
        textView.attributedText = aaa.prestyled()
       
        let gestureReconizer = UITapGestureRecognizer(target: self, action: #selector(objectsTapLabel(_:)))
        gestureReconizer.numberOfTapsRequired = 1
        gestureReconizer.numberOfTouchesRequired = 1
        
        textView.addGestureRecognizer(gestureReconizer)
        textView.isUserInteractionEnabled = true
        
    }

    
    @objc func objectsTapLabel(_ gesture: UITapGestureRecognizer) {
        let text = (textView.text)!

        let location = gesture.location(in: textView)
        let position = CGPoint(x: location.x, y: location.y)
        let tapPosition = textView.closestPosition(to: position)
        let tappedRange = textView.tokenizer.rangeEnclosingPosition(tapPosition!, with: UITextGranularity.word, inDirection: UITextDirection(rawValue: 1))
        var tappedWord: String?
        if tappedRange != nil {
            tappedWord = textView.text(in:tappedRange!)
        }
        print("tapped word: \(tappedWord)")
        
    }
 
    
    
    @IBAction func LoginButton(_ sender: Any) {
        SocketClientManager.shared.startConnection()
    }
    
}

