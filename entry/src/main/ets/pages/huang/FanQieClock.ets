import router from '@ohos.router';

/**
 * 番茄钟页面
 * 需传入time与title
 * 传入方式:router.pushUrl({url:'*****',params:{time:600000,title:'标题'}})
 * 时间单位为毫秒
 */
@Entry
@Component
struct FanQieClock {
  textTimerController: TextTimerController = new TextTimerController()
  @State format: string = 'mm:ss'
  @State elapsedTime: number = 300000
  totalTime: number = 300000
  @State title: string = '123'

  onPageShow() {
    console.log(JSON.stringify(router.getParams()))
    this.title = router.getParams()?.['title'] as string
    this.elapsedTime = router.getParams()?.['time'] as number
    this.totalTime = router.getParams()?.['time'] as number
    this.textTimerController.start()
  }

  build() {
    Column() {
      //顶部
      this.Top()

      //标语
      Column() {
        Text('“')
          .fontSize(100)
          .fontColor('#fff')
        Text('世间是世间，我是我')
          .margin({ top: -100, left: 55 })
          .fontSize(20)
          .fontColor('#fff')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)


      //中间倒计时部分
      Column({ space: 10 }) {
        Stack() {
          //倒计时
          TextTimer({
            isCountDown: true,
            count: router.getParams()?.['time'] as number,
            controller: this.textTimerController
          })
            .format(this.format)
            .fontColor('#fff')
            .fontSize(30)
            .onTimer((itc: number, elapsedTime: number) => {
              this.elapsedTime = this.totalTime - elapsedTime
              console.log('剩余时间', this.elapsedTime);
            })
          //圆环
          Progress({ value: this.elapsedTime, total: this.totalTime, type: ProgressType.Ring })
            .color('#fff')
            .width('70%')
            .style({ strokeWidth: 5 })
        }

        Text(`${this.title}`)
          .fontColor('#fff')
        Text('进行中')
          .fontColor('#fff')
      }
      .margin({ top: 100 })

      Blank()
      //底部
      this.Bottom()
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.bg_3'))
  }

  @Builder
  Top() {
    Row({ space: 20 }) {
      Blank()
      Image($r('app.media.ic_scale'))
        .width(30)
        .fillColor('#fff')
      Image($r('app.media.ic_revert'))
        .width(30)
        .fillColor('#fff')
      Image($r('app.media.ic_share'))
        .width(30)
        .fillColor('#fff')
      Image($r('app.media.ic_download'))
        .width(30)
        .fillColor('#fff')
    }
    .width('100%')
  }

  @Builder
  Bottom() {
    Row() {
      //底部菜单栏
      Image($r('app.media.ic_light'))
        .width(30)
        .fillColor('#fff')
      Column() {
        Image($r('app.media.ic_media'))
          .width(30)
          .fillColor('#fff')
        Image($r('app.media.ic_down'))
          .width(30)
          .fillColor('#fff')
      }

      Image($r('app.media.ic_stop'))
        .width(30)
        .fillColor('#fff')
        .onClick(()=>{
          this.textTimerController.pause()
        })
      Image($r('app.media.ic_repeat'))
        .width(30)
        .fillColor('#fff')

      Image($r('app.media.ic_end'))
        .width(30)
        .fillColor('#fff')
    }
    .width('100%')
    .zIndex(0)
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.SpaceAround)
  }
}