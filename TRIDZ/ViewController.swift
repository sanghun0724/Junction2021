//
//  ViewController.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/21.
//

import UIKit
import Prestyler

class ViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.textAlignment = .center
                    textView.isEditable = false
                    textView.showsVerticalScrollIndicator = false
        }
    }
    
    let quote = "개발은 정말 어려워요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = quote
//        let firstAttributes: [NSAttributedString.Key :Any] = [.backgroundColor:UIColor.green,NSAttributedString.Key.kern: 10]
//        let secondAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
//        let attributedSentence = NSMutableAttributedString(string: quote, attributes: secondAttributes)
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
 
    
    
    
}

