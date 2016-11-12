

import UIKit
import SnapKit

class UserDetailHeadView: UIView {

    weak var parentViewController: UIViewController!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        fatalError("init(coder:) has not been implemented")
    }

    init(_ parentViewController: UIViewController) {
        super.init(frame: CGRect.zero)

        self.parentViewController = parentViewController
        onInit()
    }

    func onInit() {
        addControls(reloadImage: true)
    }

    func refreshData() {
        addControls()
    }

    func addControls(reloadImage: Bool = false) {
        if let tryModel = (parentViewController as? UserDetailController)?.model {

            //是否有头像
            let hasAvatar = tryModel.hasAvatar
            let isSelf = false

            //返回
            if let _ = self.viewWithTag(Tag.make(4)) as? UIImageView {

            } else {
                let view = UIImageView()
                view.contentMode = .center
                view.image = UIImage(named: "按钮_返回_黑")
                view.tag = Tag.make(4)
                view.isUserInteractionEnabled = true
                view.addGestureRecognizer(
                    UITapGestureRecognizer(target: parentViewController, action: Selector(("backClicked")))
                )
                self.addSubview(view)
                view.snp.makeConstraints {
                    (make) -> Void in
                    make.top.left.equalTo(0)
                    make.width.height.equalTo(55)
                }
            }

            //分享
            if let view = self.viewWithTag(Tag.make(5)) as? UIImageView {
                view.isHidden = isSelf
            } else {
                let view = UIImageView()
                view.contentMode = .center
                view.image = UIImage(named: "按钮_更多_黑")
                view.tag = Tag.make(5)
                view.isUserInteractionEnabled = true
                view.isHidden = isSelf
                view.addGestureRecognizer(
                    UITapGestureRecognizer(target: parentViewController, action: Selector(("shareClicked")))
                )
                self.addSubview(view)
                view.snp.makeConstraints {
                    (make) -> Void in
                    make.top.right.equalTo(0)
                    make.width.height.equalTo(55)
                }
            }

            //设置
            if let view = self.viewWithTag(Tag.make(6)) as? UIImageView {
                view.isHidden = !isSelf
            } else {
                let view = UIImageView()
                view.contentMode = .center
                view.image = UIImage(named: "按钮_设置")
                view.tag = Tag.make(6)
                view.isUserInteractionEnabled = true
                view.isHidden = !isSelf
                view.addGestureRecognizer(
                    UITapGestureRecognizer(target: parentViewController, action: Selector(("settingClicked")))
                )
                self.addSubview(view)
                view.snp.makeConstraints {
                    (make) -> Void in
                    make.top.right.equalTo(0)
                    make.width.height.equalTo(55)
                }
            }

            //头像
            var avatarViewReal: UIImageView!
            if let view = self.viewWithTag(Tag.make(7)) as? UIImageView {
                avatarViewReal = view
            } else {
                let view = UIImageView()
                view.layer.masksToBounds = true
                view.layer.cornerRadius = 50
                view.backgroundColor = UIColor(valueRGB: 0x222222)
                view.contentMode = .scaleAspectFill
                view.tag = Tag.make(7)
                self.addSubview(view)
                view.snp.makeConstraints {
                    (make) -> Void in
                    make.top.equalTo(72)
                    make.centerX.equalTo(self)
                    make.width.height.equalTo(100)
                }
                avatarViewReal = view
            }
            avatarViewReal.isHidden = !hasAvatar
            if reloadImage && hasAvatar {
                avatarViewReal.image = UIImage.placeholderTransparent
                var avatarUrlString: String?
                if let tryAvatar = tryModel.userData?.uid {
                        avatarUrlString = NetworkURL.avatarSmall.replace(string: "{avatar}", with: "\(tryAvatar)")
                }
                if let tryUrlString = avatarUrlString {
                    avatarViewReal.setImageWithURLString(UrlString: tryUrlString)
                }
            }

            //昵称
            let userString = tryModel.userData?.name ?? Define.placeHolderString
            if let view = self.viewWithTag(Tag.make(8)) as? UILabel {
                view.text = userString
            } else {
                let imgView = UILabel()
                imgView.tag = Tag.make(8)
                imgView.text = userString
                imgView.font = UIFont.systemFont(ofSize: hasAvatar ? 24 : 36)
                imgView.textColor = UIColor.black
                imgView.textAlignment = .center
                self.addSubview(imgView)
                imgView.snp.makeConstraints {
                    (make) -> Void in
                    if hasAvatar {
                        make.top.equalTo(183)
                        make.height.equalTo(24)
                    } else {
                        make.top.equalTo(110)
                        make.height.equalTo(36)
                    }
                    make.left.equalTo(25)
                    make.right.equalTo(-25)
                }
            }

            //描述
            let desString = tryModel.userDetailData?.des ?? ""
            if let view = self.viewWithTag(Tag.make(9)) as? UILabel {
                view.text = desString
            } else {
                let imgView = UILabel()
                imgView.tag = Tag.make(9)
                imgView.text = desString
                imgView.font = UIFont.systemFont(ofSize: 12)
                imgView.textColor = UIColor(valueRGB: 0x878787)
                imgView.textAlignment = .center
                self.addSubview(imgView)
                imgView.snp.makeConstraints {
                    (make) -> Void in
                    if hasAvatar {
                        make.top.equalTo(218)
                    } else {
                        make.top.equalTo(148)
                    }
                    make.height.equalTo(15)
                    make.left.equalTo(25)
                    make.right.equalTo(-25)
                }
            }
        }
    }
}

