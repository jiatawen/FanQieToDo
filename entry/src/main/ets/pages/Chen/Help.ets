import router from '@ohos.router';

@Entry
@Component
struct Help {
  build() {
    Column() {
      //导航栏
      Row() {
        Image($r('app.media.ic_close'))
          .fillColor('#fff')
          .width(30)
          .onClick(() => {
            router.back()
          })
        Text('帮助|常见问题')
          .fontColor('#fff')
          .fontSize(20)
          .margin({ left: 15 })
      }
      .padding(15)
      .zIndex(10)
      .backgroundColor('#ff726e')
      .width('100%')
      .height(100)

      //正文
      Scroll() {
        Column() {
          Column() {
            Text('帮助文档')
              .fontSize(25)
              .fontColor('#ff726e')
              .margin({ bottom: 20 })
            box() {
              Image($r('app.media.ic_help'))
                .width(20)
                .fillColor('#ff726e')
            }
          }
          .padding(20)
          .width('100%')
          .backgroundColor('#fff')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 10 })

          Column() {
            Text('常见问题')
              .fontSize(25)
              .fontColor('#ff726e')
              .margin({ bottom: 20 })
            box()
          }
          .padding(20)
          .width('100%')
          .backgroundColor('#fff')
          .alignItems(HorizontalAlign.Start)

          ForEach(Array.from({ length: 4 }), () => {
            Column() {
              box()
            }
            .padding(20)
            .width('100%')
            .backgroundColor('#fff')
            .alignItems(HorizontalAlign.Start)
          })

          Text('更多使用中的问题')
            .fontSize(15)
            .backgroundColor('#fff')
            .width('100%')
            .padding({ left: 60, bottom: 10 })
            .margin({ bottom: 10 })

          // 底部
          Column({space:20}) {
            ForEach(Array.from({ length: 5 }), () => {
              Text('别看会死')
                .width('100%')
            })
            Text('防盗标记')
              .fontColor('#ffb5b5b5')
              .fontSize(10)
          }
          .backgroundColor('#fff')
          .padding(15)
          .width('100%')

        }
      }
      .scrollBar(BarState.Off)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f2f2f2')
  }
}

/**
 * 一个格子的模板
 */
@Component
struct box {
  @BuilderParam boxLeft: () => void = this.boxDefault

  @Builder
  boxDefault() {
    Text('重要')
      .borderRadius(3)
      .fontColor('#fff')
      .backgroundColor('#ff6b6b')
      .fontSize(10)
      .height(15)
      .padding({ left: 5, right: 5 })
  }

  build() {
    Row({ space: 10 }) {
      this.boxLeft()
      Column({ space: 10 }) {
        Text('标题真难取')
          .fontSize(15)
        Text('正文全是瞎编的，别看。看了不好')
          .fontSize(10)
          .fontColor('#737373')
      }
      .alignItems(HorizontalAlign.Start)
    }
  }
}