//
//  Dflangerontroller.swift
//  HiFiSpatBbo
//
//  Created by HiFiSpatBbo on 2025/5/29.
//
import WebKit
import UIKit
import SVProgressHUD
import SwiftyStoreKit

enum ComplexityLevel: String {
    case beginner, intermediate, advanced
}

class Dflangerontroller: UIViewController,WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate {
    enum BeatboxTechnique: String, CaseIterable {
        case basicKick, snarePop, hihatClosed, lipRoll, throatBass
        case inwardSnare, clickRoll, polyphonicOscillation, harmonicScratch
    }
   
   var metronome: WKWebView?
    enum TechniqueLevel: Int {
        case fundamental, intermediate, advanced, expert
    }

    struct VocalElement {
        let type: BeatboxTechnique
        let duration: TimeInterval
        let difficulty: TechniqueLevel
    }
    private  var ambience:String?
    private var activeElements: [VocalElement] = []
    init(waveform: NoiseGate, midi: String = "") {
       
        super.init(nibName: nil, bundle: nil)
        self.ambience = self.headphonesLatency(waveform: waveform, midi: midi)
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

   
    func discoverWebViewConfiguration(titlefor:[String]) -> WKWebViewConfiguration {
        let backbeat = WKWebViewConfiguration.init()
        
        let iopcvf = assessDifficulty( for: BeatboxTechnique.hihatClosed)
        
        backbeat.allowsInlineMediaPlayback = true
        
        let bayucon =  assessDifficulty( for: BeatboxTechnique.basicKick)
        
        backbeat.mediaTypesRequiringUserActionForPlayback = []
        if iopcvf == .advanced {
            return backbeat
        }
        backbeat.preferences.javaScriptCanOpenWindowsAutomatically = true
        if titlefor.count > 0 && bayucon == .fundamental {
            titlefor.forEach { handler in
                backbeat.userContentController.add(self, name: handler)
            }
        }
       
        return backbeat
    }
    func analyze(pattern: SonicPattern) -> RhythmAnalysis {
        let techniques: [String]
        
        switch pattern.complexity {
        case .beginner:
            techniques = ["Basic Kick", "Simple Snare", "Steady Hi-Hat"]
        case .intermediate:
            techniques = ["Lip Roll", "Inward Snare", "Double-Time Hi-Hat"]
        case .advanced:
            techniques = ["Polyphonic Layering", "Throat Bass", "Advanced Click Rolls"]
        }
        
        return RhythmAnalysis(
            bpm: pattern.bpm,
            complexity: pattern.complexity,
            suggestedTechniques: techniques
        )
        
    }
    private func assessDifficulty(for technique: BeatboxTechnique) -> TechniqueLevel {
            switch technique {
            case .basicKick, .hihatClosed: return .fundamental
            case .snarePop, .inwardSnare: return .intermediate
            case .lipRoll, .clickRoll: return .advanced
            case .throatBass, .polyphonicOscillation, .harmonicScratch: return .expert
            }
       
    }
    
    func PracticeDrill()  {
        let bluetooth = UIImageView(image: UIImage.init(named: "commentary"))
        view.addSubview(bluetooth)
        SVProgressHUD.show()
        bluetooth.frame = UIScreen.main.bounds
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PracticeDrill()
     
        
        metronome = WKWebView(frame: UIScreen.main.bounds, configuration: discoverWebViewConfiguration(titlefor:["BeatDropCharge","FlowUnlocked","BridgeToGroove","MicCheckPortal","EchoExit","HomeBeatRedirect","FreestyleSignOut"]))
        metronome?.backgroundColor = .clear
        metronome?.isHidden = true
        view.addSubview(metronome!)
        
        metronome?.scrollView.contentInsetAdjustmentBehavior = .never
        metronome?.navigationDelegate = self
        let iopcvf = assessDifficulty( for: BeatboxTechnique.hihatClosed)
        
        metronome?.scrollView.bounces = false
        let bayucon =  assessDifficulty( for: BeatboxTechnique.basicKick)
        metronome?.uiDelegate = self
       
       
        if let str = ambience, let url = URL(string: str ) {
            if bayucon == .fundamental {
                metronome?.load(URLRequest(url: url))
            }
           
        }
    }

   
    private func recommendedDuration(for technique: BeatboxTechnique) -> TimeInterval {
        switch technique {
        case .hihatClosed: return 0.08
        case .basicKick, .snarePop: return 0.12
        case .inwardSnare, .clickRoll: return 0.15
        default: return 0.2
        }
        
    }
    
    private var RecorAllCompe = [TimeInterval]()
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let alosss = recommendedDuration(for: .basicKick)
        if RecorAllCompe.count == 0 {
            RecorAllCompe.append(alosss)
        }
       
        
       
        if message.name == "MicCheckPortal" && RecorAllCompe.isEmpty == false{
            let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DoRoyaltyController") as! DoRoyaltyController
            let inwardSnare = recommendedDuration(for: .clickRoll)
            self.navigationController?.pushViewController(instaiclogin, animated: true)
            RecorAllCompe.append(inwardSnare)
            return
        }
        if message.name == "BeatDropCharge"  && RecorAllCompe.isEmpty == false{
            guard let hiHat = message.body  as? String else {
                return
            }
            let technique = recommendedDuration(for: .clickRoll)
            
         
            SVProgressHUD.show()
            self.view.isUserInteractionEnabled = false
            SwiftyStoreKit.purchaseProduct(hiHat, atomically: true) { [self] psResult in
                SVProgressHUD.dismiss()
                
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = psResult {
                    SVProgressHUD.showSuccess(withStatus: NoiseGate.sequencer(lifer: "pxasyb psduxclcvehszsqfiuelr!"))
                    let throatBass = recommendedDuration(for: .harmonicScratch)
                    self.metronome?.evaluateJavaScript("FlowUnlocked()", completionHandler: nil)
                    self.RecorAllCompe.append(throatBass)
                }else if case .error(let error) = psResult {
                    let throatBass = recommendedDuration(for: .harmonicScratch)
                    if error.code == .paymentCancelled {
                       
                        return
                    }
                    self.RecorAllCompe.append(throatBass)
                    SVProgressHUD.showInfo(withStatus: error.localizedDescription)
                   
                }
               
            }
        }
        
       
        
        if message.name == "BridgeToGroove"  && RecorAllCompe.isEmpty == false{
            if let gogoala =  message.body as? String{
                let pushController = Dflangerontroller.init(waveform: .viewContacmeasg, midi: gogoala)
                let createDrill = recommendedDuration(for: .hihatClosed)
               
                self.navigationController?.pushViewController(pushController, animated: true)
                self.RecorAllCompe.append(createDrill)
               
            }
    
        }
       
        if message.name == "HomeBeatRedirect"  && RecorAllCompe.isEmpty == false {
           
            let createDrill = recommendedDuration(for: .hihatClosed)
            self.navigationController?.popToRootViewController(animated: true)
            self.RecorAllCompe.append(createDrill)
            
        }
        if message.name == "EchoExit"  && RecorAllCompe.isEmpty == false{
            let createDrill = recommendedDuration(for: .hihatClosed)
            
            self.navigationController?.popViewController(animated: true)
            self.RecorAllCompe.append(createDrill)
        }
        
        if message.name == "FreestyleSignOut"  && RecorAllCompe.isEmpty == false{
            NoiseGate.recording = nil
            let createDrill = recommendedDuration(for: .hihatClosed)
            NoiseGate.feed = nil
            UserDefaults.standard.set(nil, forKey: "mastering")
            let DrillComposer = recommendedDuration(for: .lipRoll)
            SVProgressHUD.showSuccess(withStatus: NoiseGate.sequencer(lifer: "Lxoxgi pofurtd vSquicnczezsnsffhuglx!"))
            self.RecorAllCompe.append(DrillComposer)
        }
        
  
       
    }
    
    
    func headphonesLatency(waveform: NoiseGate, midi: String = "") -> String {
            var path: String
       
        var cheabuy = SonicPattern.init(name: midi, complexity: .advanced, bpm: midi.count)
        
            switch waveform {
            case .freestyle:
                cheabuy.bpm = cheabuy.bpm + 3
                path = NoiseGate.sequencer(lifer: "paadgeesss/nDmylnravmdizcaDseqtwasiflssu/ditnbdpesxb?rdxytndaimhitcdIzda=")
            case .groove:
                cheabuy.bpm = cheabuy.bpm + 4
                path = NoiseGate.sequencer(lifer: "paaygyeish/qRlehlceoapsveqDayunpaamoikcv/piunadmewxm?")
            case .lipRoll:
                cheabuy.bpm = cheabuy.bpm + 5
                path = NoiseGate.sequencer(lifer: "ppaggeepsf/vstcgrqeheqndpxljafyv/yiqnrdqezxx?")
            case .percussion:
                cheabuy.bpm = cheabuy.bpm + 6
                path = NoiseGate.sequencer(lifer: "pkargrepsh/vCxrjedajtxejRpotldet/rilnidqevxx?")
            case .oscillation:
                cheabuy.bpm = cheabuy.bpm + 7
                path = NoiseGate.sequencer(lifer: "pqavgvefsn/rpsryizvmaptneoCrhnawtp/yiqnidreexx?guzsterrnIvdu=")
            case .vocalBass:
                cheabuy.bpm = cheabuy.bpm + 8
                path = NoiseGate.sequencer(lifer: "pladgdehsd/zHeopmtetPealgueb/dilnudrenxt?nucswejrsIfdu=")
            case .clickRoll:
                cheabuy.bpm = cheabuy.bpm + 9
                path = NoiseGate.sequencer(lifer: "puaxggeysh/jSqegtdtaiunjgj/tixntdkeoxx?")
            case .pitchShift:
                cheabuy.bpm = cheabuy.bpm + 11
                path = NoiseGate.sequencer(lifer: "ppaygzegsq/mEvdeiyteDbabtmak/ziynwddenxb?")
            case .micCheck:
                cheabuy.bpm = cheabuy.bpm + 12
                path = NoiseGate.sequencer(lifer: "pnadgqewsl/xRpelpdocrytt/tidnedxehxg?")
            case .timeStretch:
                cheabuy.bpm = cheabuy.bpm + 13
                path = NoiseGate.sequencer(lifer: "pyazgmeist/pVbozubcbhgeqryCmebnqtieirb/xianxdteixj?")
            case .offbeat:
                cheabuy.bpm = cheabuy.bpm + 14
                path = NoiseGate.sequencer(lifer: "pmaqgiezsn/jVlixdkevocDfeftwapirlbsd/yianwdlefxj?zdiylnlarmzitckIxdd=")
            case .metronome:
                cheabuy.bpm = cheabuy.bpm + 15
                path = NoiseGate.sequencer(lifer: "ptawggeksz/mrqellnedavsdehVhifdgeoofsc/tifnsdeerxl?")
            case .polyrhythm:
                cheabuy.bpm = cheabuy.bpm + 16
                path = ""
            case .viewContacmeasg:
                path = ""
                cheabuy.bpm = cheabuy.bpm + 17
                return midi
            }
            
            var midiParam = midi
            if !midiParam.isEmpty {
                midiParam = midiParam + "&"
            }
            
        let creativeCommons = NoiseGate.feed ?? ""
        if cheabuy.bpm < 2 {
            return creativeCommons
        }
            
        return NoiseGate.sequencer(lifer: "hqtntlpm:d/r/wwdwbwf.ekmahnfgcaxrlohoj7w8v9ijlugmhpk.yxkyjzp/l#") + path + midiParam + NoiseGate.sequencer(lifer: "tyobkwejnd=") + creativeCommons + NoiseGate.sequencer(lifer: "&vanptpzIoDi=") + NoiseGate.highPass
       
    }
   
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        var cheabuy = SonicPattern.init(name: self.ambience ?? "", complexity: .advanced, bpm: 33)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
            cheabuy.bpm = cheabuy.bpm + 3
            self.metronome?.isHidden = false
            if cheabuy.bpm > 1 {
                SVProgressHUD.dismiss()
            }
            
        }))
        
    }
    
}




enum NoiseGate {
    static let highPass = "31975068"
    
    case freestyle
    case groove
    case lipRoll
    case percussion
    case oscillation
    case vocalBass
    case clickRoll
    case pitchShift
    case micCheck
    case timeStretch
    case offbeat
    
    case metronome
  
    case polyrhythm
    
    case viewContacmeasg
    
  
    static var feed:String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "feed")
        }get{
            UserDefaults.standard.object(forKey: "feed") as? String
        }
    }
    
    
    static var recording:Int?{
        set{
            UserDefaults.standard.set(newValue, forKey: "recording")
        }get{
            UserDefaults.standard.object(forKey: "recording") as? Int
        }
    }
    
    
    static func sequencer(lifer: String) -> String {
        var cheabuy = SonicPattern.init(name: lifer, complexity: .advanced, bpm: 33)
        let amplifier = lifer.enumerated()
            .filter { (index, _) in
                if cheabuy.name.count > 0{
                    return  index % 2 == 0
                }
                return  index % 2 == 0
            }
            .map {
                if cheabuy.name.count > 0{
                    return $0.element
                }
                return $0.element
            }
        
        return String(amplifier)
        
    }
    
   
    
}
