import UIKit

class TrackOptionsView : UIView {
    var protocolVar : optionClosePressed?
    var _playlistItem  : PlaylistItems?
    var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    init(frame: CGRect, playlistItem: PlaylistItems?) {
        super.init(frame: frame)
        if playlistItem != nil {
            _playlistItem = playlistItem
        }
        setupVisualData()
    }
    let album = CustomImageView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let closeButton = UIButton(type: .system)
    
    func setupVisualData() {
        
        self.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        closeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        closeButton.addTarget(self, action: #selector(closePressed(sender :)), for: .touchUpInside)
        self.addSubview(visualEffectView)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        visualEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.closeButton.topAnchor).isActive = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100)
//        scrollView.showsVerticalScrollIndicator = false
        self.scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant:   scrollView.contentSize.width).isActive = true
        contentView.heightAnchor.constraint(equalToConstant:   scrollView.contentSize.height).isActive = true
        
        self.contentView.addSubview(album)
        album.translatesAutoresizingMaskIntoConstraints = false
        album.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        album.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        album.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        album.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        
        self.bringSubviewToFront(closeButton)
    }
    @objc func closePressed(sender : UIButton) {
        protocolVar?.closePressed()
    }
    func loadPlaylistInfo(playlistItem: PlaylistItems) {
        self.backgroundColor = .clear
        album.loadImage(with: playlistItem.track.album.images.first?.url ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol moreButtonDismissed {
    func moreButtonDismissed_Album(albumID: String)
   
    func moreButtonDismissed_Artist(artistID: String)
    
    func moreButtonDismissed()
    
}
class OptionView_Track : UIView {
    
    var protocolVar : moreButtonDismissed?
    
    
    let apiImageView = CustomImageView()
    
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
    let mainLabel = UILabel()
    let subLabel = UILabel()
    
    let ViewArtist = UIButton(type: .system)
    let ViewAlbum = UIButton(type: .system)
    
    var _artistID = String()
    var _albumID = String()
    

    
    init(frame: CGRect, trackID: String, albumID: String, artistID: String, artworkURL: String, mainTitle: String, subTitle: String) {
        
        super.init(frame: frame)
        
        _artistID = artistID
        _albumID = albumID
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        
        self.addSubview(visualEffectView)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        visualEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.addSubview(apiImageView)
        apiImageView.translatesAutoresizingMaskIntoConstraints = false
        apiImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        apiImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        apiImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        apiImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        apiImageView.loadImage(with: artworkURL)
        
        self.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.topAnchor.constraint(equalTo: apiImageView.bottomAnchor, constant: 20).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: apiImageView.centerXAnchor).isActive = true
        mainLabel.text = mainTitle
        mainLabel.font = .boldSystemFont(ofSize: 15)
        mainLabel.textColor = .white
        
        self.addSubview(ViewArtist)
        ViewArtist.translatesAutoresizingMaskIntoConstraints = false
        ViewArtist.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: UIScreen.main.bounds.height / 8).isActive = true
        ViewArtist.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        ViewArtist.setTitle("View Artist", for: .normal)
        ViewArtist.titleLabel?.font = .boldSystemFont(ofSize: 15)
        ViewArtist.setTitleColor(.white, for: .normal)
        ViewArtist.addTarget(self, action: #selector(ViewArtistPressed(sender:)), for: .touchUpInside)
        self.addSubview(ViewAlbum)
        ViewAlbum.translatesAutoresizingMaskIntoConstraints = false
        ViewAlbum.topAnchor.constraint(equalTo: ViewArtist.bottomAnchor, constant: 20).isActive = true
        ViewAlbum.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        ViewAlbum.setTitle("View Album", for: .normal)
        ViewAlbum.titleLabel?.font = .boldSystemFont(ofSize: 15)
        ViewAlbum.setTitleColor(.white, for: .normal)
        ViewAlbum.addTarget(self, action: #selector(ViewAlbumPressed(sender:)), for: .touchUpInside)
        
        self.addSubview(close)
        close.translatesAutoresizingMaskIntoConstraints = false
        close.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        close.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        close.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        close.heightAnchor.constraint(equalToConstant: 100).isActive = true
        close.setTitle("Close", for: .normal)
        close.setTitleColor(.white, for: .normal)
        close.addTarget(self, action: #selector(closedPressed(sender:)), for: .touchUpInside)
    }
    var close = UIButton(type: .system)
    @objc func closedPressed(sender: UIButton) {
        protocolVar?.moreButtonDismissed()
    }
    @objc func ViewArtistPressed(sender: UIButton) {
 print("moreButtonDismissed_Artist")
        
        protocolVar?.moreButtonDismissed_Artist(artistID: _artistID)
    }
    @objc func ViewAlbumPressed(sender: UIButton) {
        print("moreButtonDismissed_Album")
        protocolVar?.moreButtonDismissed_Album(albumID: _albumID)
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class OptionView_Album : UIView {
    var protocolVar : moreButtonDismissed?
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    init(frame: CGRect, albumID: String, artistID: String, artworkURL: String, mainTitle: String, subTitle: String) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        
        self.addSubview(visualEffectView)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        visualEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

