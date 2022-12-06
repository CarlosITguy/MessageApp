//
//  ContactsTableViewCell.swift
//  Messenger
//
//  Created by Consultant on 12/5/22.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    lazy var chatMessanges : UILabel = {
        let chM = UILabel(frame: .zero)
        chM.text = "Default"
        chM.backgroundColor = .purple
        chM.numberOfLines = 0
        chM.translatesAutoresizingMaskIntoConstraints = false
        
        return chM
}()
 
    
    func setupLabel(){
        backgroundColor = .yellow
        contentView.addSubview(self.chatMessanges)
        
        let cht = self.chatMessanges
        cht.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 15).isActive = true
        cht.topAnchor.constraint(equalTo: contentView.topAnchor ,constant: 8).isActive = true
//        cht.trailingAnchor.constraint(equalTo: contentView.trailingAnchor ,constant: -15).isActive = true
        cht.bottomAnchor.constraint(equalTo: contentView.bottomAnchor ,constant: -8).isActive = true
        cht.widthAnchor.constraint(equalToConstant: 300 ).isActive = true
        cht.heightAnchor.constraint(equalToConstant: 130 ).isActive = true
        cht.numberOfLines = 0


        self.chatMessanges = cht
        
    }
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupLabel()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
