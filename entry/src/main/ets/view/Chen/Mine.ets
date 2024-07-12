import * as template from './template'
import { TopTitle } from '../../pages/Index'
/**
 * 我的页面
 */
@Preview
@Component
export struct Mine {
  build() {
    Stack({ alignContent: Alignment.Top }) {

      //复写顶部标签
      TopTitle({ titleText: '我的' }) {
        Row({ space: 20 }) {
          Image($r('app.media.ic_help'))
            .fillColor('#fff')
            .width(30)
          Image($r('app.media.ic_setting'))
            .fillColor('#fff')
            .width(30)
          Image($r('app.media.ic_more'))
            .fillColor('#fff')
            .width(30)
        }
      }

      Scroll() {
        //主体页面
        Column({ space: 5 }) {
          //顶部
          Column() {
            template.userTable(200)
            template.menu()
          }
          //vip
          Column() {
            ForEach(Array.from({ length: 2 }), (a: string, index) => {
              template.box({ i: index })
            })
          }
          //setting
          Column() {
            ForEach(Array.from({ length: 6 }), (a: string, index) => {
              template.box({ i: index + 2 })
            })
          }

          //help
          Column() {
            ForEach(Array.from({ length: 2 }), (a: string, index) => {
              template.box({ i: index + 8 })
            })
          }
        }
        .width('100%')
      }
      .margin({ top: 100 })
      .backgroundColor('#f0f6f6')
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
  }
}