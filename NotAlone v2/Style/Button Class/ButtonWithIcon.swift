//
//  ButtonWithIcon.swift
//  NotAlone v2
//
//  Created by Максим on 09.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

//@IBDesignable

class ButtonWithIcon: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
  
    func setupWithEnum(with button: ButtonsWithIconEnum?){
        backgroundColor = UIColor.white
        layer.cornerRadius = 6
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        setInsets(forContentPadding: .init(top: 10, left: 0, bottom: 10, right: 0), imageTitlePadding: 10)
        
        guard let button = button else { return }
        switch button {
        case .vkontakte:
            setTitle(String.titleButtonWithImage.vkontakte.rawValue, for: .normal)
            setTitleColor(UIColor(named: String.colors.vkontakte.rawValue), for: .normal)
            setImage(UIImage(named: String.images.vkontacte.rawValue), for: .normal)
        case .facebook:
            setTitle(String.titleButtonWithImage.facebook.rawValue, for: .normal)
            setTitleColor(UIColor(named: String.colors.facebook.rawValue), for: .normal)
            setImage(UIImage(named: String.images.facebook.rawValue), for: .normal)
        }
    }
    
    func setupMenuSocial(with button: ButtonsWithIconEnum){
        backgroundColor = UIColor(named: String.colors.bgBlue.rawValue)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        setInsets(forContentPadding: .init(top: 10, left: 0, bottom: 10, right: 0), imageTitlePadding: 10)
        
        switch button {
        case .vkontakte:
            setTitle(String.titleButtonWithImage.vkontakte.rawValue, for: .normal)
            setTitleColor(UIColor(named: String.colors.vkontakte.rawValue), for: .normal)
            setImage(UIImage(named: String.images.vkontacte.rawValue)?.withRenderingMode(.alwaysOriginal), for: .normal)
        case .facebook:
            setTitle(String.titleButtonWithImage.facebook.rawValue, for: .normal)
            setTitleColor(UIColor(named: String.colors.facebook.rawValue), for: .normal)
            setImage(UIImage(named: String.images.facebook.rawValue)?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    func setupMenuButton(with item: SlideMenu) {
        backgroundColor = UIColor.white
        contentHorizontalAlignment = .left
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        setInsets(forContentPadding: .init(top: 10, left: 0, bottom: 10, right: 0), imageTitlePadding: 30)
        
        setTitle(set(item).name, for: .normal)
        setTitleColor(UIColor(named: String.colors.primary.rawValue), for: .normal)
        setImage(UIImage(named: set(item).icon)?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    fileprivate func set(_ item: SlideMenu) -> (name: String, icon: String) {
        switch item {
        case .map(let name, let icon):
            return (name,icon)
        case .filters(let name, let icon):
            return (name,icon)
        case .settings(let name, let icon):
            return (name,icon)
        case .showOnMap(let name, let icon):
            return (name,icon)
        }
    }
}


