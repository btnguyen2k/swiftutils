//
//  ViewController.swift
//  SwiftUtilsPlayground
//
//  Created by Thanh Nguyen on 6/15/17.
//  Copyright © 2017 Thanh Nguyen. All rights reserved.
//

import UIKit
import SwiftUtils

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var btnTestClicked: UIButton!

    @IBAction func btnTest(_ sender: Any) {
//        let pubKey64 = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAkw7pYdYdpFJhpb0D4hWesYA7hvC7ykRGO8VlsiJYuf7BgLZeUE5OYEP+mynePuHEh6SPhzkxgHp/LFSQdFrNIJRslOrE35yAEE2+nYQzZSgDPIFC8tN9458/bFiKExFfgUn8Eu6rhXGSPJOD93dRPspVCq0ZyOKzANPJfi8kixb/kDUU2ZKr9Gc8Rgt1JWgED4eribrtU14AvUzXibF5n1TFmbQ33Ik22U3Rrm6i914cP4de5fn02WiIBA1ohXwQRemUxlb1Sj7YFKqMo8nNBioGoRMsSpbzBiYyQfN93VE/ehMUQIjAx5AIhALo5qMWuGjYYQZo5Tz5EhnqyzUvD6F0R3Ii2GcMTPIqHmmciLQNIyLdJoG9NJxbGpEzogNIoFQ4BNGYQLlZ6Z7wHTKZs5nvWCA0Pbb1t24jQ2rgw+gEQ1krcM/Q6zuL5+3pIARiSmt3wrNYrzCZ9gM/xmxE8OFizLA9KjOnEUqB6ULj0KT6MkFB8EqN4VHSnLsbALfefTw57UldYQweui0GRZwQ+dnjs7rd7DvAIifdDjY8AVX4iJ2qYMwUiHhjlKBjPW1CQpeU+Emdl1oY1/gTHOeJOoBZd8wRpLFFY7V0JR2aQhi9eVwpn5GT0w4DML+tNDbil2m8StySom760MbnHtIy6HIK7E4HF8Iq9lZZpsKUL+MCAwEAAQ=="
//        let privKey64 = "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"
        
        let privKey64 = "MIICXAIBAAKBgG5XFZDeSg10ZJGmR8a5FbU1mbSEULGBLj34ScEdqDzqgclR16Ed8AIXfcmqsTzWtIjyPzN0lOvn/xiC7hUH2uPpF/+xCFV16Tk/smLB8hTNj0ePVJALgLxI2oeeOZjy9Ax5vOt4ZyyZf8ttOt0G9RlX5H/p/uIyI8iiQIP46IWxAgMBAAECgYA0PPBN1J90fT07o2Bp2ahIUScCyn21e7YbypeIYPUMWe22FRQkCBtfsiVwO2qLpg50o1N+ldwHT596yEnVFRHwoD0dHEWYgUu6e0vLSyeTCWjg34hCQCNxKrFv9EQVvhZ5c18EuJgEc6w1oQ4NHFGNPLyhjywPcTgJ9QcRH0WhUQJBAM2zqCsfmiemB+Bgsp+i1XTNhn40fGKZDLToV/X7WCtavRIEvTsLJW3FXdILZXah7MsJVf9oD/0KQPt1kduHle0CQQCJUhA1IqvR2HYaGabFCu/VR6Ft/ON6yP+Rrikbw24uzqwjVy66zLwQzNd0XAMdtvjZC7nYp6XZMHDtlci72vZVAkAaiOBan7r8/lfpw8+G9DRg2tpMkWyyM1gGRiqCmqenAA9/sYjPgwKTBHCz1bCC+yRWlJ+5UK0vURFM3r+v9++JAkEAhQImzsDpelXXd0p3XY5NZeF+/GEiGdFMstfl2419UPtAgu60RZ1/YCp5WqyxG/wZp2oTNkaUfv3LtGULzOG3DQJBALHC7kbnnAhrGYOJ3r0fAsWT76wKbKAsgprlJObwnHEa1ZrBtXAoAxwhf6gGLwqtagFgyKtmTLDpSvk7wycyKR0="
        let pubKey64 = "MIGeMA0GCSqGSIb3DQEBAQUAA4GMADCBiAKBgG5XFZDeSg10ZJGmR8a5FbU1mbSEULGBLj34ScEdqDzqgclR16Ed8AIXfcmqsTzWtIjyPzN0lOvn/xiC7hUH2uPpF/+xCFV16Tk/smLB8hTNj0ePVJALgLxI2oeeOZjy9Ax5vOt4ZyyZf8ttOt0G9RlX5H/p/uIyI8iiQIP46IWxAgMBAAE="

        let tagPublic = "com.github.btnguyen2k.ios.SwiftUtilsPlayground.public"
        let tagPrivate = "com.github.btnguyen2k.ios.SwiftUtilsPlayground.private"
        let keySecPub = try! RSAUtils.addRSAPublicKey(pubKey64, tagName: tagPublic)
        let keySecPriv = try! RSAUtils.addRSAPrivateKey(privKey64, tagName: tagPrivate)
        NSLog("Public Key : \(keySecPub!)")
        NSLog("Private Key: \(keySecPriv!)")
        if keySecPub==nil||keySecPriv==nil{
            return
        }
        
        let orgText = "This a string"
        NSLog("Original text : \(orgText)")

//        let eData = try! RSAUtils.encryptWithRSAPublicKey(str: orgText, pubkeyBase64: pubKey64, tagName: "com.github.btnguyen2k.ios.SwiftUtilsPlayground.public")
        let eData = RSAUtils.encryptWithRSAKey(orgText.data(using: .utf8)!, rsaKeyRef: keySecPub!, padding: SecPadding.OAEP)
        if eData==nil{
            NSLog("ERROR: Encrypt with RSA public key")
            return
        }
        NSLog("Encrypted data: \(eData!)")
        
//        let dData = try! RSAUtils.decryptWithRSAPrivateKey(encryptedData: eData!, privkeyBase64: privKey64, tagName: "com.github.btnguyen2k.ios.SwiftUtilsPlayground.private")
        let dData = RSAUtils.decryptWithRSAKey(eData!, rsaKeyRef: keySecPriv!, padding: SecPadding.OAEP)
        if dData==nil{
            NSLog("ERROR: Decrypt with RSA private key")
            return
        }
        NSLog("Decrypted data: \(dData!)")
        NSLog("Decrypted text: \(String(data: dData!, encoding: .utf8)!)")
    }
}
