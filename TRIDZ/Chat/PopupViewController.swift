//
//  PopupViewController.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/22.
//

import UIKit

class PopupViewController:UIViewController {
    
    var Data:chatType? = nil
    @IBOutlet weak var wordName: UILabel!
    
    @IBOutlet weak var wordDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Data?.message)
        self.wordName.text = Data?.word
        self.wordDescription.text = Data?.message
    }
    
    
    @IBAction func PostButton(_ sender: Any) {
    }
    
    @IBAction func goCancel(_ sender: Any) {
        
    }
    
}
