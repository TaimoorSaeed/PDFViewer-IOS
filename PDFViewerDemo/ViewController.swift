//
//  ViewController.swift
//  PDFViewerDemo
//
//  Created by O16Labs on 7/1/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    
    @IBOutlet weak var pdfView: PDFView!
    
    var pdfDOC: PDFDocument!
    override func viewDidLoad() {
        super.viewDidLoad()
//        downloadPDF()
    }
    
    override func viewDidLayoutSubviews() {
        downloadPDF()
    }

    func downloadPDF(){
        let urlString = "https://www.tutorialspoint.com/swift/swift_tutorial.pdf"
        guard let url = URL(string: urlString) else {return}
        do{
            let data = try Data(contentsOf: url)
            pdfDOC = PDFDocument(data: data)
            pdfView.displayMode = .singlePageContinuous
            pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            pdfView.displaysAsBook = true
            pdfView.displayDirection = .vertical
            pdfView.document = pdfDOC
            pdfView.autoScales = true
            pdfView.maxScaleFactor = 4.0
            pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit
        }catch let err{
            print(err.localizedDescription)
        }
    }

}

