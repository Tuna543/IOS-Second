

import UIKit

class CoronaViewController: UIViewController {

    
    
    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myLabel2: UILabel!
    
    
    @IBOutlet weak var myLabel3: UILabel!
    
    
    var t: String = "";
    var liveData = CovidCases(TotalConfirmed: 0, TotalDeaths: 0, TotalRecoverd: 0, NewConfirmed: 0, NewRecovered: 0, NewDeaths: 0)
        
    var covidstatus = CovidCases(TotalConfirmed: 0, TotalDeaths: 0, TotalRecoverd: 0, NewConfirmed: 0, NewRecovered: 0, NewDeaths: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func displaystatus(){
        
        
        URLSession.shared.dataTask(with: URL(string: "https://api.covid19api.com/summary")!,completionHandler: {
            data,response,error in
            guard let liveData = data, error==nil else
            {
                return
            }
            
            var currentStatus: CovidResult?
            do
            {
                currentStatus = try JSONDecoder().decode(CovidResult.self, from: liveData)
            }
            catch{
                print("\(error)")
            }
            guard let finalStatus=currentStatus
            else
            {
                return
            }
            
            let covid = finalStatus.Global
            DispatchQueue.main.async {
                                self.myLabel1.text = String(covid.TotalConfirmed)
                                self.myLabel2.text = String(covid.TotalDeaths)
                                self.myLabel3.text = String(covid.NewDeaths)
            }
            
        }).resume()
    }

}


struct CovidCases: Codable {
    let TotalConfirmed: Int
    let TotalDeaths: Int
    let TotalRecoverd: Int
    let NewConfirmed: Int
    let NewRecovered: Int
    let NewDeaths: Int
    
}

private enum Codingkeys: String,CodingKey{
    case TotalConfirmed,TotalDeath,TotalRecoverd,NewConfirmed,NewRecovered,NewDeaths;
}

struct CovidResult: Codable
{
    let Global: CovidCases
}
