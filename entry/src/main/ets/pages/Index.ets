import { Mine } from '../view/Chen/Mine'

@Entry
@Component
struct Index {
  @State selectedIndex: number = 0 //被选中的标签号
  tabBarsText: string[] = ['待办', '待办集', '统计数据', '我的'] //标签名
  tabBarsImg: ResourceStr[] = [$r('app.media.ic_help'), $r('app.media.ic_help'), $r('app.media.ic_help'), $r('app.media.ic_help')] //标签图标

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
        Text('页面')
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


  //通用模板


}