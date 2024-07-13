import { Mine } from '../view/Chen/Mine'
import { TodoList } from '../view/Huang/TodoList'

@Entry
@Component
struct Index {
  @State selectedIndex: number = 0 //被选中的标签号
  tabBarsText: string[] = ['待办', '待办集', '统计数据', '我的'] //标签名
  tabBarsImg: ResourceStr[] = [$r('app.media.ic_help'), $r('app.media.ic_help'), $r('app.media.ic_help'), $r('app.media.ic_person')] //标签图标
  //标签模板
  @Builder
  TabDefault(TabIndex: number) {
    Column({ space: 7 }) {
      Image(this.tabBarsImg[TabIndex])
        .width(20)
        .fillColor(TabIndex == this.selectedIndex ? '#ff726e' : '#ccc')
      Text(this.tabBarsText[TabIndex])
        .fontSize(10)
        .fontColor(TabIndex == this.selectedIndex ? '#ff726e' : '#ccc')
    }
  }

  build() {
    Tabs() {
      //待办
      TabContent() {
        TodoList()
      }.tabBar(this.TabDefault(0))
      // 待办集
      TabContent() {
        Text('页面')
      }.tabBar(this.TabDefault(1))
      // 统计数据
      TabContent() {
        Text('页面')
      }.tabBar(this.TabDefault(2))
      // 我的
      TabContent() {
        Mine()
      }.tabBar(this.TabDefault(3))
    }
    .barPosition(BarPosition.End)
    .scrollable(false)
    .onChange((index) => {
      this.selectedIndex = index
    })
  }
}


//通用模板
/**
 * 模板1：顶部标题栏
 * 已导出
 * TopTitle({titleText:string}){Demo}
 * titleText:标题文本
 * Demo:标题栏右侧组件
 */

@Component
export struct TopTitle {
  @BuilderParam title: () => void = this.titleDemo
  @Prop titleText: string

  @Builder
  titleDemo() {
    Image($r('app.media.ic_setting'))
      .width(30)
      .fillColor('#fff')
    Image($r('app.media.ic_setting'))
      .width(30)
      .fillColor('#fff')
    Image($r('app.media.ic_setting'))
      .width(30)
      .fillColor('#fff')
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.titleText)
          .fontSize(18)
          .fontColor('#fff')
        Text('点击开启学霸模式')
          .borderRadius(12)
          .height(28)
          .fontSize(12)
          .backgroundColor('#4a3e3e3e')
          .padding({ left: 7, right: 7 })
          .fontColor('#fff')
      }
      .alignItems(HorizontalAlign.Start)

      Blank()
      //右侧图标按钮
      Row({ space: 15 }) {
        this.title()
      }
    }
    .padding(20)
    .height(110)
    .width('100%')
    .backgroundColor('#fd7670')
  }
}