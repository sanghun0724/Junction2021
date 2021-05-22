//
//  MyCell.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/22.
//

import UIKit

class MyCell: UITableViewCell,UITextViewDelegate {
    
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myBackView:UIImageView!
    var yourobj : (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myBackView.layer.cornerRadius = 20
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
   
    
  
    @IBAction func myHiddenButton(_ sender: Any) {
        if let btnAction = self.yourobj
        {
            btnAction()
          //  user!("pass string")
        }
    }
    
    
    
//   @IBAction func objectsTapLabel(gesture: UITapGestureRecognizer) {
//        print("안녕하세요 ")
//        let text = (self.myTextView.text)!
//
//        let location = gesture.location(in: self.myTextView)
//        let position = CGPoint(x: location.x, y: location.y)
//        let tapPosition = self.myTextView.closestPosition(to: position)
//        let tappedRange = self.myTextView.tokenizer.rangeEnclosingPosition(tapPosition!, with: UITextGranularity.word, inDirection: UITextDirection(rawValue: 1))
//        var tappedWord: String?
//        if tappedRange != nil {
//            tappedWord = self.myTextView.text(in:tappedRange!)
//        }
//        print("tapped word: \(tappedWord)")
//
//
//    }
}

