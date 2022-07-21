//
//  SearchViewCell.swift
//  UpaxTestApp
//
//  Created by coppel on 20/07/22.
//

import UIKit

class SearchViewCell: UITableViewCell {
    
    lazy var imageSerch : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    lazy var lblUsername : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Next-Bold", size: 12)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var lblFirstName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Next-Bold", size: 12)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var lblLastName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Next-Bold", size: 12)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var lblDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Next-Bold", size: 12)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.buildUI()
        self.buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
        imageSerch.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        imageSerch.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
        imageSerch.heightAnchor.constraint(equalToConstant: 50),
        imageSerch.widthAnchor.constraint(equalToConstant: 50)])
        
        
        NSLayoutConstraint.activate([
            lblUsername.leftAnchor.constraint(equalTo: self.imageSerch.rightAnchor, constant: 16),
            lblUsername.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            lblUsername.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lblFirstName.leftAnchor.constraint(equalTo: self.imageSerch.rightAnchor, constant: 16),
            lblFirstName.topAnchor.constraint(equalTo: self.lblUsername.bottomAnchor, constant: 8),
            lblFirstName.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            lblLastName.leftAnchor.constraint(equalTo: self.lblFirstName.rightAnchor, constant: 4),
            lblLastName.topAnchor.constraint(equalTo: self.lblUsername.bottomAnchor, constant: 8),
            lblLastName.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lblDescription.leftAnchor.constraint(equalTo:  self.leftAnchor, constant: 16),
            lblDescription.rightAnchor.constraint(equalTo:  self.rightAnchor, constant: -16),
            lblDescription.topAnchor.constraint(equalTo: self.lblFirstName.bottomAnchor, constant: 16),
            lblDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])

    }
    
    private func buildUI() {
        self.addSubview(imageSerch)
        self.addSubview(lblUsername)
        self.addSubview(lblFirstName)
        self.addSubview(lblLastName)
        self.addSubview(lblDescription)


    }
    
    public func setupCell(search: Result) {
        imageSerch.setupImage(imageUrl: search.user?.profileImage?.medium ?? "")
        lblUsername.text = "@\(search.user?.username ?? "username")"
        lblFirstName.text = "\(search.user?.firstName ?? "first_name")"
        lblLastName.text = "\(search.user?.lastName ?? "last_name")"
        lblDescription.text = "\(search.description ?? "description")"


    }
    
    public func prefetch(search: Result) {
        imageSerch.setupImage(imageUrl: search.user?.profileImage?.medium ?? "")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
