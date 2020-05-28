//
//  LDatabase.swift
//  BasketballTrain
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class LDatabase {
    static let instance = LDatabase()
    private init() {}
    
    private let allArray = [
        TrainListModel(videoImg: "hit1", durationLbl: 4, videoTitle: "打击胜经(上)", videoDescription: "打击教学", intensity: "入门", videoID: "yhGPe4NOViM", category: .hit, actionModel: [
            TrainActionModel(youtubeTime: 34, stopTime: 120, restTime: 4, timesDescription: 120, actionDescription: "击球前准备"),
            TrainActionModel(youtubeTime: 163, stopTime: 80, restTime: 4, timesDescription: 120, actionDescription: "击球")
            ]),
        TrainListModel(videoImg: "hit2", durationLbl: 2, videoTitle: "打击胜经(中)", videoDescription: "觸击教学", intensity: "入门", videoID: "yhGPe4NOViM", category: .hit, actionModel: [
            TrainActionModel(youtubeTime: 250, stopTime: 26, restTime: 3, timesDescription: 60, actionDescription: "触击准备"),
            TrainActionModel(youtubeTime: 165, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "偷袭触击")
            ]),
        TrainListModel(videoImg: "hit3", durationLbl: 8, videoTitle: "打击胜经(下)", videoDescription: "练习法", intensity: "入门", videoID: "yhGPe4NOViM", category: .hit, actionModel: [
            TrainActionModel(youtubeTime: 313, stopTime: 44, restTime: 3, timesDescription: 120, actionDescription: "身体动作"),
            TrainActionModel(youtubeTime: 358, stopTime: 57, restTime: 3, timesDescription: 120, actionDescription: "打击练习1"),
            TrainActionModel(youtubeTime: 418, stopTime: 46, restTime: 3, timesDescription: 120, actionDescription: "打击练习2"),
            TrainActionModel(youtubeTime: 467, stopTime: 54, restTime: 3, timesDescription: 120, actionDescription: "触击练习")
            ]),
        TrainListModel(videoImg: "pitch1", durationLbl: 5, videoTitle: "投手胜经(上)", videoDescription: "挥臂式投球", intensity: "入门", videoID: "Ba6iRZsoc8k", category: .pitch, actionModel: [
            TrainActionModel(youtubeTime: 32, stopTime: 53, restTime: 7, timesDescription: 60, actionDescription: "投前姿势"),
            TrainActionModel(youtubeTime: 86, stopTime: 56, restTime: 4, timesDescription: 60, actionDescription: "腿部动作"),
            TrainActionModel(youtubeTime: 144, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "投出")
            ]),
        TrainListModel(videoImg: "pitch2", durationLbl: 5, videoTitle: "投手胜经(中)", videoDescription: "固定式投球", intensity: "入门", videoID: "Ba6iRZsoc8k", category: .pitch, actionModel: [
            TrainActionModel(youtubeTime: 228, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "准备动作"),
            TrainActionModel(youtubeTime: 258, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "启动动作")
            ]),
        TrainListModel(videoImg: "pitch3", durationLbl: 3, videoTitle: "投手胜经(下)", videoDescription: "握球方法", intensity: "入门", videoID: "Ba6iRZsoc8k", category: .pitch, actionModel: [
            TrainActionModel(youtubeTime: 283, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "快速球＆变速球"),
            TrainActionModel(youtubeTime: 353, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "曲球＆滑球")
            ]),
        TrainListModel(videoImg: "run1", durationLbl: 3, videoTitle: "跑垒胜经(上)", videoDescription: "跑垒", intensity: "入门", videoID: "txOlDk-VRJY", category: .run, actionModel: [
            TrainActionModel(youtubeTime: 30, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "直线跑垒"),
            TrainActionModel(youtubeTime: 65, stopTime: 36, restTime: 5, timesDescription: 60, actionDescription: "直线转弧线"),
            TrainActionModel(youtubeTime: 106, stopTime: 45, restTime: 3, timesDescription: 60, actionDescription: "弧线")
            ]),
        TrainListModel(videoImg: "run2", durationLbl: 3, videoTitle: "跑垒胜经(中)", videoDescription: "离垒回垒", intensity: "入门", videoID: "txOlDk-VRJY", category: .run, actionModel: [
            TrainActionModel(youtubeTime: 165, stopTime: 70, restTime: 5, timesDescription: 70, actionDescription: "一垒跑垒员"),
            TrainActionModel(youtubeTime: 244, stopTime: 60, restTime: 2, timesDescription: 60, actionDescription: "二垒跑垒员"),
            TrainActionModel(youtubeTime: 310, stopTime: 50, restTime: 3, timesDescription: 50, actionDescription: "三垒跑垒员")
            ]),
        TrainListModel(videoImg: "run3", durationLbl: 6, videoTitle: "跑垒胜经(下)", videoDescription: "盗垒", intensity: "入门", videoID: "txOlDk-VRJY", category: .run, actionModel: [
            TrainActionModel(youtubeTime: 346, stopTime: 30, restTime: 1, timesDescription: 60, actionDescription: "盗垒"),
            TrainActionModel(youtubeTime: 378, stopTime: 22, restTime: 5, timesDescription: 60, actionDescription: "蹬起滑垒"),
            TrainActionModel(youtubeTime: 401, stopTime: 20, restTime: 2, timesDescription: 60, actionDescription: "侧向滑垒"),
            TrainActionModel(youtubeTime: 423, stopTime: 21, restTime: 3, timesDescription: 60, actionDescription: "手触滑垒"),
            TrainActionModel(youtubeTime: 446, stopTime: 13, restTime: 3, timesDescription: 60, actionDescription: "扑垒")
            ])
    ]
    
    private let hitArray = [
        TrainListModel(videoImg: "hit1", durationLbl: 4, videoTitle: "打击胜经(上)", videoDescription: "打击教学", intensity: "入门", videoID: "yhGPe4NOViM", category: .hit, actionModel: [
            TrainActionModel(youtubeTime: 34, stopTime: 120, restTime: 4, timesDescription: 120, actionDescription: "击球前准备"),
            TrainActionModel(youtubeTime: 163, stopTime: 80, restTime: 4, timesDescription: 120, actionDescription: "击球")
            ]),
        TrainListModel(videoImg: "hit2", durationLbl: 2, videoTitle: "打击胜经(中)", videoDescription: "觸击教学", intensity: "入门", videoID: "yhGPe4NOViM", category: .hit, actionModel: [
            TrainActionModel(youtubeTime: 250, stopTime: 26, restTime: 3, timesDescription: 60, actionDescription: "触击准备"),
            TrainActionModel(youtubeTime: 165, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "偷袭触击")
            ]),
        TrainListModel(videoImg: "hit3", durationLbl: 8, videoTitle: "打击胜经(下)", videoDescription: "练习法", intensity: "入门", videoID: "yhGPe4NOViM", category: .hit, actionModel: [
            TrainActionModel(youtubeTime: 313, stopTime: 44, restTime: 3, timesDescription: 120, actionDescription: "身体动作"),
            TrainActionModel(youtubeTime: 358, stopTime: 57, restTime: 3, timesDescription: 120, actionDescription: "打击练习1"),
            TrainActionModel(youtubeTime: 418, stopTime: 46, restTime: 3, timesDescription: 120, actionDescription: "打击练习2"),
            TrainActionModel(youtubeTime: 467, stopTime: 54, restTime: 3, timesDescription: 120, actionDescription: "触击练习")
            ])
    ]
    
    private let pitchArray = [
        TrainListModel(videoImg: "pitch1", durationLbl: 5, videoTitle: "投手胜经(上)", videoDescription: "挥臂式投球", intensity: "入门", videoID: "Ba6iRZsoc8k", category: .pitch, actionModel: [
            TrainActionModel(youtubeTime: 32, stopTime: 53, restTime: 7, timesDescription: 60, actionDescription: "投前姿势"),
            TrainActionModel(youtubeTime: 86, stopTime: 56, restTime: 4, timesDescription: 60, actionDescription: "腿部动作"),
            TrainActionModel(youtubeTime: 144, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "投出")
            ]),
        TrainListModel(videoImg: "pitch2", durationLbl: 5, videoTitle: "投手胜经(中)", videoDescription: "固定式投球", intensity: "入门", videoID: "Ba6iRZsoc8k", category: .pitch, actionModel: [
            TrainActionModel(youtubeTime: 228, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "准备动作"),
            TrainActionModel(youtubeTime: 258, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "启动动作")
            ]),
        TrainListModel(videoImg: "pitch3", durationLbl: 3, videoTitle: "投手胜经(下)", videoDescription: "握球方法", intensity: "入门", videoID: "Ba6iRZsoc8k", category: .pitch, actionModel: [
            TrainActionModel(youtubeTime: 283, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "快速球＆变速球"),
            TrainActionModel(youtubeTime: 353, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "曲球＆滑球")
            ])
    ]
    
    private let runArray = [
        TrainListModel(videoImg: "run1", durationLbl: 3, videoTitle: "跑垒胜经(上)", videoDescription: "跑垒", intensity: "入门", videoID: "txOlDk-VRJY", category: .run, actionModel: [
            TrainActionModel(youtubeTime: 30, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "直线跑垒"),
            TrainActionModel(youtubeTime: 65, stopTime: 36, restTime: 5, timesDescription: 60, actionDescription: "直线转弧线"),
            TrainActionModel(youtubeTime: 106, stopTime: 45, restTime: 3, timesDescription: 60, actionDescription: "弧线")
            ]),
        TrainListModel(videoImg: "run2", durationLbl: 3, videoTitle: "跑垒胜经(中)", videoDescription: "离垒回垒", intensity: "入门", videoID: "txOlDk-VRJY", category: .run, actionModel: [
            TrainActionModel(youtubeTime: 165, stopTime: 70, restTime: 5, timesDescription: 70, actionDescription: "一垒跑垒员"),
            TrainActionModel(youtubeTime: 244, stopTime: 60, restTime: 2, timesDescription: 60, actionDescription: "二垒跑垒员"),
            TrainActionModel(youtubeTime: 310, stopTime: 50, restTime: 3, timesDescription: 50, actionDescription: "三垒跑垒员")
            ]),
        TrainListModel(videoImg: "run3", durationLbl: 6, videoTitle: "跑垒胜经(下)", videoDescription: "盗垒", intensity: "入门", videoID: "txOlDk-VRJY", category: .run, actionModel: [
            TrainActionModel(youtubeTime: 346, stopTime: 30, restTime: 1, timesDescription: 60, actionDescription: "盗垒"),
            TrainActionModel(youtubeTime: 378, stopTime: 22, restTime: 5, timesDescription: 60, actionDescription: "蹬起滑垒"),
            TrainActionModel(youtubeTime: 401, stopTime: 20, restTime: 2, timesDescription: 60, actionDescription: "侧向滑垒"),
            TrainActionModel(youtubeTime: 423, stopTime: 21, restTime: 3, timesDescription: 60, actionDescription: "手触滑垒"),
            TrainActionModel(youtubeTime: 446, stopTime: 13, restTime: 3, timesDescription: 60, actionDescription: "扑垒")
            ])
    ]
    
    func getData(_ type: Int) -> [TrainListModel] {
        switch type {
        case 0:
            return allArray
        case 1:
            return hitArray
        case 2:
            return pitchArray
        case 3:
            return runArray
        default:
            return allArray
        }
    }
}
