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
        return imageView
    }()
    lazy var lblName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Next-Bold", size: 12)
        label.textColor = .darkGray
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
        imageSerch.heightAnchor.constraint(equalToConstant: 20),
        imageSerch.widthAnchor.constraint(equalToConstant: 20)])
        
        
        NSLayoutConstraint.activate([
            lblName.leftAnchor.constraint(equalTo: self.imageSerch.rightAnchor, constant: 16),
            lblName.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            lblName.heightAnchor.constraint(equalToConstant: 20)
        ])


    }
    
    private func buildUI() {
        self.addSubview(imageSerch)
        self.addSubview(lblName)


    }
    
    public func setupCell(search: Result) {
        imageSerch.setupImage(imageUrl: search.user?.profileImage?.medium ?? "")
        lblName.text = "@\(search.user?.username ?? "username")"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
