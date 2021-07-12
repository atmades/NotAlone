//
//  OnboardingModel.swift
//  NotAlone v2
//
//  Created by Максим on 26.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation

struct OnboardingModel {
    var title: String
    var subTitle: String
    var image: String
    
    static func getData() -> [OnboardingModel] {
        return [
            OnboardingModel(title: "Выбирайте события",
                            subTitle: "Выбери событие, которое тебе подходит, свяжись с организатором и начинай помогать!",
                            image: "onboarding1"),
            OnboardingModel(title: "Фильтры событий",
                            subTitle: "Определись с направлением, а мы покажем только интересные вам события ",
                            image: "onboarding2"),
            OnboardingModel(title: "Создавайте свои",
                            subTitle: "Если вам нужна помощь, или вы хотите стать организатором мероприятия",
                            image: "onboarding3"),
            OnboardingModel(title: "Оповещения",
                            subTitle: "Планируйте добрые дела заранее, мы будем оповещать о событиях, которые происходят рядом с вами!",
                            image: "onboarding4")]
    }
}
