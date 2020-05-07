//
//  EditViewController.swift
//  11 NavigationControl
//
//  Created by Gukhwa Jeon on 07.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit



class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessageValue: String = ""
    var delegate: EditDelegate? // 프로토콜 EditDelegate의 타입변수, 메인화면에서 수정화면으로 넘어올때 이 변수에 자기(메인화면 뷰컨트롤러)를 저장
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var textMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        textMessage.text = textMessageValue
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        // 수정한 데이터를 메인화면으로 전달
        // delegate는 메인화면 뷰 컨트롤러. 그러니까 클릭해서 넘어올 수 있는 도입화면
        if delegate != nil {
            // 메인화면 뷰 컨트롤러의 함수를 호출, 거기서 메세지를 받는다
            delegate?.didMessageEditDone(self, message: textMessage.text!)
        }
        // 메인화면으로 돌아가기
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
