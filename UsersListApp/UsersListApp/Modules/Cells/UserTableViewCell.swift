//
//  UserTableViewCell.swift
//  UsersListApp
//
//  Created by Taimur Mushtaq on 31/01/2023.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {
    //MARK: - Static
    static let identifier = "UserTableViewCell"
    
    //MARK: - IBOutlet
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userCountryLabel: UILabel!
    @IBOutlet weak var joiningDateLabel: UILabel!
}

//MARK: - Helper Methods
extension UserTableViewCell {
    func configureCell(withViewModel viewModel: UserViewModel) {
        userImageView.sd_setImage(with: viewModel.userImageUrl,
                                  placeholderImage: Images.defaultProfile,
                                  options: [.retryFailed, .scaleDownLargeImages])
        userNameLabel.text = viewModel.fullName
        userEmailLabel.text = viewModel.emailAddress
        joiningDateLabel.text = viewModel.formattedJoiningDate
        userCountryLabel.attributedText = viewModel.countryAndCity
        
        selectionStyle = .none
    }
}
