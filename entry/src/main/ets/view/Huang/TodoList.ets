/*
 * 待办页面
 * */
import { TopTitle } from '../../pages/Index'
import { taskTests, Task } from '../../viewmodel/pojo/Huang/Task'
import { CustomDialogExample } from './dialog'
import promptAction from '@ohos.promptAction';
import addToDo from './addToDo'
import router from '@ohos.router';
import topMenu from '../Chen/Mine'

@Component
export struct TodoList {
  @State data: Task[] = taskTests();

  onPageShow() {
    this.data.unshift()
  }


  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({}),
    alignment: DialogAlignment.Center, // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  adTodo: CustomDialogController = new CustomDialogController({
    builder: addToDo()
  })
  topMenu: CustomDialogController = new CustomDialogController({
    builder: topMenu(),
    alignment: DialogAlignment.TopEnd,
    autoCancel: true,
    offset: { dx: -20, dy: 50 }
  })
  @State i: number = Math.floor(Math.random() * 6)
  @State img: ResourceStr[] = [$r("app.media.bg_1"), $r("app.media.bg_2"), $r("app.media.bg_3"), $r("app.media.bg_4"), $r("app.media.bg_5")]
  // @State color: string[] = ["#8da6ddfa", "#88e57db4", "#abfaf7aa","#aaffffff","#aaffffff"]
  //打卡菜单
  now: Date = new Date

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({
        content: "早起打卡"
      })
        .onClick(() => {
          if (this.now.getHours() > 12) {
            promptAction.showToast({
              message: '你来晚了哦',
              bottom: 350
            })
          }
          this.dialogController.open()
        })
      MenuItem({
        content: "专注时长打卡"
      }).onClick(() => {
        console.log("专注时长打卡弹窗")
      })
      MenuItem({
        content: "睡眠打卡"
      }).onClick(() => {
        console.log("睡眠打卡弹窗")
      })
    }.backgroundColor('#ffffff')
  }

  build() {
    Column({ space: 10 }) {
      // 顶部导航栏
      TopTitle({ titleText: '我的' }) {
        Row({ space: 20 }) {
          Image($r('app.media.ic_record'))
            .fillColor('#fff')
            .width(30)
            .bindMenu(this.MyMenu)
          Image($r('app.media.ic_add'))
            .fillColor('#fff')
            .width(30)
            .onClick(() => {
              this.adTodo.open()
            })
          Image($r('app.media.ic_more'))
            .fillColor('#fff')
            .width(30)
            .onClick(() => {
              this.topMenu.open()
            })
        }
      }
      //如果是新用户
      if (taskTests().length == 0) {
        Column() {
          Image($r('app.media.ic_empty'))
            .fillColor('#fff')
            .width(30)
          Image($r('app.media.ic_unhappy'))
            .fillColor('#fff')
            .width(30)
          Text("当前没有待办，点击右上角+号创建吧")
          Text("什么是待办？")
            .fontStyle(FontStyle.Italic)
        }
        .width('100%')
        .height(200)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#fffffff')
      }
      //待办任务项
      ForEach(taskTests(), (item: Task, index: number) => {
        Row() {
          Column() {
            Text(item.TaskTitle)
              .fontSize(20)
              .fontFamily('STKaiti')
              .lineHeight(30)
              .padding({
                left: 10
              })
            Text(item.SignalTime.toString())
              .lineHeight(30)
              .padding({
                left: 10
              })
          }

          Blank()
          Text("开始")
            .fontSize(20)
            .padding({
              right: 10
            })
            .onClick(() => {
              router.replaceUrl({
                url: 'pages/huang/FanQieClock',
                params: {
                  time: 5 * 1000,
                  title: '测试用'
                }
              })
            })
        }
        .height("10%")
        .width("90%")
        .backgroundImage(this.img[Math.floor(Math.random() * 5)])
        .borderRadius(10)
      })

    }
    .height('100%')
    .width('100%')
  }
}