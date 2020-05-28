//
//  SimPlayVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SnapKit

struct SimPlayModel {
    var home: String
    var away: String
}

enum stopType {
    case homeStop, awayStop, rest
}

class SimPlayVC: UIViewController {
    @IBOutlet weak var Name1Label: UILabel! //主隊名
    @IBOutlet weak var Name2Label: UILabel! //客隊名
    @IBOutlet weak var Score1Label: UILabel! //主隊總分
    @IBOutlet weak var Score2Label: UILabel! //客隊總分
    @IBOutlet var quarter1Score: [UILabel]! //主隊每節
    @IBOutlet var quarter2Score: [UILabel]! //客隊每節
    
    //棒球場
    @IBOutlet weak var fieldView: FieldView!
    
    //按鈕view
    @IBOutlet weak var hitView: UIView!
    @IBOutlet var outView: UIView!
    
    //中場休息view
    @IBOutlet weak var restView: UIView!
    @IBOutlet weak var restImg: UIImageView!
    @IBOutlet weak var restLabel: UILabel!
    
    var simPlayModel: SimPlayModel!
    var proGRecord: ProGRecordModel!
    
    var playerBase = [Int]()
    
    var quarter = 0
    var attack = 0 //客 0  主 1
    
    var action = true
    
    var homeQuarter = 0
    var awayQuarter = 0
    var homeScore = 0 {
        didSet {
            Score1Label.text = "\(homeScore)"
        }
    }
    var awayScore = 0 {
        didSet {
            Score2Label.text = "\(awayScore)"
        }
    }
    var playerOut = 0 {
        didSet {
            fieldView.setOutLabel(playerOut)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldView.delegate = self
        DefaultInfo()
        Setting()
        restImg.loadGif(name: "cheerup")
    }
    
    func DefaultInfo() {
        let team1 = teamRecordModel.init(simPlayModel.home)
        let team2 = teamRecordModel.init(simPlayModel.away)
        proGRecord = ProGRecordModel(team2, team1)
    }
    
    func Setting() {
        Name1Label.text = simPlayModel.home
        Name2Label.text = simPlayModel.away
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        guard action else { return }
        guard fieldView.nowAction else { return }
        action = false
        switch sender.tag {
        case 0:
            proGRecord.teams()[attack].Base1 += 1
            checkRun(0)
        case 1:
            proGRecord.teams()[attack].Base2 += 1
            checkRun(1)
        case 2:
            proGRecord.teams()[attack].Base3 += 1
            checkRun(2)
        case 3:
            proGRecord.teams()[attack].HBase += 1
            let hscore = playerBase.count + 1
            switch attack {
            case 0:
                self.awayQuarter += hscore
                self.awayScore += hscore
                self.quarter2Score[self.quarter].text = "\(self.awayQuarter)"
            case 1:
                self.homeQuarter += hscore
                self.homeScore += hscore
                self.quarter1Score[self.quarter].text = "\(self.homeQuarter)"
            default:
                return
            }
            playerBase.removeAll()
            checkRun(3)
        case 4: // 三振
            return
//            proGRecord.teams()[attack].K += 1
//            fieldView.hitterOut()
//            playerOut += 1
        case 5: // 犧牲打
            return
//            proGRecord.teams()[attack].SF += 1
        case 6: // 出局（三振）
            proGRecord.teams()[attack].K += 1
            fieldView.hitterOut()
            playerOut += 1
            action = true
            checkOut()
//            UIView.transition(from: hitView, to: outView, duration: 0.5, options: .transitionCrossDissolve, completion: nil)
        case 7: // 返回
            return
//            UIView.transition(from: outView, to: hitView, duration: 0.5, options: .transitionCrossDissolve, completion: nil)
        default:
            return
        }
    }
    
    func checkRun(_ hit: Int) {
        if playerBase.count > 0 {
            let simPlayerRunVC = SimPlayerRunVC(playerBase, hit)
            simPlayerRunVC.runResault = {[weak self] (bases, home, out) in
                guard let self = self else { return }
                switch self.attack {
                case 0:
                    self.awayQuarter += home
                    self.awayScore += home
                    self.quarter2Score[self.quarter].text = "\(self.awayQuarter)"
                case 1:
                    self.homeQuarter += home
                    self.homeScore += home
                    self.quarter1Score[self.quarter].text = "\(self.homeQuarter)"
                default:
                    return
                }
                self.playerOut += out
                self.playerBase = bases
                self.playerBase.append(hit)
                simPlayerRunVC.remove()
                self.fieldRun(hit)
            }
            self.add(simPlayerRunVC)
            simPlayerRunVC.view.snp.makeConstraints { (maker) in
                maker.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            }
        } else {
            if hit != 3 {
                playerBase.append(hit)
            }
            fieldRun(hit)
        }
    }
    
    func fieldRun(_ hit: Int) {
        fieldView.HitBase(hit)
    }
    
    func checkOut() {
        if playerOut > 2 {
            switchTeam()
        }else if quarter == 8 && attack == 1 {
            if homeScore > awayScore {
                switchTeam()
            }
        }
    }
    
    func switchTeam() {
        switch attack {
        case 0:
            quarter2Score[quarter].text = "\(awayQuarter)"
        case 1:
            quarter1Score[quarter].text = "\(homeQuarter)"
        default:
            return
        }
        if attack == 1 {
            attack = 0
            quarter += 1
        } else {
            attack = 1
        }
        if quarter > 8 {
            proGRecord.team1.score = awayScore
            proGRecord.team2.score = homeScore
            gameOver()
        } else {
            showRestView()
        }
    }
    
    func showRestView() {
        let str = (attack == 0) ? "上客队" : "下主队"
        restLabel.text = "\(quarter + 1)局\(str)进攻"
        restView.isHidden = false
    }
    
    @IBAction func restPressed(_ sender: UIButton) {
        let str = (attack == 0) ? "客队进攻" : "主队进攻"
        fieldView.reset(str)
        playerBase.removeAll()
        homeQuarter = 0
        awayQuarter = 0
        playerOut = 0
        restView.isHidden = true
    }
    
    func gameOver() {
        let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let desVC = profileStoryboard.instantiateViewController(withIdentifier: "SimGameOverVC")
        
        guard let simGameOverVC = desVC as? SimGameOverVC else { return }
        
        simGameOverVC.proGRecordModel = proGRecord
        simGameOverVC.openCell = true
        
        self.present(simGameOverVC, animated: true) {
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
}

extension SimPlayVC: FieldViewDelegate {
    func runFinish() {
        fieldView.showBase(playerBase)
        fieldView.showHitter()
        action = true
        checkOut()
    }
}
