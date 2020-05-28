//
//  SimPlayManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum teamType {
    case home, away
}

enum scoreType {
    case drop, drive, smash, out
}

class SimPlayManager {
    var homequarter = 0
    var homeDrop = 0
    var homeDrive = 0
    var homeSmash = 0
    var homeOut = 0
    
    var awayquarter = 0
    var awayDrop = 0
    var awayDrive = 0
    var awaySmash = 0
    var awayOut = 0
    
    init() {
        reset()
    }
    
    func reset() {
        homequarter = 0
        homeDrop = 0
        homeDrive = 0
        homeSmash = 0
        homeOut = 0
        
        awayquarter = 0
        awayDrop = 0
        awayDrive = 0
        awaySmash = 0
        awayOut = 0
    }
    
    func addPoint(_ team: teamType, _ score: scoreType) {
        switch team {
        case .home:
            switch score {
            case .drop:
                homeDrop += 1
                homequarter += 1
            case .drive:
                homeDrive += 1
                homequarter += 1
            case .smash:
                homeSmash += 1
                homequarter += 1
            case .out:
                homeOut += 1
                awayquarter += 1
            }
        case .away:
            switch score {
            case .drop:
                awayDrop += 1
                awayquarter += 1
            case .drive:
                awayDrive += 1
                awayquarter += 1
            case .smash:
                awaySmash += 1
                awayquarter += 1
            case .out:
                awayOut += 1
                homequarter += 1
            }
        }
    }
    
    func minusPoint(_ team: teamType, _ score: scoreType, _ completion: @escaping(Bool) -> Void) {
        switch team {
        case .home:
            switch score {
            case .drop:
                if homeDrop > 0 {
                    homeDrop -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .drive:
                if homeDrive > 0 {
                    homeDrive -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .smash:
                if homeSmash > 0 {
                    homeSmash -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .out:
                if homeOut > 0 {
                    homeOut -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            }
        case .away:
            switch score {
            case .drop:
                if awayDrop > 0 {
                    awayDrop -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .drive:
                if awayDrive > 0 {
                    awayDrive -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .smash:
                if awaySmash > 0 {
                    awaySmash -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .out:
                if awayOut > 0 {
                    awayOut -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            }
        }
    }
    
}
