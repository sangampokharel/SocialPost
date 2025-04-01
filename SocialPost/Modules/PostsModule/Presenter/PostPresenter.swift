//
//  Presenter.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//


protocol PostPresenterProtocol {
    func viewDidLoad()
}

class PostPresenter {
    weak var view:PostView?

    var interactor:PostUseCase?
    var postRouter:PostRouting?
    
    init( view:PostView, interactor:PostUseCase,router:PostRouting){
        self.view = view
        self.interactor = interactor
        self.postRouter = router
    }
}
extension PostPresenter:PostPresenterProtocol {
    func viewDidLoad() {
        let posts = interactor?.getPosts()
        view?.updatePost(post: posts ?? [])
    }
}
