//
//  MessgeViewController.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/21.
//


import UIKit
import SocketIO
import Prestyler

class MessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIGestureRecognizerDelegate {
    let test:[String] = ["JAVA","API","Developer","design"]
    
    
    @IBOutlet weak var personProfileImage: UIImageView!
    @IBOutlet weak var PersonName: UILabel!
    @IBOutlet weak var PersonJob: UILabel!
    let number = "010-0000-12342"
    @IBOutlet weak var TopView: UIView! {
        didSet {
            self.TopView.layer.masksToBounds = false
            self.TopView.layer.shadowColor = UIColor.systemGray2.cgColor
            self.TopView.layer.shadowOpacity = 0.9
            self.TopView.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.TopView.layer.shadowRadius = 3
        }
    }
    lazy var infoView:InfoView = {
        let view = InfoView()
        return view
    }()
    
    func removeInfoViewAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.blurEffectView.alpha = 0
            self.infoView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }
        self.infoView.removeFromSuperview()
    }
    
    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            self.chatTableView.delegate = self
            self.chatTableView.dataSource = self
            chatTableView.separatorStyle = .none //구분선 사용 x
        }
    }
    @IBOutlet weak var inputHeight: NSLayoutConstraint!
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            self.inputTextView.delegate = self
            self.inputTextView.layer.cornerRadius = 14
        }
    }
    
    
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    
    var chatDatas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        //사용하려는 셀을 등록해야 사용가능
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell")
        //xib파일 연결
        
        //키보드 관련 옵저버 -상태틀 알려 주는거
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(noti:Notification) {
        let notiInfo = noti.userInfo //userInfo를 통해 정보를 받아옴
        let keyboardFrame = notiInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom // safearea 뺴줘야함
    
        let animationDuration = notiInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = height
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(noti:Notification) {
        let notiInfo = noti.userInfo
        let animationDuration = notiInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration + 1) {
            
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //걍 번갈아 가면서
        if indexPath.row % 2 == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
            myCell.myTextView.text = chatDatas[indexPath.row]
            let words = "JAVA"
            highlight(highView:myCell.myTextView, message: myCell.myTextView.text, worldValue: words)
            myCell.yourobj =  {
                self.detectWords(str: words)
            }
         
            
            myCell.selectionStyle = .none //클릭 이벤트 없애기
            return myCell
            
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath) as! YourCell
            yourCell.yourCellTextView.text = chatDatas[indexPath.row]
            yourCell.selectionStyle = .none
           
            return yourCell
        }
       
    }
     
    
    
    @IBAction func sendData(_ sender: Any) {
       // inputTextView.text -> =chatDatas
        chatDatas.append(inputTextView.text)
        inputTextView.text.removeAll() //입력하고 난뒤 텍스트필드 비워주기
        
        //chatTableView.reloadData()
        let lastIndexPath = IndexPath(row: chatDatas.count - 1 , section: 0)
        //해당하는 로우만 갱신
        chatTableView.insertRows(at: [lastIndexPath], with: UITableView.RowAnimation.automatic)
        
        //테이블뷰 대화에 따라 올려주기
        //3개 데이터가 있는 array일 경우
        // array.count = 3
        // array.row =>2  0부터 시작하니깐
        inputHeight.constant = 40
        chatTableView.scrollToRow(at: lastIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 40 {
            inputHeight.constant = 40
        } else if textView.contentSize.height >= 100{
            inputHeight.constant = 100
        } else {
            inputHeight.constant = textView.contentSize.height //안에있는 컨텐츠에 맞춰서 인풋크기 조절
            
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
    }
    
    
    
    @IBAction func VideoCall(_ sender: Any) {
    }
    
    
    @IBAction func phonCall(_ sender: Any) {
        guard let number = URL(string: "tel://" + self.number) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func plusButton(_ sender: Any) {
        
    }
    
    
    //하이라이트주기
    func highlight(highView: UITextView,message:String,worldValue:String) {
        Prestyler.defineRule("T", UIColor.blue)
        let att = message.prefilter(text: worldValue, by: "T")
        highView.attributedText = att.prestyled()
    }
    
 
    
    func detectWords(str:String) {
        for i in test {
            if i == str {
                
            }
        }
    }
    func showPopup(poketmon: [String]) {
        self.view.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -55).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        infoView.alpha = 0
        infoView.delegate = self
        infoView.poketmon = poketmon
        
        UIView.animate(withDuration: 0.3, animations: {
            //self.blurEffectView.alpha = 1
           // self.infoView.transform = .identity
            self.infoView.alpha = 1
        })
    }
    
    
}
protocol PoketmonCellProtocol {
    func showPopup(poketmon:[String])
}
