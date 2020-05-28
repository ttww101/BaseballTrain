//
//  ProGRecordModel.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct ProGRecordModel {
    var team1: teamRecordModel
    var team2: teamRecordModel
    
    init(_ team1: teamRecordModel, _ team2: teamRecordModel) {
        self.team1 = team1
        self.team2 = team2
    }
    
    func teams() -> [teamRecordModel] {
        return [team1, team2]
    }
}

class teamRecordModel {
    var name: String!
    var score: Int!
    var Base1: Int!
    var Base2: Int!
    var Base3: Int!
    var HBase: Int!
    var K: Int!
    var SF: Int!
    
    init(_ name: String) {
        self.name = name
        score = 0
        Base1 = 0
        Base2 = 0
        Base3 = 0
        HBase = 0
        K = 0
        SF = 0
    }
    
    func getInfo() -> [Int] {
        return [Base1, Base2, Base3, HBase, K]
    }
}
