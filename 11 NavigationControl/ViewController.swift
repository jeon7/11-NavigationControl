//
//  ViewController.swift
//  11 NavigationControl
//
//  Created by Gukhwa Jeon on 07.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let ZOOM_SCALE: CGFloat = 2.0
    
    var isOn = false
    var isZoomedIn = false
  
    @IBOutlet var textMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        print("ViewController.vieDidLoade() ") // 처음 한번만 이 함수가 실행됨
        super.viewDidLoad()
        imgView.image = imgOff
    }

    // 세그웨이 관련 함수
    // 수정화면 컨트롤러의 viewDidLoad() 전에 실행
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("ViewController.prepare() ")
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: by using button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue: by using bar button"
        }
        editViewController.textMessageValue = textMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoomedIn = isZoomedIn
        editViewController.delegate = self
    }
    
    // 프로토콜의 함수를 구현함
    // 수정화면의 데이터를 메인화면에 보여줌
    // EditViewController클래스 관련 내용이 함수안에 없는데. 어떻게 동작하니? => prepare에서 editViewController의 delegate변수에 메인화면 뷰컨트롤러 저장
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textMessage.text = message
      }
    
    func didLampImageSwitchDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didLampImageZoomDone(_ controller: EditViewController, isZoomedIn: Bool) {
        if self.isZoomedIn != isZoomedIn {
            self.isZoomedIn = !self.isZoomedIn
            
            if isZoomedIn {
                imgView.frame.size = CGSize(width: imgView.frame.width * ZOOM_SCALE,
                                            height: imgView.frame.height * ZOOM_SCALE)
            } else {
                imgView.frame.size = CGSize(width: imgView.frame.width / ZOOM_SCALE,
                                            height: imgView.frame.height / ZOOM_SCALE)
            }
        }
    }
}
