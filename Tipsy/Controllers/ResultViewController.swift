//
//  Tipsy
//
//  Created by Kirill Romanov on 25.09.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var total: String?
    var numberOfPeople: String?
    var tipsPercentage: String?
    

    override func viewDidLoad() {
        totalLabel.text = total
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipsPercentage!)% tip."
        
        super.viewDidLoad()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
