// 季度卡购买页面
@Entry
@Component
struct Vip {
  @Builder
  VipTab(){
    Column({space:5}){
      Text('标题为什么要那么长啊')
        .fontSize(15)
        .fontWeight(700)
        .maxLines(1)
        .textOverflow({overflow:TextOverflow.Clip})
      Text('正文盎司附近了\nask发了哈士大夫爱上了发哈首府拉萨loremask附近的哈桑劳动防护阿斯利康发哈士大夫爱上了发卡行数量ask发了哈黑暗势力开发')
        .fontColor('#929292')
        .fontSize(11)
        .maxLines(2)
        .textOverflow({overflow:TextOverflow.Clip})
    }
    .alignItems(HorizontalAlign.Start)
    .width('90%')
    .margin({bottom:20})
  }

  build() {
    Column({ space: 10 }) {
      //导航栏
      Row() {
        Image($r('app.media.ic_close'))
          .width(25)
        Text('番茄ToDo季度卡')
          .fontWeight(700)
          .fontSize(20)
        Image($r('app.media.ic_help'))
          .width(25)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')

      //卡片
      Column() {
        Row() {
          Text('0000 0000 0000 0000')
            .fontColor('#fff')
          Image($r('app.media.ic_picture'))
            .fillColor('#fff')
            .width(25)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Text('2000-01-01')
          .fontColor('#fff')
        Text('尚未生效')
          .fontColor('#fff')
      }
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(HorizontalAlign.Start)
      .padding(25)
      .width('95%')
      .height(180)
      .linearGradient({ angle: 90, colors: [['#ff797979', 0], ['#353c42', 1]] })
      .borderRadius(20)

      //点击购买
      Column({space:5}) {
        Text('点击购买 ￥9.99 三个月 原价 ￥18')
          .fontColor('#fff')
          .fontSize(15)
        Text('点击查看更多优惠价格方案')
          .fontColor('#fff')
          .fontSize(12)
      }
      .height(58)
      .borderRadius(15)
      .linearGradient({ angle: 90, colors: [['#f08c87', 0], ['#e72d54', 1]] })
      .padding(10)
      .width('95%')

      Text('看看学霸们都在用番茄实现哪些心愿')
        .fontSize(12)
        .fontColor('#2ba6dc')
        .backgroundColor('#e9f6fe')
        .width('80%')
        .height(30)
        .padding(2)
        .textAlign(TextAlign.Center)
        .borderRadius(15)
        .margin({top:5})

      //滚动区
      Scroll(){
        Column(){
          ForEach(Array.from({length:30}),()=>{
            this.VipTab()
          })
        }
      }
      .scrollBar(BarState.Off)
      .height('43%')

      //协议
      Row(){
        Checkbox()
          .width(15)
        Text('勾选此处同意《会员使用协议》')
          .fontSize(12)
      }

      Button('为什么收费?')
        .fontColor('#000')
        .fontSize(12)
        .backgroundColor('#f1f7f7')
        .width('90%')
    }
    .padding(20)
  }
}