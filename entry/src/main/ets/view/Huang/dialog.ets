/*打卡模板框*/
import systemDateTime from '@ohos.systemDateTime'
import { userTest } from '../../viewmodel/pojo/User'

// 顶部导航栏通用模板
@Component
struct TopTitle {
  @BuilderParam title: () => void = this.titleDemo
  @Prop titleText: string

  @Builder
  titleDemo() {
    Image($r('app.media.ic_download'))
      .width(30)
      .fillColor('#fff')
    Image($r('app.media.ic_refresh'))
      .width(30)
      .fillColor('#fff')
    Image($r('app.media.ic_share_record'))
      .width(30)
      .fillColor('#fff')
    Image($r('app.media.ic_close'))
      .width(30)
      .fillColor('#fff')
      .onClick(() => {

      })
  }

  build() {
    Row() {
      Text(this.titleText)
        .fontSize(18)
        .fontColor('#fff')
      Blank()
      //右侧图标按钮
      Row({ space: 15 }) {
        this.title()
      }
    }
    .padding({ left: 20, right: 20 })
    .height(40)
    .width('100%')
    .backgroundColor('#40000000')
  }
}


//弹窗通用模板
@CustomDialog
export struct CustomDialogExample {
  controller: CustomDialogController
  cancel: () => void //点击避障层退出时的回调
  now: Date = new Date
  @State systemTime: string = `${this.now.getHours()}:${this.now.getUTCMinutes() < 10 ? '0' + this.now.getUTCMinutes() : this.now.getUTCMinutes()}`
  @State systemDate: string = `${this.now.getFullYear()}年${this.now.getMonth() + 1}月${this.now.getDate()}日`
  @State titleText: string = '起床打卡'

  build() {
    Stack({ alignContent: Alignment.Top }) {
      //顶部导航栏
      TopTitle({ titleText: this.titleText })
      Column() {
        if (this.titleText == '起床打卡' || this.titleText == '睡眠打卡') {
          Row() {
            //用户头像
            Image(userTest().UserImage)
              .width(50)
              .height(50)
              .borderRadius(50)
              .margin({
                left: 20,
                right: 20
              })
            Column() {
              //打卡时间
              Row() {
                Text(this.systemTime + '\n' + this.systemDate)
                  .fontSize(20)
                  .fontColor('#ffffff')
              }.justifyContent(FlexAlign.SpaceAround)
              //if 时间>8:00,为晚起状态，同时系统提示当前为不可打卡时间
              //实现四个标签
            }
          }
          .padding({ top: 50 })
          .justifyContent(FlexAlign.Start)
          .width('100%')
          // 背景文字
          Row() {
            Text("我们最终都要远行\n最终都要跟稚嫩的自己告别")
              .fontSize(50)
              .fontWeight(FontWeight.Bold)
              .fontColor("#88ffffff")
          }
          .padding({ top: 50, bottom: 50 })
          .width("90%")
          .backgroundColor(Color.Transparent)
        } else {
          //专注时长打卡弹窗
        }
      }
      .margin({ top: 50 })
    }
    .backgroundImage($r("app.media.bg_1"))
  }
}

@Entry
@Component
struct DialogExample {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: this.onCancel,
    }),
    alignment: DialogAlignment.Center, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  build() {
    Flex({ justifyContent: FlexAlign.Center }) {
      Button('click me')
        .onClick(() => {
          this.dialogController.open()
        })
    }.width('100%')
  }
}