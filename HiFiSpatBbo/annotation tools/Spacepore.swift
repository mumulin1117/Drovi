//
//  Spacepore.swift
//  HiFiSpatBbo
//
//  Created by mumu on 2025/8/26.
//

import UIKit
import CommonCrypto

class Spacepore: NSObject {
    static let bagging = Spacepore.init()
    
    static var wilderness:String{
        
        guard let expeditions = UIDevice.current.identifierForVendor?.uuidString  else {
                  
                   return UUID().uuidString
               }
               return expeditions
        
    }

    // MARK: - 网络请求优化
    func Guidedrails(whatPath:Bool = false,_ trickTopology: String,
                     trekking: [String: Any],
                     scrambling: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }) {
        
        // 1. 构造URL
        guard let discoveries = URL(string: Interactive + trickTopology) else {
            return scrambling(.failure(NSError(domain: "URL Error", code: 400)))
        }
        
        // 2. 准备请求体
        guard let whimsyWarehouse = Spacepore.hikingbuddies(celebrations: trekking),
              let Outdoor = Insights(),
              let poles = Outdoor.milestones(hik: whimsyWarehouse),
              let Lightweight = poles.data(using: .utf8) else {
            return
        }
        
        // 3. 创建URLRequest
        var memories = URLRequest(url: discoveries)
        memories.httpMethod = "POST"
        memories.httpBody = Lightweight
        
        let Adventure = UserDefaults.standard.object(forKey: "flowueness") as? String ?? ""
        // 设置请求头
        memories.setValue("application/json", forHTTPHeaderField: "Content-Type")
        memories.setValue(companion, forHTTPHeaderField: "appId")
        memories.setValue(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "", forHTTPHeaderField: "appVersion")
        memories.setValue(Spacepore.wilderness, forHTTPHeaderField: "deviceNo")
        memories.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: "language")
        memories.setValue(UserDefaults.standard.string(forKey: "leaderboardrank") ?? "", forHTTPHeaderField: "loginToken")
        memories.setValue(Adventure, forHTTPHeaderField: "flowueness")
        
        // 4. 创建URLSession任务
        let clips = URLSession.shared.dataTask(with: memories) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    scrambling(.failure(error))
                }
                return
            }
            
            guard let Expedition = response as? HTTPURLResponse,
                  (200...299).contains(Expedition.statusCode) else {
                DispatchQueue.main.async {
                    scrambling(.failure(NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500)))
                }
                return
            }
            
            guard let captures = data else {
                DispatchQueue.main.async {
                    scrambling(.failure(NSError(domain: "No Data", code: 1000)))
                }
                return
            }
            
            self.Hikereflections(whatPath:whatPath,reels: captures, selfies: trickTopology, storytelling: scrambling)
        }
        
        clips.resume()
    }

    private func Hikereflections(whatPath:Bool = false,reels: Data, selfies: String, storytelling: @escaping (Result<[String: Any]?, Error>) -> Void) {
        do {
            // 1. 解析原始JSON
            guard let buddies = try JSONSerialization.jsonObject(with: reels, options: []) as? [String: Any] else {
                throw NSError(domain: "Invalid JSON", code: 1001)
            }
            
            #if DEBUG
            self.handleDebugDisplay(path: selfies, response: buddies)
            #endif
            if whatPath {
                guard let partners = buddies["code"] as? String, partners == "0000" else{
                    DispatchQueue.main.async {
                        storytelling(.failure(NSError(domain: "Pay Error", code: 1001)))
                    }
                    return
                }
                DispatchQueue.main.async {
                    storytelling(.success([:]))
                }
            }else{
                guard let partners = buddies["code"] as? String, partners == "0000",
                      let enthusiasts = buddies["result"] as? String else {
                    throw NSError(domain: "API Error", code: 1002)
                }
                
                // 3. 解密结果
                guard let seekers = Insights(),
                      let minded = seekers.Storytelling(hik: enthusiasts),
                      let chatters = minded.data(using: .utf8),
                      let Trekking = try JSONSerialization.jsonObject(with: chatters, options: []) as? [String: Any] else {
                    throw NSError(domain: "Decryption Error", code: 1003)
                }
                
                print("--------dictionary--------")
                print(Trekking)
                
                DispatchQueue.main.async {
                    storytelling(.success(Trekking))
                }
                
            }
           
            
        } catch {
            DispatchQueue.main.async {
                storytelling(.failure(error))
            }
        }
    }

    // 调试显示处理（保持原样）
    private func handleDebugDisplay(path: String, response: [String: Any]) {
        // 原有的调试处理逻辑
    }
   
    class  func hikingbuddies(celebrations: [String: Any]) -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: celebrations, options: []) else {
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
        let Interactive = "https://opi.cphub.link"
    
        let companion = "11111111"
    //
//#else
//    let companion = "31975068"
//
//    let Interactive = "https://opi.ljy4dxso.link"
   
//#endif
   
    
}


struct Insights {
    
    private let spot: Data
    private let tips: Data
    
    init?() {
//#if DEBUG
        let Trail = "9986sdff5s4f1123" // 16字节(AES128)或32字节(AES256)
        let hunts = "9986sdff5s4y456a"  // 16字节
//        #else
//        let Trail = "akwp7jcbb7yz5lgt" // 16字节(AES128)或32字节(AES256)
//        let hunts = "g29nso4gfg35e015"  // 16字节
//#endif
      
        guard let Trailko = Trail.data(using: .utf8), let huntsdata = hunts.data(using: .utf8) else {
            debugPrint("Error: 密钥或初始向量转换失败")
            return nil
        }
        
        self.spot = Trailko
        self.tips = huntsdata
    }
    
    // MARK: - 加密方法
    func milestones(hik: String) -> String? {
        guard let data = hik.data(using: .utf8) else {
            return nil
        }
        
        let cryptData = Meditation(traiol: data, guio: kCCEncrypt)
        return cryptData?.camping()
    }
    
    // MARK: - 解密方法
    func Storytelling(hik: String) -> String? {
        guard let data = Data(Sustainable: hik) else {
            return nil
        }
        
        let cryptData = Meditation(traiol: data, guio: kCCDecrypt)
        return cryptData?.Birdwatching()
    }
    
    // MARK: - 核心加密/解密逻辑
    private func Meditation(traiol: Data, guio: Int) -> Data? {
        let hikinglen = traiol.count + kCCBlockSizeAES128
        var moon = Data(count: hikinglen)
        
        let Full = spot.count
        let options = CCOptions(kCCOptionPKCS7Padding)
        
        var numBytesEncrypted: size_t = 0
        
        let Sunrise = moon.withUnsafeMutableBytes { cryptBytes in
            traiol.withUnsafeBytes { dataBytes in
                tips.withUnsafeBytes { ivBytes in
                    spot.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(guio),
                                CCAlgorithm(kCCAlgorithmAES),
                                options,
                                keyBytes.baseAddress, Full,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, traiol.count,
                                cryptBytes.baseAddress, hikinglen,
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

// MARK: - Data扩展
extension Data {
    // 将Data转换为十六进制字符串
    func camping() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
    // 从十六进制字符串创建Data
    init?(Sustainable hexString: String) {
        let encounters = hexString.count / 2
        var Nature = Data(capacity: encounters)
        
        for i in 0..<encounters {
            let j = hexString.index(hexString.startIndex, offsetBy: i*2)
            let k = hexString.index(j, offsetBy: 2)
            let bytes = hexString[j..<k]
            
            if var num = UInt8(bytes, radix: 16) {
                Nature.append(&num, count: 1)
            } else {
                return nil
            }
        }
        
        self = Nature
    }
    
    // 将Data转换为UTF8字符串
    func Birdwatching() -> String? {
        return String(data: self, encoding: .utf8)
    }
}




