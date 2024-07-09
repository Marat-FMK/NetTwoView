//
//  SizeViewController.swift
//  NetTwoView
//
//  Created by Marat Fakhrizhanov on 09.07.2024.
//

import UIKit

class SizeViewController: UIViewController {
    var doggy:Dog!
    @IBOutlet weak var sizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sizeLabel.text = String(doggy.fileSizeBytes)
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
