import router from '@ohos.router';

@Entry
@Component
struct StudyRoomIndex {
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
        Text('自习室')
          .fontColor('#fff')
          .fontSize(20)
          .margin({ left: 15 })
      }
      .padding(15)
      .zIndex(10)
      .backgroundColor('#ff726e')
      .width('100%')
      .height(100)

      Column() {
        Column({ space: 50 }) {
          Button('创建自习室')
            .height(100)
            .width(100)
          Button('加入自习室')
            .height(100)
            .width(100)
            .backgroundColor('#a6a7c5')
          Text('什么是番茄自习室?')
            .fontColor('#837f7c')
        }
        .padding(100)
        .height('100%')
        .width('100%')
        .backgroundColor('#d3ffffff')
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundImage($r('app.media.bg_classroom'))
      .backgroundImageSize({
        height: '100%'
      })
      .backgroundImagePosition({
        x: -500
      })
    }
  }
}