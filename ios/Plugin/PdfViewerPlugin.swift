import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(PdfViewerPlugin)
public class PdfViewerPlugin: CAPPlugin {
    private let implementation = PdfViewer()
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func present(_ call: CAPPluginCall) {
    
        let url = call.getString("url")
        DispatchQueue.main.async {
            let vc =  WebViewController()
            vc.url = url
            self.bridge?.viewController?.present(vc, animated: true, completion: nil)
        }
    }
}
