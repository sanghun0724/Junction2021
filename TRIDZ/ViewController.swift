//
//  ViewController.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    let quote = "개발은 정말 어려워요"
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = quote
//        let firstAttributes: [NSAttributedString.Key :Any] = [.backgroundColor:UIColor.green,NSAttributedString.Key.kern: 10]
//        let secondAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
//        let attributedSentence = NSMutableAttributedString(string: quote, attributes: secondAttributes)
        textView.attributedText = NSMutableAttributedString()
            .underlined("개발은")
        
    }
    
    
}

