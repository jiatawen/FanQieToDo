import { userTest } from '../../viewmodel/pojo/User'
import router from '@ohos.router';
import Store from '../Store'
@Entry
@Component
struct Me {
  build() {
    Column() {
      //导航栏
      Row() {
        Image($r('app.media.ic_close'))
          .fillColor('#fff')
          .width(30)
          .onClick(() => {
            router.back()
          })
        Text('专注计时设置')
          .fontColor('#fff')
          .fontSize(20)
          .margin({ left: 15 })
        Blank()
        Image($r('app.media.ic_more'))
          .width(30)
          .fillColor('#fff')
          .bindMenu([
            { value: '下载信息副本', action: () => {

            } },
            { value: '注销账号', action: () => {

            } }
          ])
      }
      .padding(15)
      .zIndex(10)
      .backgroundColor('#ff726e')
      .width('100%')
      .height(100)

      //用户标签
      Row({ space: 25 }) {
        Image(userTest().UserImage)
          .width(80)
          .borderRadius(40)
        Column({ space: 20 }) {
          Text(`账号:${Store.getUser().UserEmail}`)
            .fontColor('#fff')
          Text(`昵称;${Store.getUser().UserName}`)
            .fontColor('#fff')
        }
        .alignItems(HorizontalAlign.Start)
      }
      .backgroundImageSize(ImageSize.Cover)
      .backgroundImage($r('app.media.bg_user_title'))
      .width('100%')
      .height(200)
      .padding(20)

      //正文部分
      Text('已绑定至微信')
        .width('100%')
        .padding(15)
      Text('修改昵称')
        .width('100%')
        .padding(15)
      Row() {
        Text('专注内容对自习室好友可见')
        Toggle({ type: ToggleType.Switch, isOn: true })
          .selectedColor('#4bd963')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding(20)

      Text('退出登录')
        .width('100%')
        .padding(20)
    }
    .width('100%')
  }
}