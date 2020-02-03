import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7] //dictionary
    
    var counter = 60
    
    var timer = Timer()
    
    @IBOutlet weak var readyLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 1
        
        timer.invalidate() // stops previous timer so only one runs at a time
        
        let hardness = sender.currentTitle!
        
        counter = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() { // @objc refers to objective-c
        if counter > 0 { // add 'almost done' logic
            print("\(counter) seconds.")
            counter -= 1
            readyLabel.text = "Eggs are cooking"
        } else if counter == 0 {
            timer.invalidate()
            readyLabel.text = "Done!"
        }
    }
}
