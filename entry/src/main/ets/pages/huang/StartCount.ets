@CustomDialog
struct tips{
  controller:CustomDialogController
  @State tip: string = "提示信息"
  build(){
    Column(){
      Row(){
        // Image($r('app.media.'))
      }
      Text(this.tip)
    }
  }

}
@Entry
@Component
struct StartCount {
  //顶部导航栏参数
  @BuilderParam title: () => void = this.titleDemo
  //中间倒计时参数
  now: Date = new Date
  //底部图标颜色
  @State color: string = '#9e9cae'
  @State systemTime: string = `${this.now.getHours()}:${this.now.getUTCMinutes()<10?'0'+this.now.getUTCMinutes():this.now.getUTCMinutes()}`



  @Builder
  titleDemo() {
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

  build() {
    Column(){
     Column(){
       //顶部
       Row({ space: 15 }) {
         //右侧图标按钮
         this.title()
       }
       .padding(20)
       .height(80)
       .width('100%')
       .justifyContent(FlexAlign.End)
       //顶部文字
       Row(){
         Text('担心太多不会减轻明天的符合，只会剥夺今日的快乐')
       }
       //中间部分倒计时
      Column(){
        //中间倒计时
        Row(){
          Text(this.systemTime)

        }
        .width('100%')
        .height('40%')
        .borderRadius(50)
        .borderWidth(5)
        .borderColor('#85cf8df1')

        //上课进行中
        Column(){
          Text('上课')
            .fontSize(15)
            .fontColor('#ffffff')
          Text('进行中')
            .fontSize(10)
            .fontColor('#ffffff')
        }
      }
       //底部菜单栏
       Image($r('app.media.ic_light'))
         .width(30)
         .fillColor(this.color)
         .onClick(()=>{
            this.color = '#ffffff'
       })
       Column(){
         Image($r('app.media.ic_media'))
           .width(30)
           .fillColor(this.color)
         Image($r('app.media.ic_down'))
           .width(30)
           .fillColor(this.color)
       }
       .onClick(()=>{
         this.color = '#ffffff'
       })
       Image($r('app.media.ic_stop'))
         .width(30)
         .fillColor(this.color)
         .onClick(()=>{
           this.color = '#ffffff'
         })
       Image($r('app.media.ic_repeat'))
         .width(30)
         .fillColor(this.color)
         .onClick(()=>{
           this.color = '#ffffff'
         })
       Image($r('app.media.ic_end'))
         .width(30)
         .fillColor(this.color)
         .onClick(()=>{
           this.color = '#ffffff'
         })
     }
     .backgroundColor('#aafffff')
     .zIndex(0)
      .justifyContent(FlexAlign.SpaceAround)
    }
    .backgroundImage($r('app.media.bg_4'))
    .zIndex(-1)
  }

}