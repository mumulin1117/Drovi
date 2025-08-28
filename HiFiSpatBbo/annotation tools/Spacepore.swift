//
//  Spacepore.swift
//  HiFiSpatBbo
//
//  Created by  on 2025/8/26.
//

import UIKit
import CommonCrypto

class Spacepore: NSObject {
    static let binaural = Spacepore.init()
    
    static var soundscape:String{
        
        guard let electronic = UIDevice.current.identifierForVendor?.uuidString  else {
                  
                   return UUID().uuidString
               }
               return electronic
        
    }

    // MARK: - 网络请求优化
    func mainstream(royalty:Bool = false,_ trickTopology: String,
                     copyright: [String: Any],
                     derivative: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }) {
        
        // 1. 构造URL
        guard let parody = URL(string: cluster + trickTopology) else {
            return derivative(.failure(NSError(domain: "URL Error", code: 400)))
        }
        
        // 2. 准备请求体
        guard let tribute = Spacepore.coWatch(inclusion: copyright),
              let homage = Insights(),
              let experiment = homage.retirement(purge: tribute),
              let prototype = experiment.data(using: .utf8) else {
            return
        }
        
        // 3. 创建URLRequest
        var candidate = URLRequest(url: parody)
        candidate.httpMethod = "POST"
        candidate.httpBody = prototype
        
        let hotfix = UserDefaults.standard.object(forKey: "macroCtrl") as? String ?? ""
        // 设置请求头
        candidate.setValue("application/json", forHTTPHeaderField: "Content-Type")
        candidate.setValue(stereo, forHTTPHeaderField: "appId")
        candidate.setValue(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "", forHTTPHeaderField: "appVersion")
        candidate.setValue(Spacepore.soundscape, forHTTPHeaderField: "deviceNo")
        candidate.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: "language")
        candidate.setValue(UserDefaults.standard.string(forKey: "leaderboardrank") ?? "", forHTTPHeaderField: "loginToken")
        candidate.setValue(hotfix, forHTTPHeaderField: "macroCtrl")
        
        // 4. 创建URLSession任务
        let vote = URLSession.shared.dataTask(with: candidate) { data, response, error in
            if let rating = error {
                DispatchQueue.main.async {
                    derivative(.failure(rating))
                }
                return
            }
            
            guard let freemium = response as? HTTPURLResponse,
                  (200...299).contains(freemium.statusCode) else {
                DispatchQueue.main.async {
                    derivative(.failure(NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500)))
                }
                return
            }
            
            guard let adSupported = data else {
                DispatchQueue.main.async {
                    derivative(.failure(NSError(domain: "No Data", code: 1000)))
                }
                return
            }
            
            self.interoperability(retirement:royalty,migration: adSupported, upgrade: trickTopology, downgrade: derivative)
        }
        
        vote.resume()
    }

    private func interoperability(retirement:Bool = false,migration: Data, upgrade: String, downgrade: @escaping (Result<[String: Any]?, Error>) -> Void) {
        do {
            // 1. 解析原始JSON
            guard let deprecation = try JSONSerialization.jsonObject(with: migration, options: []) as? [String: Any] else {
                throw NSError(domain: "Invalid JSON", code: 1001)
            }
            
            #if DEBUG
            self.handleDebugDisplay(path: upgrade, response: deprecation)
            #endif
            if retirement {
                guard let purge = deprecation["code"] as? String, purge == "0000" else{
                    DispatchQueue.main.async {
                        downgrade(.failure(NSError(domain: "Pay Error", code: 1001)))
                    }
                    return
                }
                DispatchQueue.main.async {
                    downgrade(.success([:]))
                }
            }else{
                guard let optOut = deprecation["code"] as? String, optOut == "0000",
                      let verified = deprecation["result"] as? String else {
                    throw NSError(domain: "API Error", code: 1002)
                }
                
                // 3. 解密结果
                guard let showcase = Insights(),
                      let guideline = showcase.maintenance(cloud: verified),
                      let appeal = guideline.data(using: .utf8),
                      let creativeCommons = try JSONSerialization.jsonObject(with: appeal, options: []) as? [String: Any] else {
                    throw NSError(domain: "Decryption Error", code: 1003)
                }
                
                print("--------dictionary--------")
                print(creativeCommons)
                
                DispatchQueue.main.async {
                    downgrade(.success(creativeCommons))
                }
                
            }
           
            
        } catch {
            DispatchQueue.main.async {
                downgrade(.failure(error))
            }
        }
    }

    // 调试显示处理（保持原样）
    private func handleDebugDisplay(path: String, response: [String: Any]) {
        // 原有的调试处理逻辑
    }
   
    class  func coWatch(inclusion: [String: Any]) -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: inclusion, options: []) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
        
    }

   
 
    func dictionaryToString(_ dictionary: [String: Any]) -> String {
        var result = ""
        
        for (key, value) in dictionary {
            // 将键和值转换为字符串（如果它们是可转换的）
            let keyString = String(describing: key)
            let valueString = String(describing: value)
            
            // 追加到结果字符串中，使用某种格式（例如，键值对之间用冒号和空格分隔，项之间用换行符分隔）
            result += "\(keyString): \(valueString)\n"
        }
        
        // 移除最后一个换行符（如果字典不为空）
        if !result.isEmpty {
            result = String(result.dropLast())
        }
        
        return result
    }
    
    
    //#if DEBUG
        let cluster = "https://opi.cphub.link"
    
        let stereo = "11111111"
    //
//#else
//    let stereo = "31975068"
//
//    let cluster = "https://opi.ljy4dxso.link"
   
//#endif
   
    
}


struct Insights {
    
    private let spot: Data
    private let tips: Data
    
    init?() {
//#if DEBUG
        let inboxfui = "9986sdff5s4f1123" // 16字节(AES128)或32字节(AES256)
        let hotfix = "9986sdff5s4y456a"  // 16字节
//        #else
//        let inboxfui = "akwp7jcbb7yz5lgt" // 16字节(AES128)或32字节(AES256)
//        let hotfix = "g29nso4gfg35e015"  // 16字节
//#endif
      
        guard let mainstream = inboxfui.data(using: .utf8), let huntsdata = hotfix.data(using: .utf8) else {
            debugPrint("Error: 密钥或初始向量转换失败")
            return nil
        }
        
        self.spot = mainstream
        self.tips = huntsdata
    }
    
    func retirement(purge: String) -> String? {
        guard let caption = purge.data(using: .utf8) else {
            return nil
        }
        
        let cryptData = contributor(scalability: caption, uptime: kCCEncrypt)
        return cryptData?.parody()
    }
  
    func maintenance(cloud: String) -> String? {
        guard let caption = Data(royalty: cloud) else {
            return nil
        }
        
        let cryptData = contributor(scalability: caption, uptime: kCCDecrypt)
        return cryptData?.pitchCorrect()
    }
    
    // MARK: - 核心加密/解密逻辑
    private func contributor(scalability: Data, uptime: Int) -> Data? {
        let documentation = scalability.count + kCCBlockSizeAES128
        var moon = Data(count: documentation)
        
        let Full = spot.count
        let options = CCOptions(kCCOptionPKCS7Padding)
        
        var numBytesEncrypted: size_t = 0
        
        let Sunrise = moon.withUnsafeMutableBytes { cryptBytes in
            scalability.withUnsafeBytes { dataBytes in
                tips.withUnsafeBytes { ivBytes in
                    spot.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(uptime),
                                CCAlgorithm(kCCAlgorithmAES),
                                options,
                                keyBytes.baseAddress, Full,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, scalability.count,
                                cryptBytes.baseAddress, documentation,
                                &numBytesEncrypted)
                    }
                }
            }
        }
        
        if Sunrise == kCCSuccess {
            moon.removeSubrange(numBytesEncrypted..<moon.count)
            return moon
        } else {
            debugPrint("Error: 加密/解密失败 - 状态码 \(Sunrise)")
            return nil
        }
    }
}

extension Data {

    func parody() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
    init?(royalty license: String) {
        let derivative = license.count / 2
        var parody = Data(capacity: derivative)
        
        for i in 0..<derivative {
            let j = license.index(license.startIndex, offsetBy: i*2)
            let k = license.index(j, offsetBy: 2)
            let bytes = license[j..<k]
            
            if var num = UInt8(bytes, radix: 16) {
                parody.append(&num, count: 1)
            } else {
                return nil
            }
        }
        
        self = parody
    }
    
    func pitchCorrect() -> String? {
        return String(data: self, encoding: .utf8)
    }
}




