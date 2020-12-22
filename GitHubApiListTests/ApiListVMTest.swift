//
//  ApiListVMTest.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/22.
//  
//

import Quick
import Nimble
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import GitHubApiList

class ApiListVMTest: QuickSpec {
    override func spec() {
        
        let vm = ApiListVM()
        
        beforeEach {
            stub(condition: isAbsoluteURLString(URL.gitHubApiList.absoluteString)) { _ in
              // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
              let stubPath = OHPathForFile("githubapi.json", type(of: self))
              return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
            }
        }
        
        describe("fetchDataFromRemote test") {
            it("get data from Remote") {
                
                vm.fetchDataFromRemote().bind { (cellVMs) in
                    
                    let expectData = [
                        
                        ApiListCellVM(title:"current_user_url", subTitle:"https://api.github.com/user"),
                        ApiListCellVM(title:"current_user_authorizations_html_url", subTitle:"https://github.com/settings/connections/applications{/client_id}"),
                        ApiListCellVM(title:"authorizations_url", subTitle:"https://api.github.com/authorizations"),
                        ApiListCellVM(title:"code_search_url", subTitle:"https://api.github.com/search/code?q={query}{&page,per_page,sort,order}"),
                        ApiListCellVM(title:"commit_search_url", subTitle:"https://api.github.com/search/commits?q={query}{&page,per_page,sort,order}"),
                        ApiListCellVM(title:"emails_url", subTitle:"https://api.github.com/user/emails"),
                        ApiListCellVM(title:"emojis_url", subTitle:"https://api.github.com/emojis"),
                        ApiListCellVM(title:"events_url", subTitle:"https://api.github.com/events"),
                        ApiListCellVM(title:"feeds_url", subTitle:"https://api.github.com/feeds"),
                        ApiListCellVM(title:"followers_url", subTitle:"https://api.github.com/user/followers"),
                        ApiListCellVM(title:"following_url", subTitle:"https://api.github.com/user/following{/target}"),
                        ApiListCellVM(title:"gists_url", subTitle:"https://api.github.com/gists{/gist_id}"),
                        ApiListCellVM(title:"hub_url", subTitle:"https://api.github.com/hub"),
                        ApiListCellVM(title:"issue_search_url", subTitle:"https://api.github.com/search/issues?q={query}{&page,per_page,sort,order}"),
                        ApiListCellVM(title:"issues_url", subTitle:"https://api.github.com/issues"),
                        ApiListCellVM(title:"keys_url", subTitle:"https://api.github.com/user/keys"),
                        ApiListCellVM(title:"label_search_url", subTitle:"https://api.github.com/search/labels?q={query}&repository_id={repository_id}{&page,per_page}"),
                        ApiListCellVM(title:"notifications_url", subTitle:"https://api.github.com/notifications"),
                        ApiListCellVM(title:"organization_url", subTitle:"https://api.github.com/orgs/{org}"),
                        ApiListCellVM(title:"organization_repositories_url", subTitle:"https://api.github.com/orgs/{org}/repos{?type,page,per_page,sort}"),
                        ApiListCellVM(title:"organization_teams_url", subTitle:"https://api.github.com/orgs/{org}/teams"),
                        ApiListCellVM(title:"public_gists_url", subTitle:"https://api.github.com/gists/public"),
                        ApiListCellVM(title:"rate_limit_url", subTitle:"https://api.github.com/rate_limit"),
                        ApiListCellVM(title:"repository_url", subTitle:"https://api.github.com/repos/{owner}/{repo}"),
                        ApiListCellVM(title:"repository_search_url", subTitle:"https://api.github.com/search/repositories?q={query}{&page,per_page,sort,order}"),
                        ApiListCellVM(title:"current_user_repositories_url", subTitle:"https://api.github.com/user/repos{?type,page,per_page,sort}"),
                        ApiListCellVM(title:"starred_url", subTitle:"https://api.github.com/user/starred{/owner}{/repo}"),
                        ApiListCellVM(title:"starred_gists_url", subTitle:"https://api.github.com/gists/starred"),
                        ApiListCellVM(title:"user_url", subTitle:"https://api.github.com/users/{user}"),
                        ApiListCellVM(title:"user_organizations_url", subTitle:"https://api.github.com/user/orgs"),
                        ApiListCellVM(title:"user_repositories_url", subTitle:"https://api.github.com/users/{user}/repos{?type,page,per_page,sort}"),
                        ApiListCellVM(title:"user_search_url", subTitle:"https://api.github.com/search/users?q={query}{&page,per_page,sort,order}")

                    ]
                    
                    expect(cellVMs).to(contain(expectData))
                    

                
                }
                .disposed(by: self.rx.disposeBag)

            }
        }        

    }
}
