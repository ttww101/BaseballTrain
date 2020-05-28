//
//  TrainVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import MarqueeLabel

class TrainVC: UIViewController {
    private let cellIdenfifier = String(describing: TrainCell.self)
    @IBOutlet weak var trainTable: UITableView!
    @IBOutlet weak var marquee: MarqueeLabel!
    
    var listData: [TrainModel]!
    
    var list: [TrainListModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listData = [
            TrainModel(title: "全部训练", imageName: "all", secondTitle: "Ａll"),
            TrainModel(title: "打击训练", imageName: "hit", secondTitle: "Hit"),
            TrainModel(title: "投球训练", imageName: "pitch", secondTitle: "Pitch"),
            TrainModel(title: "跑垒训练", imageName: "run", secondTitle: "Run")
        ]
        
        trainTable.separatorStyle = UITableViewCell.SeparatorStyle.none
        trainTable.delegate = self
        trainTable.dataSource = self
        // Do any additional setup after loading the view.
        marquee.type = .continuous
        marquee.animationCurve = .easeInOut
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillLayoutSubviews()
    }

}
extension TrainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //1. set the initaial state of the cell
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
        
        cell.layer.transform = transform
        
        //2. UIView animation method to chang to the final state of the cell
        UIView.animate(withDuration: 0.3) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return trainTable.frame.size.height / 2
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        list = LDatabase.instance.getData(indexPath.row)
        performSegue(withIdentifier: "toTrainListVC", sender: list)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let trainListVC = segue.destination as? TrainListVC {
            
            trainListVC.listData = self.list
            
        }
        
    }
    
}

// MARK: - Table view data source

extension TrainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = trainTable.dequeueReusableCell(withIdentifier: cellIdenfifier ) as? TrainCell {
            
            let category = listData[indexPath.row]
            cell.updataViews(model: TrainCellModel(category: category))
            
            cell.selectionStyle = .none
            
            return cell
            
        } else {
            
            return TrainCell()
        }
    }
    
}
