//
//  UserListCellView.swift
//  UITableviewProgramatically
//
//  Created by admin on 28/03/2022.
//

import UIKit

class UserListCellView: UITableViewCell {
    
    lazy var userListView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.clipsToBounds = true
         return view
     }()
    
    lazy var userimageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        return image
    }()
    lazy var emailLabel: UILabel = {
        let email = UILabel()
        email.font = UIFont.boldSystemFont(ofSize: 20)
        email.textColor = .black
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    lazy var fnameLable: UILabel = {
        let firstName = UILabel()
        firstName.font = UIFont.boldSystemFont(ofSize: 20)
        firstName.textColor = .black
        firstName.translatesAutoresizingMaskIntoConstraints = false
        return firstName
    }()
    lazy var lnameLable: UILabel = {
        let lastName = UILabel()
        lastName.font = UIFont.boldSystemFont(ofSize: 20)
        lastName.textColor = .black
        lastName.translatesAutoresizingMaskIntoConstraints = false
        return lastName
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
    
        userListView.addSubview(userimageView)
        userListView.addSubview(emailLabel)
        userListView.addSubview(fnameLable)
        userListView.addSubview(lnameLable)
        self.contentView.addSubview(userListView)
        
        userListView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        userListView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        userListView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        userListView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        userimageView.topAnchor.constraint(equalTo: self.userListView.topAnchor).isActive = true
        userimageView.leadingAnchor.constraint(equalTo: self.userListView.leadingAnchor, constant: 10).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: self.userListView.topAnchor).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: self.userimageView.trailingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: self.userListView.trailingAnchor).isActive = true
        
        fnameLable.topAnchor.constraint(equalTo:self.emailLabel.bottomAnchor).isActive = true
        fnameLable.leadingAnchor.constraint(equalTo:self.userimageView.trailingAnchor).isActive = true
        fnameLable.trailingAnchor.constraint(equalTo:self.userListView.trailingAnchor).isActive = true
        
        lnameLable.topAnchor.constraint(equalTo:self.fnameLable.bottomAnchor).isActive = true
        lnameLable.leadingAnchor.constraint(equalTo:self.userimageView.trailingAnchor).isActive = true
        lnameLable.trailingAnchor.constraint(equalTo:self.userListView.trailingAnchor).isActive = true
}
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
}
}
