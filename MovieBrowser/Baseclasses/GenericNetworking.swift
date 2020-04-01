

import Foundation
class BaseNetwork
{
    class func parse<T : Decodable>(endpoint : String, dataToPost : [String : Any], header : [String:String] , instanceTypeToBeDecoded : T, completion : @escaping (T) -> Void ){
        Baseparser.postURLRequest(endpoint : endpoint,  params: dataToPost, header: header) { (success, data, error) in
            if success{
                do {
                    //let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    //print("expected json ===>>>",json)
                    var modelT = instanceTypeToBeDecoded
                    modelT = try JSONDecoder().decode(T.self, from: data!)
                    print("\n \n after parse ===>>>", modelT)
                    print("\n \n")
                    completion(modelT)
                }
                catch let err {
                    print("\n \n Api decoding error ===>>>",err)
                }
            }
            else{
                print("\n \n Api parsing error ===>>>", error ?? "some error")
            }
        }
    }
}
