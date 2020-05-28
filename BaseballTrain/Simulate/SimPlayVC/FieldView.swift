//
//  FieldView.swift
//  BaseballTrain
//
//  Created by Apple on 9/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol FieldViewDelegate: class {
    func runFinish()
}

enum BaseType: Int {
    case hBase = 3
    case Base1 = 0
    case Base2 = 1
    case Base3 = 2
}

open class FieldView: UIView {
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var outLabel: UILabel!
    
    @IBOutlet weak var hBase: UIImageView!
    @IBOutlet weak var Base1: UIImageView!
    @IBOutlet weak var Base2: UIImageView!
    @IBOutlet weak var Base3: UIImageView!
    
    @IBOutlet weak var running: UIImageView!
    
    @IBOutlet weak var homerunImg: UIImageView!
    
    var delegate: FieldViewDelegate?
    var nowAction = true
    
    private var baseArray = [UIImageView]()
    
    private var playerBase: [Int] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setBaseArray()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setBaseArray()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setBaseArray()
    }
    
    
    func reset(_ attack: String) {
        for base in baseArray {
            base.isHidden = true
        }
        attackLabel.text = attack
        outLabel.text = "0"
        hBase.isHidden = false
    }
    
    private func setBaseArray() {
        homerunImg.loadGif(name: "homerun")
        baseArray.removeAll()
        baseArray.append(Base1)
        baseArray.append(Base2)
        baseArray.append(Base3)
        baseArray.append(hBase)
    }
    
    func HitBase(_ hitBase: Int) {
        guard nowAction else { return }
        nowAction = false
        running.center = hBase.center
        for num in playerBase {
            baseArray[num].isHidden = true
        }
        hBase.isHidden = true
        running.isHidden = false
        nowPosition = 3
        goal = hitBase + 1
        move = 0
        runningMove()
        if hitBase == 3 {
            homerunImg.isHidden = false
        }
    }
    
    private var nowPosition = 3
    private var goal = 0
    private var move = 0
    private var orientation = true
    private func runningMove() {
        nowPosition = (nowPosition == 3) ? 0 : nowPosition + 1
        var moveOri = true
        if (running.center.x - baseArray[nowPosition].center.x) > 0 {
            moveOri = false
        }
        if orientation != moveOri {
            running.flipImage()
            orientation = moveOri
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.running.center = self.baseArray[self.nowPosition].center
        }) {[weak self] (completion) in
            guard let self = self else { return }
            if completion {
                self.move += 1
                if self.move < self.goal {
                    self.runningMove()
                } else {
                    // 跑完
                    self.homerunImg.isHidden = true
                    self.running.isHidden = true
                    self.nowAction = true
                    self.delegate?.runFinish()
                }
            }
        }
    }
    
    func showBase(_ Bases: [Int]) {
        for num in Bases {
            baseArray[num].isHidden = false
        }
        playerBase = Bases
    }
    func showHitter() {
        hBase.isHidden = false
    }
    
    func setOutLabel(_ out: Int) {
        outLabel.text = "\(out)"
    }
    
    func hitterOut() {
        guard nowAction else { return }
        nowAction = false
        UIView.animate(withDuration: 0.5, animations: {
            self.hBase.layer.opacity = 0.01
        }) {[weak self] (completion) in
            guard let self = self else { return }
            if completion {
                self.hBase.layer.opacity = 1
                self.nowAction = true
            }
        }
        
    }
}
