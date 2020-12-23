//
//  ApiRequestLogTest.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//  
//

import Quick
import Nimble
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import GitHubApiList

class ApiRequestLogTest: QuickSpec {
    override func spec() {
        
        let vm = ApiListVM()
        
        beforeEach {
            stub(condition: isAbsoluteURLString(URL.gitHubApiList.absoluteString)) { _ in
              // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
              let stubPath = OHPathForFile("githubapi.json", type(of: self))
              return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
            }
            
            ApiRequestLog.clearData()
        }
        
        describe("ApiRequestLog test") {

            it("check records") {

                waitUntil(timeout: .milliseconds(300)) { (done) in
                    
                    vm.fetchDataFromRemote().bind { (cellVMs) in
                        done()
                    }
                    .disposed(by: self.rx.disposeBag)
                    
                    
                }
                
                waitUntil(timeout: .milliseconds(300)) { (done) in
                    
                    vm.fetchDataFromRemote().bind { (cellVMs) in
                        done()
                    }
                    .disposed(by: self.rx.disposeBag)
                    
                    
                }
                
                
                let records = ApiRequestLog.getQeuestRecord()
                
                expect(records).toNot(beNil())
                expect(records!.count).to(equal(2))
                expect(records!.first?.method).to(equal("GET"))
                expect(records!.first?.url).to(equal(URL.gitHubApiList.absoluteString))
                

            }
            

            
        }

    }
}
