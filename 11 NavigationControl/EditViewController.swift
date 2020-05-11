//
//  EditViewController.swift
//  11 NavigationControl
//
//  Created by Gukhwa Jeon on 07.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

// 자바의 인터페이스와 흡사
// 어디에 두는게 맞아? 메인화면 뷰컨드롤러에? 수정화면 뷰컨트롤러에?
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didLampImageSwitchDone(_ controller: EditViewController, isOn: Bool)
    func didLampImageZoomDone(_ controller: EditViewController, isZoomedIn: Bool)
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessageValue: String = ""
    var delegate: EditDelegate? // 프로토콜 EditDelegate의 타입변수, 메인화면에서 수정화면으로 넘어올때 이 변수에 자기(메인화면 뷰컨트롤러)를 저장
    var isOn = false
    var isZoomedIn = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var textMessage: UITextField!
    @IBOutlet var switchOn: UISwitch!
    @IBOutlet var btnResize: UIButton!
    
    // 메인화면 뷰 컨트롤러의 prepare함수가 이 함수 전에 실행됨
    // 여기 변수값이 prepare함수에서 이미 변경된 상태
    override func viewDidLoad() {
        print("EditViewController.viewDidLoad() ")
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        textMessage.text = textMessageValue
        switchOn.isOn = isOn
        
        if isZoomedIn {
            btnResize.setTitle("Zoom out", for: UIControl.State())
        } else {
            btnResize.setTitle("Zoom in", for: UIControl.State())
        }
    }
    
    // 스위치 상태에 따라 변수값 변경
    @IBAction func switchLampImg(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnResizeLampImg(_ sender: UIButton) {
        if isZoomedIn {
            isZoomedIn = false
            btnResize.setTitle("Zoom in", for: UIControl.State())
        } else {
            isZoomedIn = true
            btnResize.setTitle("Zoom out", for: UIControl.State())
        }
    }
    
    
    // 수정한 데이터를 메인화면으로 전달
    @IBAction func btnDone(_ sender: UIButton) {
        // delegate는 메인화면 뷰 컨트롤러. 그러니까 클릭해서 넘어올 수 있는 도입화면
        if delegate != nil {
            // 메인화면 뷰 컨트롤러의 함수를 호출, 거기서 메세지를 받는다
            delegate?.didMessageEditDone(self, message: textMessage.text!)
            delegate?.didLampImageSwitchDone(self, isOn: isOn)
            delegate?.didLampImageZoomDone(self, isZoomedIn: isZoomedIn)
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
