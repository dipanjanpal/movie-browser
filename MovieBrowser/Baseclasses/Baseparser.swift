

import Foundation
import UIKit
class Baseparser{
    
    class func postURLRequest( endpoint : String, params : [String: Any], header : [String : String], completion: @escaping (Bool, Data?, Error?) -> Void)
    {
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let url = Common.BASEURL + endpoint
        print("\n \n Api hitting ===>>>",url)
        let myURL = URL(string: url)
        let mysession = URLSession.shared
        let mytask = mysession.dataTask(with: myURL!) { (data, response, error) in
            if error != nil
            {
                print(error ?? "error")
                DispatchQueue.main.async {
                    completion(false, nil, error )
                }
            }
            else
            {   DispatchQueue.main.async {
                completion(true, data, nil)
                }
            }
        }
        mytask.resume()
        
        
    }
    
    
}
