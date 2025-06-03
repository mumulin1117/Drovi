//
//  BeatboxAcademyController.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//

import UIKit
import SVProgressHUD

class BeatboxAcademyController: UIViewController {
    static  var timeStretch:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()//user
    static  var vocalBass:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>()//dym
    

    
    
    @IBOutlet weak var useAmbassador: UIButton!
    
    
    @IBOutlet weak var cluster: UICollectionView!
    
    @IBOutlet weak var microservice: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateInitialPatterns()
        useAmbassador.roundEditorCorners(editorradius: 24)
        detectVocalElements()
        
        
        
       
        
       
    }
    

   
    @IBAction func leaderboard(_ sender: UIButton) {
        
        if NoiseGate.feed == nil {
            let alertLogin = UIAlertController.init(title: "Join the Beatbox Community", message: "Sign in to unlock full features and connect with beatboxers worldwide", preferredStyle: .alert)
            alertLogin.addAction(UIAlertAction(title: "Sign In Now", style: .default, handler: { alert in
                let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DoRoyaltyController") as! DoRoyaltyController
                
                self.navigationController?.pushViewController(instaiclogin, animated: true)
            }))
            alertLogin.addAction(UIAlertAction(title: "cancel", style: .default))
            self.present(alertLogin, animated: true)
        }else{
            
            let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DoSponsorController") as! DoSponsorController
            
            self.navigationController?.pushViewController(instaiclogin, animated: true)
        }
        
       
    }
    
    
    func generateInitialPatterns() {
        cluster.delegate = self
        cluster.showsHorizontalScrollIndicator = false
        
        let col = UICollectionViewFlowLayout()
        col.itemSize = CGSize(width: 56, height: 85)
        
        cluster.isPagingEnabled = true
        col.scrollDirection = .vertical
        col.minimumInteritemSpacing = 32
        col.minimumLineSpacing = 32
        cluster.collectionViewLayout = col
    }
    
    
    func detectVocalElements() {
        cluster.dataSource = self
        cluster.register(UINib.init(nibName: "DovEditorCell", bundle: nil), forCellWithReuseIdentifier: "DovEditorCell")
        
        cluster.showsVerticalScrollIndicator = false
        
        
        
        microservice.delegate = self
        microservice.showsHorizontalScrollIndicator = false
        
        let col = UICollectionViewFlowLayout()
        col.itemSize = CGSize(width: UIScreen.main.bounds.width - 101 - 10, height: 300)
        
        microservice.isPagingEnabled = true
        col.scrollDirection = .vertical
        col.minimumInteritemSpacing = 10
        col.minimumLineSpacing = 10
        microservice.collectionViewLayout = col
        microservice.dataSource = self
        microservice.register(UINib.init(nibName: "DovMaintenance_Cell", bundle: nil), forCellWithReuseIdentifier: "DovMaintenance_Cell")
        microservice.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        microservice.showsVerticalScrollIndicator = false
    }
}


extension BeatboxAcademyController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.cluster {
            return BeatboxAcademyController.timeStretch.count
        }else{
           let count = BeatboxAcademyController.vocalBass.filter { studio in
               studio["subBass"] as? String == nil || studio["subBass"] as? String == ""
            }.count
            return count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.cluster {
            let bboxce = collectionView.dequeueReusableCell(withReuseIdentifier: "DovEditorCell", for: indexPath) as! DovEditorCell
            bboxce.transientEenvelope(patam: BeatboxAcademyController.timeStretch[indexPath.row])
            return bboxce
        }else{
            let bboxce = collectionView.dequeueReusableCell(withReuseIdentifier: "DovMaintenance_Cell", for: indexPath) as! DovMaintenance_Cell
            
            bboxce.showcaseArchive.addTarget(self, action: #selector(autoTune), for: .touchUpInside)
            let lsit = BeatboxAcademyController.vocalBass.filter { studio in
                studio["subBass"] as? String == nil || studio["subBass"] as? String == ""
            }
            
            bboxce.transientEenvelope(patam: lsit[indexPath.row])
            return bboxce
        }
        
        
    }
    
    @objc func autoTune()  {
        self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .micCheck), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.cluster {
            guard let iser = BeatboxAcademyController.timeStretch[indexPath.row]["loop"] as? Int else {
                return
            }
            self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .vocalBass, midi: "\(iser)"), animated: true)
            return
        }
        
       let list = BeatboxAcademyController.vocalBass.filter { studio in
           studio["subBass"] as? String == nil || studio["subBass"] as? String == ""
        }
        guard let iserDum = list[indexPath.row]["articulation"] as? Int else {
            return
        }
        self.navigationController?.pushViewController(Dflangerontroller.init(waveform: .freestyle, midi: "\(iserDum)"), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchchilzlwei()
        if let miean =  UserDefaults.standard.object(forKey: "mastering") as? String {
            useAmbassador.sd_setBackgroundImage(with: URL.init(string: miean), for: .normal)
        }
    }
    
    func fetchchilzlwei()  {
       
        
       
        BeatboxAcademyController.sonicHarmonyBridge(waveformComponents: ["siren":NoiseGate.recording ?? 0], resonanceFrequency: "/xblflgsivz/chilzlwei") { complexity in
            
            guard
                   let splicing = complexity as? Dictionary<String,Any> ,
                 
                    let mixing = splicing["data"] as? Array<Dictionary<String,Any>>
                    
            else {
           
                
                return
            }
            
            BeatboxAcademyController.timeStretch = mixing
            
            self.cluster.reloadData()
           
            
        } dissonanceHandler: { errt in
        
            SVProgressHUD.showError(withStatus: errt.localizedDescription)
        }
        
        
        
        SVProgressHUD.show()
        BeatboxAcademyController.sonicHarmonyBridge(waveformComponents: ["amplitude":1,"frequency":15,"equalizer":1], resonanceFrequency: "/xlgljipz/ycrpzqodkuoijd") { complexity in
            SVProgressHUD.dismiss()
            guard
                   let splicing = complexity as? Dictionary<String,Any> ,
                 
                    let mixing = splicing["data"] as? Array<Dictionary<String,Any>>
                    
            else {
           
                
                return
            }
            print(mixing)
            BeatboxAcademyController.vocalBass = mixing
            self.microservice.reloadData()
            
        } dissonanceHandler: { errt in
            
            SVProgressHUD.showError(withStatus: errt.localizedDescription)
        }
    }
    
    // MARK: - 声波传输协调器
    class func sonicHarmonyBridge(waveformComponents: [String: Any],
        resonanceFrequency: String,
        
        harmonicCompletion: ((Any?) -> Void)?,
        dissonanceHandler: ((Error) -> Void)?
    ) {
        // 1. 构建谐波路径
        let quantumResonator = "http://www.kangaroo789jump.xyz/backone" + resonanceFrequency
        
        // 2. 频率验证
        guard let vibrationChamber = URL(string: quantumResonator) else {
            let interferencePattern = NSError(
                domain: "HarmonicError",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Resonance path failure: \(quantumResonator)"]
            )
            dissonanceHandler?(interferencePattern)
            return
        }
        
        // 3. 准备声波调制器
        var frequencyModulator: [String: String] = [:]
        frequencyModulator.updateValue("application/json", forKey: "Content-Type")
        frequencyModulator.updateValue("application/json", forKey: "Accept")
        frequencyModulator["key"] = NoiseGate.appID
        frequencyModulator["token"] = NoiseGate.feed
        
        // 4. 配置量子载体
        var quantumPacket = URLRequest(
            url: vibrationChamber,
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 30
        )
        quantumPacket.httpMethod = ["P", "O", "S", "T"].map { String($0) }.joined()
        
        for (field, value) in frequencyModulator {
            quantumPacket.setValue(value, forHTTPHeaderField: field)
        }
        
        // 5. 编码波形数据
        do {
            let encodedWaves = try JSONSerialization.data(
                withJSONObject: waveformComponents,
                options: []
            )
            quantumPacket.httpBody = encodedWaves
        } catch let encodingError {
            let waveCollapse = NSError(
                domain: "EncodingError",
                code: -5,
                userInfo: [
                    NSLocalizedDescriptionKey: "Waveform collapse during encoding",
                    NSUnderlyingErrorKey: encodingError
                ]
            )
            dissonanceHandler?(waveCollapse)
            return
        }
        
        // 6. 初始化共振会话
        let resonanceSession = { () -> URLSession in
            let quantumConfig = URLSessionConfiguration.ephemeral
            quantumConfig.timeoutIntervalForRequest = 30
            quantumConfig.timeoutIntervalForResource = 60
            return URLSession(configuration: quantumConfig)
        }()
        
        // 7. 启动量子传输
        resonanceSession.dataTask(with: quantumPacket) {
            rawFrequency, resonanceResponse, quantumError in
            
            DispatchQueue.main.async {
                // 8. 处理量子干扰
                if let quantumError = quantumError {
                    dissonanceHandler?(quantumError)
                    return
                }
                
                // 9. 验证谐波响应
                guard let standingWave = resonanceResponse as? HTTPURLResponse else {
                    let nullResonance = NSError(
                        domain: "NullHarmonicError",
                        code: -2,
                        userInfo: [NSLocalizedDescriptionKey: "Resonance feedback failure"]
                    )
                    dissonanceHandler?(nullResonance)
                    return
                }
                
                // 10. 检查原始频率数据
                guard let frequencyData = rawFrequency, frequencyData.count > 0 else {
                    let silentWave = NSError(
                        domain: "SilenceError",
                        code: -3,
                        userInfo: [NSLocalizedDescriptionKey: "Empty frequency spectrum"]
                    )
                    dissonanceHandler?(silentWave)
                    return
                }
                
                // 11. 解码谐波模式
                do {
                    let harmonicPattern = try JSONSerialization.jsonObject(
                        with: frequencyData,
                        options: [.mutableLeaves]
                    )
                    harmonicCompletion?(harmonicPattern)
                } catch let decodingError {
                    let patternDisruption = NSError(
                        domain: "DecoherenceError",
                        code: -4,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Harmonic pattern disruption",
                            "rawFrequencySample": String(data: frequencyData.prefix(100), encoding: .utf8) ?? "White noise",
                            "resonanceNotes": decodingError
                        ]
                    )
                    dissonanceHandler?(patternDisruption)
                }
            }
        }.resume()
    }
}
