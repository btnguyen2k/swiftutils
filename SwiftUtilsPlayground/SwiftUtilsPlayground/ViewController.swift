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
        let privKey64 = "MIIEowIBAAKCAQEApjYx0U5cJLAkx3ATqxk5qv7raEv/romlDPa2WFjahplh4lFXD9dzX1fDLWPqwlxp/ZuUlYf3p50oVogoUe2+5IQ/qtpUEaB5Acc8qcx9FekKvxSG8SmCtc3NsC08Bsd6Rw4M6MGB51xeuSbB3cqh7UUhKiFZflUnudMJ7t3mPwEyvgLpA44MJ7nYnG28S0NqTUnM24IVRbPBYvd8xT6swum4nvwGQvbzP8PKqdYd/LBXkCzWMig9ZplGDBNPrAywoWdaGeYIoK4OO3ZhkSKGqAFSEZBj8HYNpHsj3NBqXsRfh0gaAV8tOKP79sBqa6hCL5LQr+nj5QIqYqa4NmUWFQIDAQABAoIBAEQmHmD6Zw9n5XyceIQD0MBKy0y1NH1k1HavRW6N5/OeOiMoRLErHpPuEQmwWRYd/BtOyipRWHqyFlL8esO03jsl+lDcOfIMQPE4tqfMP1FXft9/1CBXa8+NNZPRyDXjXkB6A1L/3Hp3RiNWP9Dnf2MgoAt9JwuEcMhhPkZhV0FnW8SeWh5bdmZstGsoLg6adtR8Bcz0RmE41SCzfIdWNxPUfwuMSitDonTttUOWEvYju8uTSt3VfPcYt8WBNj7ijFwWPRIiVYy118DNpKsmK3ZQQ88diNClPoXbb1XD7FRVhc5x9TqWl7Mpw3T9Wd6O8d+izn2Ny3Om6m0n5CpwJDUCgYEA3cNVvs/aWeqo0ov9QKTNv+XK1LsczAJEfNUa8IPpj35zzy21lC2cOWKKXaQeyIwI9YjeKD7OGdOdynN+Zpv6v+z/+4VNvf5BKWYwBTNaHjeo9gvJY8y49ZUAxXJgT6+wuc+PHVBOtowBed50V3aq+eYcYrkaIeOF9nC7cTcfNo8CgYEAv99SwZHXmxbJOF47LWqk5+k8bhIuPtruU3flW7Aw6tTARXQtf0N1GXPkaiRycFUuTg6YO7YNUK3NyuWKexAoZJ+IsYJp3CZBmUmRMN43xdPRtCTI0iQ7xdxMoyuTiMQTXqWEzSCvMK6LmXA7ss+2RgYGJxRto6OVZDyWsY2y2xsCgYBIoga+hWN12dbLhxA+kPvWo1PokxReeUunO0Ekj3/7AKa7r7PuQXYOkYjSHMP8WWlByj9BHTjx2o6u1V8MCoB5Rg2des64sML05URLH8OfbAmJ9NhUOKRHwzLKeKi00M1oPmQYbMorHfYJzWN7liFv0f9wEkJN4TBqRAgQj8ZIXwKBgQCCwPiPawjH6pZDsIuZXqR0WhBRXlhfgyiIfxsxCXe8gDFq40oiAOFq7/xHjQDjpljA3tdFUcHvKhIk45okVRWBxOoNNbdYTEXF5UlpSPYu/TNaFPs5oXGOW5tqUsbem+grRpaih1R702bUsJQuPbiULYTB2v0AV/j1bwiuhMbO4wKBgGTPf+XhpBdZLMfiuUI0hrVB/QminXMNsw4BU5CDW3K4hzo2fKKVhPkIKZ2RgU0hAqODdyJaEft0wN3X4fq+Tu4KIqz6RR8+BVzfUaAEyUE9E/UHLnO380iQ+7HwkSBGERXgFpZDf++L5sKT+pDT2jZ4tLyE8axIqWTWa22WV8J/"
        let pubKey64 = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApjYx0U5cJLAkx3ATqxk5qv7raEv/romlDPa2WFjahplh4lFXD9dzX1fDLWPqwlxp/ZuUlYf3p50oVogoUe2+5IQ/qtpUEaB5Acc8qcx9FekKvxSG8SmCtc3NsC08Bsd6Rw4M6MGB51xeuSbB3cqh7UUhKiFZflUnudMJ7t3mPwEyvgLpA44MJ7nYnG28S0NqTUnM24IVRbPBYvd8xT6swum4nvwGQvbzP8PKqdYd/LBXkCzWMig9ZplGDBNPrAywoWdaGeYIoK4OO3ZhkSKGqAFSEZBj8HYNpHsj3NBqXsRfh0gaAV8tOKP79sBqa6hCL5LQr+nj5QIqYqa4NmUWFQIDAQAB"

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
        let secPadding = SecPadding.OAEP

        let eData = RSAUtils.encryptWithRSAKey(orgText.data(using: .utf8)!, rsaKeyRef: keySecPub!, padding: secPadding)
        if eData==nil{
            NSLog("ERROR: Encrypt with RSA public key")
            return
        }
        NSLog("Encrypted data: \(eData!)")
        NSLog("Encrypted data: \(eData!.base64EncodedString())")

        let dData = RSAUtils.decryptWithRSAKey(eData!, rsaKeyRef: keySecPriv!, padding: secPadding)
        if dData==nil{
            NSLog("ERROR: Decrypt with RSA private key")
            return
        }
        NSLog("Decrypted data: \(dData!)")
        NSLog("Decrypted text: \(String(data: dData!, encoding: .utf8)!)")
    }
}
