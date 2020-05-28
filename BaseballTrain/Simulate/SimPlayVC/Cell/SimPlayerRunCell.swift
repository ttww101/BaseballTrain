//
//  SimPlayerRunCell.swift
//  BaseballTrain
//
//  Created by Apple on 9/9/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimPlayerRunCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var baseBtn1: UIButton! //二壘
    @IBOutlet weak var baseBtn2: UIButton! //三壘
    @IBOutlet weak var baseBtn3: UIButton!
    @IBOutlet weak var outBtn: UIButton!
    
    var btnChange: ((Int) -> Void)?
    var btnsArray = [UIButton]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnsArray.append(baseBtn1)
        btnsArray.append(baseBtn2)
        btnsArray.append(baseBtn3)
        btnsArray.append(outBtn)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func hiddenBtn(_ base: Int, _ hidBtns: [Int], _ choice: Int) {
        var btns = [baseBtn1,baseBtn2]
        for i in 0..<base {
            btns[i]?.isHidden = true
        }
        for i in 0..<base {
            for j in 0..<hidBtns.count {
                if btns[i]?.tag == hidBtns[j] {
                    btns[i]?.isHidden = true
                }
            }
        }
        for i in 0..<base {
            if btns[i]?.tag == choice {
                btns[i]?.isHidden = false
            }
        }
    }
    
    func alphaBtn(_ base: Int) {
        for btn in btnsArray {
            if btn.tag != base {
                btn.alpha = 0.5
            }
        }
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        alphaBtn(sender.tag)
        btnChange?(sender.tag)
    }
    
    
}
