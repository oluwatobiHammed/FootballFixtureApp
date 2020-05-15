//
//  UIImage+Extention.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import WebKit

extension WKWebView {
    func displayImages(url: String) {
        let fullHTML = "<!DOCTYPE html>" +
                        "<html lang=\"ja\">" +
                        "<head>" +
                        "<meta charset=\"UTF-8\">" +
                        "<style type=\"text/css\">" +
                        "html{margin:0;padding:0;}" +
                        "body {" +
                        "margin: 0;" +
                        "padding: 0;" +
                        "color: #363636;" +
                        "font-size: 90%;" +
                        "line-height: 1.6;" +
                        "background: #3E3D3E;" +
                        "}" +
                        "p{" +
                        "text-align: left;" +
                        "}" +
                        "img{" +
                        "margin-left: 1%;" +
                        "width: 9%;" +
                        "height: auto;" +
                        "}" +
                        "</style>" +
                        "</head>" +
                        "<body id=\"page\">" +
                    "<p> <img src='\(url)'/></p></body></html>"
        self.loadHTMLString(fullHTML, baseURL: nil)
    }
    func displayTeamImages(url: String) {
        let fullHTML = "<!DOCTYPE html>" +
          "<html lang=\"ja\">" +
               "<head>" +
               "<meta charset=\"UTF-8\">" +
               "<style type=\"text/css\">" +
               "html{margin:10;padding:10;}" +
               "body {" +
               "margin: 5;" +
               "padding: 10;" +
               "color: #363636;" +
               "font-size: 90%;" +
               "line-height: 1.6;" +
               "background: black;" +
               "}" +
               "p{" +
               "text-align: left;" +
               "}" +
               "img{" +
               "margin-left: 5%;" +
               "width: 20%;" +
               "height: auto;" +
               "}" +
               "</style>" +
               "</head>" +
               "<body id=\"page\">" +
               "<p> <img src='\(url)'/></p></body></html>"
         self.loadHTMLString(fullHTML, baseURL: nil)
     }
}


