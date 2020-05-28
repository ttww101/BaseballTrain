//
//  SimPlayerRunVC.swift
//  BaseballTrain
//
//  Created by Apple on 9/9/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct SimPlayerRunModel {
    var name: String
    var choice: Int
    var click: Bool
    var home: Bool
    var out: Bool
}

class SimPlayerRunVC: UIViewController {

    @IBOutlet weak var playerTable: UITableView!
    @IBOutlet weak var finishBtn: UIButton!
    
    private var base = [Int]()
    private var hit = 0
    private var onBase = 0
    private var hiddenBase = [Int]()
    
    var data = [SimPlayerRunModel]()
    
    var runResault: ((_ base: [Int], _ home: Int, _ Out: Int) -> Void)?
    
    init(_ base: [Int], _ hit: Int) {
        super.init(nibName: "SimPlayerRunVC", bundle: nil)
        self.base = base
        self.hit = hit
        self.onBase = 2 - hit
        getData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SimPlayerRunCell", bundle: nil)
        playerTable.register(nib, forCellReuseIdentifier: "SimPlayerRunCell")
        
        playerTable.reloadData()
        // Do any additional setup after loading the view.
    }
    
    private func getData() {
        for i in 0..<base.count {
            data.append(SimPlayerRunModel(name: "\(base[i] + 1)垒球员：", choice: 0, click: false, home: false, out: false))
        }
    }
    
    private func clearData() {
        hiddenBase.removeAll()
        for cell in data {
            if cell.choice != 0 {
                hiddenBase.append(cell.choice)
            }
        }
    }
    
    private func settingFinish() {
        var s = true
        for cell in data {
            if !cell.click {
                s = false
            }
        }
        if s {
            finishBtn.isHidden = false
        }
    }

    @IBAction func finishPressed(_ sender: UIButton) {
        var gobase = [Int]()
        var homePlay = 0
        var outPlay = 0
        for cell in data {
            if cell.choice > 0 {
                gobase.append(cell.choice)
            }
            if cell.home {
                homePlay += 1
            }
            if cell.out {
                outPlay += 1
            }
        }
        runResault?(gobase, homePlay, outPlay)
    }
}
extension SimPlayerRunVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = data[indexPath.row]
        let cell = playerTable.dequeueReusableCell(withIdentifier: "SimPlayerRunCell", for: indexPath) as! SimPlayerRunCell
        cell.cellLabel.text = cellData.name
        cell.cellLabel.adjustsFontSizeToFitWidth = true
        cell.hiddenBtn(hit, hiddenBase, cellData.choice)
        cell.btnChange = {[weak self] (base) in
            guard let self = self else { return }
            self.data[indexPath.row].click = true
            self.data[indexPath.row].out = false
            self.data[indexPath.row].home = false
            self.data[indexPath.row].choice = 0
            switch base {
            case 0:
                self.data[indexPath.row].out = true
            case 3:
                self.data[indexPath.row].home = true
            case 1:
                self.data[indexPath.row].choice = 1
            case 2:
                self.data[indexPath.row].choice = 2
            default:
                return
            }
            self.clearData()
            self.playerTable.reloadData()
            self.settingFinish()
        }
        
        return cell
    }
    
    
}
extension SimPlayerRunVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
