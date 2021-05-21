//
//  MessgeViewController.swift
//  TRIDZ
//
//  Created by sangheon on 2021/05/21.
//
import UIKit

import UIKit

class MessageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate {

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
}

