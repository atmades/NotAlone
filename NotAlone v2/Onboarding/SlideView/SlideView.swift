//
//  SlideView.swift
//  NotAlone v2
//
//  Created by Максим on 26.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation
import UIKit

class SlideView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.textColor = UIColor(named: String.colors.textHeaderPuprle.rawValue)
        }
    }
    @IBOutlet weak var subTitleLabel: TexType! {
        didSet{
            subTitleLabel.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
       
    }

    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "SlideView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
}


