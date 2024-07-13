/*
 * 待办页面
 * */
import { TopTitle } from '../../pages/Index'
import { taskTests,Task } from '../../viewmodel/pojo/Huang/Task'


@Entry
@Component
export struct TodoList {
   @State i: number = Math.floor(Math.random()*6)
  @State img: ResourceStr[] = [$r("app.media.bg_1"),$r("app.media.bg_2"),$r("app.media.bg_3"),$r("app.media.bg_4"),$r("app.media.bg_5")]
  // @State color: string[] = ["#8da6ddfa", "#88e57db4", "#abfaf7aa","#aaffffff","#aaffffff"]

  //打卡菜单
  @Builder
  MyMenu(){
    Menu(){
      MenuItem({
        content:"早起打卡"
      })
        .onClick(()=>{
          console.log("起床打卡弹窗")
      })
      MenuItem({
        content:"专注时长打卡"
      }).onClick(()=>{
        console.log("专注时长打卡弹窗")
      })
      MenuItem({
        content:"睡眠打卡"
      }).onClick(()=>{
        console.log("睡眠打卡弹窗")
      })
    }.backgroundColor('#ffffff')
  }


  build(){
    Column(){
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
          Image($r('app.media.ic_more'))
            .fillColor('#fff')
            .width(30)
        }
      }
      //如果是新用户
      if(taskTests().length==0){
        Column(){
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
      ForEach(taskTests(),(item:Task,index:number)=>{
        Row(){
          Column(){
            Text(item.TaskTitle)
              .fontSize(20)
              .fontFamily('STKaiti')
              .lineHeight(30)
              .padding({
                left:10
              })
            Text(item.SignalTime.toString())
              .lineHeight(30)
              .padding({
                left:10
              })
          }
          Blank()
          Text("开始")
            .fontSize(20)
            .padding({
              right: 10
            })
        }
        .height("10%")
        .width("90%")
        .backgroundImage(this.img[this.i])
        .borderRadius(10)
      })

    }

  }
}