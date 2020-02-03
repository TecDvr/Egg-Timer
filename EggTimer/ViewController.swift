import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7] //dictionary
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var readyLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() // stops previous timer so only one runs at a time
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        readyLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            readyLabel.text = "Eggs are cooking"
        } else {
            timer.invalidate()
            readyLabel.text = "Done!"
        }
    }
}
