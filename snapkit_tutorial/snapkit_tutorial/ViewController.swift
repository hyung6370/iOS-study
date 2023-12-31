//
//  ViewController.swift
//  snapkit_tutorial
//
//  Created by KIM Hyung Jun on 10/27/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var greenBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var redBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var yellowBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var blueBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var myButton = { (color: UIColor) -> UIButton in
        let btn = UIButton(type: .system)
        btn.backgroundColor = color
        btn.setTitle("내 버튼", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 16
        return btn
    }
    
    var greenBoxTopContraint: Constraint? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(yellowBox)
        self.view.addSubview(greenBox)
        self.view.addSubview(redBox)
        self.view.addSubview(blueBox)
        
        let myDarkGrayBtn = myButton(.darkGray)
        self.view.addSubview(myDarkGrayBtn)
        
//        yellowBox.translatesAutoresizingMaskIntoConstraints = false
//        greenBox.translatesAutoresizingMaskIntoConstraints = false
//        redBox.translatesAutoresizingMaskIntoConstraints = false
//        blueBox.translatesAutoresizingMaskIntoConstraints = false
//        
//        // 기존 오토레이아웃
//        yellowBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
//        yellowBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
//        yellowBox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
//        yellowBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
        
        // SnapKit
        yellowBox.snp.makeConstraints { make in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
//            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 100, left: 50, bottom: 50, right: 50))
        }
        
        redBox.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
//            make.center.equalToSuperview()
        }
        
        blueBox.snp.makeConstraints { make in
//            make.width.equalTo(redBox.snp.width).dividedBy(1.5)
            make.width.equalTo(redBox.snp.width).multipliedBy(2)
            make.height.equalTo(redBox.snp.height)
            make.top.equalTo(redBox.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        myDarkGrayBtn.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        greenBox.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            self.greenBoxTopContraint = make.top.equalTo(blueBox.snp.bottom).offset(20).constraint
        }
        
        

    }

    var offset = 0
    
    @objc fileprivate func moveGreenBoxDown() {
        offset += 40
        print("ViewController - moveGreenBoxDown() called / offset: \(offset)")
        
        self.greenBoxTopContraint?.update(offset: offset)
    }
    
}


#if DEBUG
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    // leave this empty
}

@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> some UIViewController {
    ViewController()
    }
}

@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
} #endif

