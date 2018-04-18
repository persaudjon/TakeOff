//
//  ViewController.swift
//  TakeOff
//
//  Created by Jonathan Persaud on 4/18/18.
//  Copyright © 2018 Jonathan Persaud. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var takeOffLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    var player : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")
        let url = URL(fileURLWithPath: path!, isDirectory: true)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch{
            print("Error playing sound!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func powerButtonPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        player.play()
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 20, width: 414, height: 685)
        }) { (finished) in
            self.takeOffLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    

}

