//
//  TeamDetailsPresenter.swift
//  Football Fixture
//
//  Created by user on 30/08/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
//import RealmSwift

class TeamDetailsPresenter: BaseViewController{
    
    @IBOutlet weak var teamCollectionView: UICollectionView!
    var selectedIndex = 0
    var ids: Int!
    enum cardState{
        case expanded
        case collapsed
    }
    var OneTeamDetailsViewController: SquadViewController!
    var rootTeamContainer = TeamsModel.TeamList
    private let rootViewHeight:CGFloat = 500
    private let topViewHeight:CGFloat  = 150
    
    //var teamsListViewModel :TeamListViewModel!
    //private var webservice :TeamRemoteImpl = TeamRemoteImpl(config: .default)
    //var teamViewModel: ITeamViewModel?
    var cardVisible = false
    var nextState: cardState {
        return cardVisible ? .collapsed : .expanded
        
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
//    override func getViewModel() -> BaseViewModel {
//                 return self.teamViewModel as! BaseViewModel
//             }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teamCollectionView.dataSource = self
        self.teamCollectionView.delegate = self
//           self.teamsListViewModel = TeamListViewModel(webservice: webservice) {
//                self.teamCollectionView.reloadData()
//            }
        
        let itemsize = UIScreen.main.bounds.width/3 - 3
        let layOut = UICollectionViewFlowLayout()
        layOut.sectionInset = UIEdgeInsets(top: 0, left: 2, bottom: 10, right: 2)
        layOut.itemSize = CGSize(width: itemsize, height: itemsize)
        
        layOut.minimumInteritemSpacing = 2
        layOut.minimumLineSpacing = 2
        
        teamCollectionView.collectionViewLayout = layOut
        
        
 
        
        
       
        //        setEmptyView(title: "No team is avaliable for this competition", message: "Avaliable team will show here", messageImage: #imageLiteral(resourceName: "swipe-right (1)"))
        
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
      //self.setEmptyView(title:  "No team is avaliable for this competition", message: "Avaliable team will show here", messageImage: #imageLiteral(resourceName: "swipe-right (1)"))
         self.teamCollectionView.reloadData()
        
    }


    @objc
    func handleEstimatedTap(recognzier:UIGestureRecognizer){
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.5)
        default:
            break
        }
    }
    @objc
    func handleEstimatedPan(recognizer:UIPanGestureRecognizer){
        switch recognizer.state {
        case .began:
            // startTransition
            startInteractiveTransition(state: nextState, duration: 0.5)
        case .changed:
            // updateTransition
            let translation = recognizer.translation(in: self.OneTeamDetailsViewController.navBarTitle)
            var franctionCompleted = translation.y / rootViewHeight
            franctionCompleted = cardVisible ? franctionCompleted : -franctionCompleted
            updateInteractiveTransition(fractionCompleted: franctionCompleted)
        case .ended:
            // continueTransition
            continueInteractiveTransition()
        default:
            break
        }
    }
    func animateTransitionIfNeeded(state:cardState, duration:TimeInterval){
        if runningAnimations.isEmpty{
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case.expanded:
                    self.OneTeamDetailsViewController.view.frame.origin.y = self.view.frame.height - self.rootViewHeight
                case .collapsed:
                    self.OneTeamDetailsViewController.view.frame.origin.y = self.view.frame.height - self.topViewHeight
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.OneTeamDetailsViewController.view.layer.cornerRadius = 20
                case .collapsed:
                    self.OneTeamDetailsViewController.view.layer.cornerRadius = 0
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
        }
        
    }
    
    func startInteractiveTransition(state:cardState, duration:TimeInterval){
        if runningAnimations.isEmpty{
            // running animations
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animate in runningAnimations {
            animate.pauseAnimation()
            animationProgressWhenInterrupted = animate.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat){
        for animate in runningAnimations{
            animate.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition(){
        for animate in runningAnimations{
            animate.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
//    func setEmptyView(title: String, message: String, messageImage: UIImage) {
//        self.teamCollectionView.reloadData()
//        let emptyView = UIView(frame: CGRect(x: teamCollectionView.center.x, y: teamCollectionView.center.y, width: teamCollectionView.bounds.size.width, height: teamCollectionView.bounds.size.height))
//
//        let messageImageView = UIImageView()
//        let titleLabel = UILabel()
//        let messageLabel = UILabel()
//
//        messageImageView.backgroundColor = .clear
//
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        messageImageView.translatesAutoresizingMaskIntoConstraints = false
//        messageLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        titleLabel.textColor = UIColor.black
//        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
//
//        messageLabel.textColor = UIColor.lightGray
//        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
//
//        emptyView.addSubview(titleLabel)
//        emptyView.addSubview(messageImageView)
//        emptyView.addSubview(messageLabel)
//
//        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
//        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -20).isActive = true
//        messageImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        messageImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//
//        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
//        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
//
//        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
//        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
//
//        messageImageView.image = messageImage
//        titleLabel.text = title
//        messageLabel.text = message
//        messageLabel.numberOfLines = 0
//        messageLabel.textAlignment = .center
//
//        UIView.animate(withDuration: 1, animations: {
//
//            messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
//        }, completion: { (finish) in
//            UIView.animate(withDuration: 1, animations: {
//                messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
//            }, completion: { (finishh) in
//                UIView.animate(withDuration: 1, animations: {
//                    messageImageView.transform = CGAffineTransform.identity
//                })
//            })
//
//        })
//        if (teamsListViewModel.teams.isEmpty){
//            teamCollectionView.backgroundView = emptyView
//            teamCollectionView.indicatorStyle = .default
//        }else{
//            teamCollectionView.backgroundView = nil
//            teamCollectionView.indicatorStyle = .default
//        }
//
//    }
    
}
extension TeamDetailsPresenter: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeamsModel.TeamList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamcell", for: indexPath) as? TeamsCollectionViewCell
        selectedIndex = (indexPath.row)
        //let team =  teamsListViewModel.teams[indexPath.row]
        //cell?.team = team
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = (indexPath.row)
        
        //let team = teamsListViewModel.teams[indexPath.row]
        //let id = team.id
//        if id != 0 {
//            OneTeamDetailsViewController = self.storyboard!.instantiateViewController(withIdentifier: "OneTeamDetailsPresenter") as? SquadViewController
//            //OneTeamDetailsViewController.teamc = self.teamsListViewModel.teams[self.selectedIndex]
//            //SquadViewModel.id = id!
//            OneTeamDetailsViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - topViewHeight, width: self.view.bounds.width, height: rootViewHeight)
//            OneTeamDetailsViewController.view.clipsToBounds = true
//            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TeamDetailsPresenter.handleEstimatedTap(recognzier:)))
//            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(TeamDetailsPresenter.handleEstimatedPan(recognizer:)))
//            OneTeamDetailsViewController.navBarTitle.addGestureRecognizer(tapGestureRecognizer)
//            OneTeamDetailsViewController.navBarTitle.addGestureRecognizer(panGestureRecognizer)
//
//            self.present(OneTeamDetailsViewController, animated: true, completion: nil)
//
//
//        }
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}
//extension TeamDetailsPresenter: BonsaiControllerDelegate {
//
//    // return the frame of your Bonsai View Controller
//    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
//
//        return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 6), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / (1/3)))
//    }
//
//    // return a Bonsai Controller with SlideIn or Bubble transition animator
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//
//        // Slide animation from .left, .right, .top, .bottom
//        return BonsaiController(fromDirection: .bottom, blurEffectStyle: .dark, presentedViewController: presented, delegate: self)
//
//
//
//        // or Bubble animation initiated from a view
////        return BonsaiController(fromView: UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100)), blurEffectStyle: .dark,  presentedViewController: presented, delegate: self)
//   }
//}



