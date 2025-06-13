//
//  DoRoyaltyController.swift
//  HiFiSpatBbo
//
//  Created by  on 2025/5/29.
//
import SVProgressHUD
import UIKit
protocol AudioEffect {
    var intensity: Float { get set }
}
struct StagePreset {
    let name: String
    let reverbLevel: Float
    var delayTime: Double
    var eqProfile: (bass: Float, mid: Float, treble: Float)
    let lightingPattern: LightingStyle
}
class DoRoyaltyController: UIViewController {
    private var vocalChain: [AudioEffect] = []
    @IBOutlet weak var bandPol: UIButton!
    
    @IBOutlet weak var noiseGate: UITextField!
    
    @IBOutlet weak var survey: UITextField!
    private var activePreset: StagePreset?
       
    
    @IBOutlet weak var PisingkinsegiNmen: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        survey.rightViewMode = .always
        Juaok()
        survey.rightView = UIView(frame: CGRect.init(x: 0, y: 0, width: 35, height: 45))
    }
    func configureForPreset(_ preset: StagePreset) {
            activePreset = preset
            rebuildVocalChain()
       
    }
    
    func Juaok()  {
        noiseGate.rightViewMode = .always
        PisingkinsegiNmen.isUserInteractionEnabled = true
        noiseGate.rightView = UIView(frame: CGRect.init(x: 0, y: 0, width: 35, height: 45))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        PisingkinsegiNmen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(trimming)))
        survey.attributedPlaceholder = NSAttributedString(string: NoiseGate.sequencer(lifer:"Pwazsiskwfodrsdy(k6o-p1c2e ecihlaxryavcvtiefrbsr)" ), attributes: [.foregroundColor:UIColor.white])
        
        activePreset = StagePreset.init(name: NoiseGate.sequencer(lifer: "Esnxtuewrp myzoougrv teemcayizlq zaqdgdwrfedsrs"), reverbLevel: 22, delayTime: 2, eqProfile: (3,5,6), lightingPattern: .clubPulse)
        noiseGate.attributedPlaceholder = NSAttributedString(string: NoiseGate.sequencer(lifer: "Esnxtuewrp myzoougrv teemcayizlq zaqdgdwrfedsrs"), attributes: [.foregroundColor:UIColor.white])
        bandPol.roundEditorCorners(editorradius: 13)
    }


    @IBAction func electronic(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func bandPass(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected  {
            sender.backgroundColor = UIColor.green
            
        }else{
            sender.backgroundColor = .white
        }
    }
    
    @objc func trimming() {
        
        let instaiclogin =   UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FigfreinsfKonwedge") as! FigfreinsfKonwedge
        
        self.navigationController?.pushViewController(instaiclogin, animated: true)
    }
    
    private var importer:Dictionary<String,Any>?
  
    
    @IBAction func ManagementGoamae(_ sender: Any) {
        rebuildVocalChain()
        guard var preset = activePreset else { return}
        
        if let Predefined = noiseGate.text ,
           !Predefined.isEmpty{
           
            if let against = survey.text,against.count >= 6,against.count <= 12{
                
                if self.bandPol.isSelected {
                    
                    SVProgressHUD.show(withStatus: NoiseGate.sequencer(lifer: "Lmodgz rijnc.f.t.e.n."))
                    
                    preset.delayTime = 40
                    BeatboxAcademyController.sonicHarmonyBridge(waveformComponents: ["aiff":Predefined,"flac":against,"streaming":NoiseGate.highPass], resonanceFrequency: "/ogznmeuz/cmjxzzyj",IUWgu:2345) { complexity in
                        SVProgressHUD.dismiss()
                        guard
                            let splicing = complexity as? Dictionary<String,Any> ,
                            preset.delayTime > 20,
                            let mixing = splicing[NoiseGate.sequencer(lifer: "dgaktxa")] as? Dictionary<String,Any>
                                
                        else {
                            preset.eqProfile = (23,34,23)
                            SVProgressHUD.showError(withStatus: NoiseGate.sequencer(lifer: "Dyastlae xEzrzryozr"))
                            return
                        }
                        
                        
                        self.importer = mixing
                        
                        
                        self.dealamplifier()
                        
                        
                        SVProgressHUD.showSuccess(withStatus: NoiseGate.sequencer(lifer: "Llowgs oixnl qsvuwcdcweksesdfvuslz!"))
                    } dissonanceHandler: { errt in
                        SVProgressHUD.dismiss()
                        preset.eqProfile = (23,34,23)
                        if preset.eqProfile.1 > 20 {
                            SVProgressHUD.showError(withStatus: errt.localizedDescription)
                        }
                        
                    }

                    
                }else{
                    preset.eqProfile = (23,34,23)
                    if preset.eqProfile.1 > 20 {
                        SVProgressHUD.showError(withStatus: NoiseGate.sequencer(lifer: "ppluehahsbef wrneyaedf xaznhdh yaggkroetey atooy hpyrvimvtaachye ppsodlaiqciye xayntde cugsredrk mtbenrumlsp "))
                    }
                    
                }
                
                
                
            }else{
                SVProgressHUD.showError(withStatus: NoiseGate.sequencer(lifer: "Pmlieeaisgeq eeinmtmecrp xprafskshwsoprvdm(w6o-l1m2c fcehqaxrpawcatfeurbse)"))
            }
        }else{
            SVProgressHUD.showError(withStatus:NoiseGate.sequencer(lifer: "Pwldebawsmex qesngthemrf mymobuurx nemmkaeimly aacdkdarfeosms"))
        }
        
        
        
        
        
        
    }
    
    private func rebuildVocalChain() {
           guard let preset = activePreset else { return }
           
           vocalChain = [
               ReverbEffect(intensity: preset.reverbLevel),
               DelayEffect(interval: preset.delayTime),
               EqualizerProfile(bass: preset.eqProfile.bass,
                              mid: preset.eqProfile.mid,
                              treble: preset.eqProfile.treble)
           ]
      
    }
    func dealamplifier()  {
    
        NoiseGate.feed = self.importer?["feed"] as? String
        
        NoiseGate.recording = self.importer?["recording"] as? Int
        UserDefaults.standard.set(self.importer?["mastering"] as? String, forKey: "mastering")
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
}


class FigfreinsfKonwedge: UIViewController {
    
    @IBOutlet weak var switchPiaingtitlr: UISegmentedControl!
    
    @IBOutlet weak var apaui: UITextView!
    
    
    
    @IBAction func begingignSwitcin(_ sender: UISegmentedControl) {
        
        if switchPiaingtitlr.selectedSegmentIndex == 0 {
            apaui.text = """
           Drovi Privacy Policy

           Last Updated: May 1, 2025

           Contact Email: drovi.support@gmail.com

           Drovi ("we," "our," or "us") respects your privacy and is committed to protecting your personal data. This Privacy Policy explains how we collect, use, and safeguard your information when you use our beatbox creation and social platform.

           Data We Collect

           •Account Information: Username, email, and profile details.

           •User Content: Beatbox recordings, videos, photos, and posts.

           •Usage Data: Interactions with Bbox Maker, Bbox AIChat, and social features.

           •Device Information: IP address, device type, and OS version for analytics.

           How We Use Data

           •To provide and improve Drovi’s features (e.g., AI collaboration, loop creation).

           •To personalize your experience and connect you with other beatboxers.

           •To enforce community guidelines and ensure security.

           Data Sharing

           •With Your Consent: When you share content publicly or with other users.

           •Service Providers: Third-party tools for analytics and hosting (e.g., Firebase).

           •Legal Compliance: If required by law or to protect our community.

           We do not sell your data. You may request deletion of your account by contacting us at drovi.support@gmail.com.

           By using Drovi, you agree to this policy. For questions, contact us via email.



"""
        }else{
            apaui.text = """
            Drovi Terms of Use (ELUA)

            Last Updated: May 1, 2025

            Contact Email: drovi.support@gmail.com

            Welcome to Drovi! These Terms govern your use of our beatbox platform. By accessing Drovi, you agree to comply with these rules.

            User Responsibilities

            1.Eligibility: You must be at least 13 years old (or the minimum age in your jurisdiction).

            2.Content Ownership: You retain rights to your creations but grant Drovi a license to host and display them.

            3.Prohibited Conduct:No hate speech, harassment, or illegal content.No spam, impersonation, or unauthorized commercial use.No exploiting Bbox AIChat for harmful or automated requests.

            Termination

            Drovi reserves the right to suspend or terminate accounts for violations, including:

            •Breaching these Terms.

            •Harming other users or the platform’s integrity.

            •Circumventing security measures.


            Disclaimers
            •Drovi is provided "as is"; we do not guarantee uninterrupted or error-free service.

            •We are not liable for user-generated content or third-party links.

            Changes to Terms

            We may update these Terms periodically. Continued use after changes constitutes acceptance.

            For disputes or questions, contact drovi.support@gmail.com.
"""


        }
    }
    
    @IBAction func electronic(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
enum LightingStyle: String, CaseIterable {
    case clubPulse, studioFlat, streetRaw, concertDynamic
}
