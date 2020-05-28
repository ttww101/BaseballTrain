//
//  SimGameOverVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimGameOverVC: UIViewController {
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    
    @IBOutlet weak var base1home: UILabel!
    @IBOutlet weak var base2home: UILabel!
    @IBOutlet weak var base3home: UILabel!
    @IBOutlet weak var hBasehome: UILabel!
    @IBOutlet weak var outhome: UILabel!
    
    @IBOutlet weak var base1away: UILabel!
    @IBOutlet weak var base2away: UILabel!
    @IBOutlet weak var base3away: UILabel!
    @IBOutlet weak var hBaseaway: UILabel!
    @IBOutlet weak var outaway: UILabel!
    
    @IBOutlet weak var viewButton: NSLayoutConstraint!
    
    var homeArray: [UILabel] {
        return [base1home, base2home, base3home, hBasehome, outhome]
    }
    var awayArray: [UILabel] {
        return [base1away, base2away, base3away, hBaseaway, outaway]
    }
    
    var proGRecordModel: ProGRecordModel!
    var openCell: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        setViewStyle()
        setLabelText()
        setLabelStyle()
    }
    func setViewStyle() {
        viewButton.constant = (openCell) ? 66 : 0
    }
    func setLabelText() {
        name1.text = proGRecordModel.team1.name
        name2.text = proGRecordModel.team2.name
        score1.text = "\(proGRecordModel.team1.score!)"
        score2.text = "\(proGRecordModel.team2.score!)"
        
        for i in 0..<homeArray.count {
            homeArray[i].text = "\(proGRecordModel.team1.getInfo()[i])"
            awayArray[i].text = "\(proGRecordModel.team2.getInfo()[i])"
        }
    }
    func setLabelStyle() {
        for i in 0..<homeArray.count {
            if proGRecordModel.team1.getInfo()[i] > proGRecordModel.team2.getInfo()[i] {
                homeArray[i].textColor = .red
            } else if proGRecordModel.team2.getInfo()[i] > proGRecordModel.team1.getInfo()[i] {
                awayArray[i].textColor = .red
            }
        }
    }

    @IBAction func savePressed(_ sender: UIButton) {
        if LCManager.shared.objectId != "" {
            LCManager.shared.saveGameRecord(self.proGRecordModel.team1, self.proGRecordModel.team2, completion: { (success, error) in
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            let storyboard = UIStoryboard(name: "Begin", bundle: nil)
            if let desVC = storyboard.instantiateInitialViewController() {
                self.present(desVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
