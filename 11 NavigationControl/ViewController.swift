//
//  ViewController.swift
//  11 NavigationControl
//
//  Created by Gukhwa Jeon on 07.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

// 자바의 인터페이스와 흡사
// 어디에 두는게 맞아? 메인화면 뷰컨드롤러에? 수정화면 뷰컨드롤러에?
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
}

class ViewController: UIViewController, EditDelegate {
  
    @IBOutlet var textMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: by using button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue: by using bar button"
        }
        editViewController.textMessageValue = textMessage.text!
        editViewController.delegate = self
    }
    
    // 프로토콜의 함수를 구현함
    // 수정화면의 데이터를 메인화면에 보여줌
    // EditViewController클래스 관련 내용이 함수안에 없는데. 어떻게 동작하니? => prepare에서 delegate변수에 메인화면 뷰컨트롤러 저장
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textMessage.text = message
      }
}

