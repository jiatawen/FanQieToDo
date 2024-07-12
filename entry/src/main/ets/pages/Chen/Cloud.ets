import router from '@ohos.router';

@Entry
@Component
//云存储页面
struct Cloud {
  build() {
    Column({ space: 40 }) {
      Row(){
        Image($r('app.media.ic_close'))
          .width(30)
          .onClick(()=>{
            router.back()
          })

      }.justifyContent(FlexAlign.Start)
      .width('100%')
      .margin({top:10})

      Column({ space: 10 }) {
        Text('备份 | 恢复')
          .textAlign(TextAlign.Start)
          .width('100%')
          .fontSize(13)
        Row() {
          Image($r('app.media.ic_cloud'))
            .width(30)
            .fillColor('#fff')
          Text('备份至服务器')
            .fontSize(13)
            .fontColor('#fff')
            .margin({ left: 20 })
        }
        .height(65)
        .padding(20)
        .borderRadius(15)
        .width('100%')
        .backgroundColor('#5a74ff')

        Row() {
          Image($r('app.media.ic_cloud'))
            .width(30)
            .fillColor('#fff')
          Text('恢复至本机')
            .fontSize(13)
            .fontColor('#fff')
            .margin({ left: 20 })
        }
        .height(65)
        .padding(20)
        .borderRadius(15)
        .width('100%')
        .backgroundColor('#15b9ff')

        Text('如何将全部数据导入至新设备')
          .fontSize(13)
          .width('100%')
          .backgroundColor('#fff')
          .height(50)
          .padding(20)
          .borderRadius(15)
      }
      .borderRadius(15)
      .padding(20)
      .width('100%')
      .backgroundColor('#f2f2f2')

      Column({ space: 10 }) {
        Text('同步')
          .textAlign(TextAlign.Start)
          .width('100%')
          .fontSize(13)
        Row() {
          Image($r('app.media.ic_cloud'))
            .width(30)
            .fillColor('#fff')
          Column() {
            Text('自动同步近期数据')
              .fontSize(13)
              .fontColor('#fff')
              .margin({ left: 20 })
            Text('未开启')
              .fontSize(10)
              .fontColor('#fff')
              .margin({ left: 20 })
          }
          .alignItems(HorizontalAlign.Start)

          Image($r('app.media.ic_crown'))
            .width(30)
            .margin({ left: 15 })
            .fillColor('#fff')
          Toggle({ type: ToggleType.Switch, isOn: true })
        }
        .height(65)
        .padding(20)
        .borderRadius(15)
        .width('100%')
        .linearGradient({ angle: 90, colors: [['#5a74ff', 0], ['#15b9ff', 1]] })

        Text('如何使用多设备同步？')
          .fontSize(13)
          .width('100%')
          .backgroundColor('#fff')
          .height(50)
          .padding(20)
          .borderRadius(15)
        Text('同步遇到相关问题？')
          .fontColor('#fffd7070')
          .fontSize(12)
      }
      .borderRadius(15)
      .padding(20)
      .width('100%')
      .backgroundColor('#f2f2f2')
    }
    .width('100%')
    .padding(15)
  }
}