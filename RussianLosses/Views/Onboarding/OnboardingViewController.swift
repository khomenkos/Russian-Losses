//
//  OnboardingViewController.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 11.07.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Слава Україні!", for: .normal)
            } else {
                nextButton.setTitle("Далі", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "#StandWithUkraine", description: "", image: #imageLiteral(resourceName: "2")),
            OnboardingSlide(title: "#StopRussianAggresion", description: "", image: #imageLiteral(resourceName: "1"))

        ]
        
        pageControl.numberOfPages = slides.count
    }
    

    @IBAction func nextAction(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "MainViewController")
            controller?.modalPresentationStyle = .fullScreen
            //controller?.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarding = true
            present(controller!, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexParh = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexParh, at: .centeredHorizontally, animated: true)
        }
    }
}

    
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
    

