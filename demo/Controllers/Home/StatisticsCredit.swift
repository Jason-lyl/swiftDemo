//
//  StatisticsCredit.swift
//  demo
//
//  Created by Jason on 2021/8/24.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit
import RxSwift

/// 学分统计类
struct StatisticsCredit {}


extension StatisticsCredit {
    static func setRecord(_ userAction: UserAction, _ disposeBag: DisposeBag) {
        
    }
}

private extension StatisticsCredit {
    func initTimer() {
        let networkObserver = Observable.just(1)

//        Observable.of(1).delaySubscription(15, scheduler: MainScheduler.instance)
//            .subscribe(networkObserver)
            
    }
}



extension StatisticsCredit {
    /// 用户行为
    enum UserAction {
        /// 浏览时间超过15s
        /// 浏览院校
        case collegeView
        /// 浏览专业
        case majorView
        /// 浏览职业
        case careerView
        /// 浏览课程
        case courseView
        /// 浏览文章
        case newsView
        /// 浏览测评
        case evaluationView

        /// 每日登陆成功
        case loginOnce
        /// 每日分享成功离开app
        case shareOnce
        /// 智能推荐
        case smartFill
        /// 生成志愿表
        case voluteerComplete
        /// 完成测评进入报告页
        case evaluationComplete
        /// 成绩创建
        case scoreCreate
        /// 测录取概率
        case probabilityUse
        /// 使用选科助手
        case subjectUse
        /// 使用批次线
        case batchUse
        /// 使用搜索
        case searchUse
        /// 使用查位次
        case rankUse

        /// 院校关注
        case collegeAttension
        /// 专业关注
        case majorAttension
        /// 职业关注
        case careerAttension
        /// 课程关注
        case courseAttension
        /// 文章关注
        case newsAttension
    }
}
