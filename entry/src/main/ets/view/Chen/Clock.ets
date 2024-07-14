import { TopTitle } from '../../pages/Index'
import router from '@ohos.router';
import CustomDialogExample from './Mine'

@Entry
@Component
export default struct Clock {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
    alignment: DialogAlignment.TopEnd,
    autoCancel: true,
    offset: { dx: -20, dy: 50 }
  })
  @State clockTime:number = 10
  build() {
    Column() {

      //表头
      Row() {
        TopTitle({ titleText: '锁机' }) {
          Row({ space: 20 }) {
            Image($r('app.media.ic_help'))
              .fillColor('#fff')
              .width(30)
              .onClick(() => {
                router.pushUrl({ url: 'pages/Chen/Help' })
              })
            Image($r('app.media.ic_setting'))
              .fillColor('#fff')
              .width(30)
              .bindMenu([
                {
                  value: '个人信息设置',
                  action: () => {
                    router.pushUrl({
                      url: 'pages/Chen/Me'
                    })
                  }
                },
                {
                  value: '专注计时设置',
                  action: () => {
                    router.pushUrl({
                      url: 'pages/Chen/KeepTimeSetting'
                    })
                  }
                }
              ])
            Image($r('app.media.ic_more'))
              .fillColor('#fff')
              .width(30)
              .onClick(() => {
                this.dialogController.open()
              })
          }
        }
      }

      Column({ space: 10 }) {
        Row() {
          //图标
          Image($r('app.media.ic_time'))
            .width(25)
            .fillColor('#fff')
          // 若有两段文本则第二段为小号灰色
          Column({ space: 5 }) {
            Text('小憩')
              .fontColor('#fff')
              .fontSize(15)
            Text('放松身心的深呼吸')
              .fontColor('#fff')
              .fontSize(10)
          }
          .width('90%')
          .margin({ left: 25 })
          .alignItems(HorizontalAlign.Start)

        }
        .padding(10)
        .borderRadius(10)
        .backgroundColor('#01c3a9')
        .alignItems(VerticalAlign.Center)
        .padding(10)
        .width('100%')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/huang/FanQieClock',
            params: {
              time: 10 * 60 * 1000,
              title: '小憩'
            }
          })
        })

        Row() {
          //图标
          Image($r('app.media.ic_time'))
            .width(25)
            .fillColor('#fff')
          // 若有两段文本则第二段为小号灰色
          Column({ space: 5 }) {
            Text('立刻开始快速锁机')
              .fontColor('#fff')
              .fontSize(15)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/huang/FanQieClock',
                  params: {
                    time: this.clockTime * 60 * 1000,
                    title: '锁机'
                  }
                })
              })
            Text('选择锁机时长')
              .fontColor('#fff')
              .fontSize(10)
          }
          .layoutWeight(1)
          .margin({ left: 25 })
          .alignItems(HorizontalAlign.Start)

          TextInput({ placeholder: '请输入时长', text: '10' })
            .padding(0)
            .type(InputType.Number)
            .placeholderFont({ size: 12 })
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .borderWidth(1)
            .borderColor('#6feeeeee')
            .width(100)
            .height(30)
            .margin({ right: 5 })
            .onChange((value: string) => {
              this.clockTime = Number(value)
            })

            .fontSize(15)
          Text('分钟')
            .fontColor('#fff')
            .fontSize(15)
        }
        .padding(10)
        .borderRadius(10)
        .backgroundColor('#fe7f70')
        .alignItems(VerticalAlign.Center)
        .padding(10)
        .width('100%')
        .height(150)

        Row() {
          //图标
          Image($r('app.media.ic_add'))
            .width(25)
            .fillColor('#fff')
          // 若有两段文本则第二段为小号灰色
          Column({ space: 5 }) {
            Text('添加自定义锁机时间段')
              .fontColor('#fff')
              .fontSize(15)
            Text('在指定时间范围内锁住手机，不做熬夜手机党')
              .fontColor('#fff')
              .fontSize(10)
          }
          .width('90%')
          .margin({ left: 25 })
          .alignItems(HorizontalAlign.Start)

        }
        .padding(10)
        .borderRadius(10)
        .backgroundColor('#3997f9')
        .alignItems(VerticalAlign.Center)
        .padding(10)
        .width('100%')

        Row() {
          //图标
          Image($r('app.media.ic_setting'))
            .width(15)
            .fillColor('#fff')
          // 若有两段文本则第二段为小号灰色
          Column({ space: 5 }) {
            Text('提升强制性选项|锁机设置')
              .fontColor('#fff')
              .fontSize(10)
          }
          .width('90%')
          .margin({ left: 25 })
          .alignItems(HorizontalAlign.Start)

        }
        .padding(10)
        .borderRadius(10)
        .backgroundColor('#fd7e6d')
        .alignItems(VerticalAlign.Center)
        .padding(10)
        .width('50%')
        .margin({ left: 165 })

      }
      .padding(10)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}