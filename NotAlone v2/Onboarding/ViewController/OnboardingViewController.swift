//
//  OnboardingViewController.swift
//  NotAlone v2
//
//  Created by Максим on 26.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //    MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextTimeButton: ButtonStroke!
    @IBOutlet weak var allowButton: MainButton! {
        didSet { allowButton.setupMainColor() }
    }
    
    @IBOutlet weak var previosSlideButton: ButtonStroke!
    @IBOutlet weak var nextSlideButton: MainButton! {
        didSet { nextSlideButton.setupMainColor() }
    }
    
    //    MARK: - Properties
    var viewModel: OnboardingViewModel = OnboardingViewModel()
    
    //    MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupContent(slides: viewModel.slides)
        bindViewModel()
        self.navigationController?.setupBackground()
    }
    
    deinit {
        print("DEINIT OnboardingViewController")
    }
    
    
    //    MARK: - Fileprivate Func
    
    fileprivate func setupLayout() {
        scrollView.delegate = self
        nextTimeButton.isHidden = true
        allowButton.isHidden = true
        nextSlideButton.isHidden = false
        previosSlideButton.isHidden = true
        view.backgroundColor = UIColor(named: String.colors.bgBlue.rawValue)
    }
    
    //     Update position scrollview when step was change
    fileprivate func bindViewModel(){
        viewModel.step.bind { [weak self] (step) in
            guard let self = self else { return }
            self.scrollView.contentOffset.x = CGFloat(step) * self.view.bounds.width
        }
    }
    
    fileprivate func setupContent(slides: [OnboardingModel]) {
        var contentWith: CGFloat = 0.0
        
        for item in 0...(slides.count-1) {
            let slideView = SlideView()
            slideView.imageView.image = UIImage(named: slides[item].image)
            slideView.titleLabel.text = slides[item].title
            slideView.subTitleLabel.text = slides[item].subTitle
            scrollView.addSubview(slideView)

            let xCoordinate = view.frame.minX + view.frame.width * CGFloat(item)
            contentWith += view.frame.width
            slideView.frame = CGRect(x: xCoordinate, y: 0, width: view.frame.width, height: view.frame.height)
        }
        scrollView.contentSize = CGSize(width: contentWith, height: view.frame.height)
    }
    
    //    Setup isHidden for Buttons of First Slide
        fileprivate func setupStartState() {
            nextSlideButton.isHidden = false
            previosSlideButton.isHidden = true
            nextTimeButton.isHidden = true
            allowButton.isHidden = true
        }
        //    Setup isHidden for Buttons of Slides in the middle
        fileprivate func setupMiddleState() {
            previosSlideButton.isHidden = false
            nextSlideButton.isHidden = false
            nextTimeButton.isHidden = true
            allowButton.isHidden = true
        }
        //    Setup isHidden for Buttons of Final Slide
        fileprivate func setupFinalState() {
            nextSlideButton.isHidden = true
            previosSlideButton.isHidden = true
            nextTimeButton.isHidden = false
            allowButton.isHidden = false
        }
    
    //    MARK: - Actions
    
    @IBAction func nextTimePressed(_ sender: UIButton){
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "AutorizationViewController") else {return}
 
        let icon = String.iconButtonNavBar.back.rawValue
        self.navigationController?.setupIconBack(viewController: self, icon: icon)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func nextSlidePressed(_ sender: UIButton) {
        viewModel.nextButtonPressed()
    }
    
    @IBAction func previosSlidePressed(_ sender: UIButton) {
        viewModel.previewButtonPressed()
    }
}

//  MARK: - Extensions ScrollView Delegate

extension OnboardingViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //  Change pageControl
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(view.frame.width))

        //  Freeze Y-direction of scrollview
        scrollView.contentOffset.y = 0

        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(UIScrollViewDelegate.scrollViewDidEndScrollingAnimation), with: nil, afterDelay: 0.01)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        // Change step
        viewModel.step.value = Int(self.scrollView.contentOffset.x / self.view.bounds.width)

        switch viewModel.step.value {
        case 0:
            setupStartState()
        case (viewModel.slides.count - 1):
            setupFinalState()
        default:
            setupMiddleState()
        }
    }
}


