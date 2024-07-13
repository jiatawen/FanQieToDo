import * as template from './template'
import { TopTitle } from '../../pages/Index'
import router from '@ohos.router'
/**
 * 我的页面
 */
@Entry
@Component
export struct Mine {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
    alignment: DialogAlignment.TopEnd,
    autoCancel: true,
    offset: { dx: -20, dy: 50 }
  })

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Column() {
        //复写顶部标签
        Column() {
          TopTitle({ titleText: '我的' }) {
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
        //正文
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
        .backgroundColor('#f0f6f6')
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.Off)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}

/**
 * 弹窗
 * 调用方法：dialogController: CustomDialogController = new CustomDialogController({
 builder: CustomDialogExample(),  必须
 alignment: DialogAlignment.TopEnd,  位置
 autoCancel: true,  点击空白是否关闭
 offset: { dx: -20, dy: 50 }  位置偏移
 })
 */
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({}),
  })

  build() {
    //快捷菜单

    Column() {
      Row() {
        Text('快捷菜单')
          .fontSize(15)
          .layoutWeight(1)
        Image($r('app.media.ic_setting'))
          .fillColor('#000')
          .width(15)
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
      }

      Row() {
        template.menu()
      }

      Button('快速使用帮助')
        .fontColor('#000')
        .fontSize(15)
        .backgroundColor('#ccc')
        .width('100%')
        .height(30)
        .fontWeight(400)
        .onClick(()=>{
          router.pushUrl({url:'pages/Chen/Help'})
        })
    }
    .padding(10)
    .backgroundColor('#fff')
    .borderRadius(10)

  }
}