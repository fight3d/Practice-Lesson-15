//
//  UserDetailsViewController.swift
//  Lesson15
//
//  Created by 3droot on 12.11.2020.
//

import UIKit
import Kingfisher


class UserDetailsViewController: UIViewController {
    @IBOutlet weak var userAvatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabelView: UILabel!
    @IBOutlet weak var birthdayLabelView: UILabel!
    @IBOutlet weak var genderLabelView: UILabel!
    @IBOutlet weak var countryLabelView: UILabel!
    @IBOutlet weak var phoneLabelView: UILabel!
    @IBOutlet weak var emailLabelView: UILabel!
    
    var selectedUser: Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = selectedUser?.name.first, let lastName = selectedUser?.name.last{
            nameLabelView.text  = name + " " + lastName
        }
        if let dateString = selectedUser?.dob.date{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            let date = formatter.date(from: dateString)
            formatter.dateFormat = "MMM dd, yyyy"
            birthdayLabelView.text = formatter.string(from: date!)
           
        }
      
        genderLabelView.text = selectedUser?.gender
        countryLabelView.text = selectedUser?.location.country
        phoneLabelView.text = selectedUser?.phone
        emailLabelView.text = selectedUser?.email
        if let imageUrl = selectedUser?.picture.medium {
            let url = URL(string: imageUrl)
            userAvatarImageView.kf.indicatorType = .activity
            userAvatarImageView.kf.setImage(with: url)
        }
      
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
