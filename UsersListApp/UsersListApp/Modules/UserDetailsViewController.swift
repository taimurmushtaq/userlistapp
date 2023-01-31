//
//  UserDetailsViewController.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 30/01/2023.
//

import UIKit

class UserDetailsViewController: BaseViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var ageButton: DiamondShapeButton!
    @IBOutlet weak var userPictureImageView: UIImageView!
    @IBOutlet weak var userPictureHightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var joiningDateView: UIView!
    @IBOutlet weak var joinngDateLabel: UILabel!
    
    @IBOutlet weak var dobView: UIView!
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var postCodeView: UIView!
    @IBOutlet weak var postCodeLabel: UILabel!
    
    //MARK: - Properties
    let viewModel: UserDetailsViewModel
    
    //MARK: - Init
    init(viewModel: UserDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "UserDetailsViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
}

extension UserDetailsViewController {
    func loadData() {
        let userViewModel = viewModel.userViewModel
        
        title = userViewModel.fullName
        ageButton.setTitle(userViewModel.userAge, for: .normal)
        userPictureImageView.sd_setImage(with: userViewModel.userLargeImageUrl,
                                         placeholderImage: Images.defaultProfile,
                                         options: [.retryFailed, .scaleDownLargeImages]) { [weak self] image, _, _, _ in
            
            if let size = image?.size {
                self?.userPictureHightConstraint.constant = size.resizeToHeight(UIScreen.main.bounds.width).height
                UIView.animate(withDuration: 0.1, delay: 0.0) {
                    self?.view.layoutIfNeeded()
                }
            }
        }
        
        emailLabel.text = userViewModel.emailAddress
        joinngDateLabel.text = userViewModel.formattedJoiningDate
        dobLabel.text = userViewModel.dob
        
        cityLabel.text = userViewModel.city
        stateLabel.text = userViewModel.state
        countryLabel.text = userViewModel.country
        postCodeLabel.text = userViewModel.postcode
    }
}
