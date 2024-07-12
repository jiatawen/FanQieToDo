@Component
struct KeepTimeDemo {
  //专注计时核心设置
  @BuilderParam KeepTimeToggle: () => void = this.KeepTimeDefault

  @Builder
  KeepTimeDefault() {
    Toggle({ type: ToggleType.Switch, isOn: true })
  }

  img: ResourceStr = $r('app.media.ic_setting')
  title: string = '铃声震动设置'
  content: string = '开启或关闭铃声震动'

  build() {
    Row() {
      Image(this.img)
        .width(20)
      Column({ space: 5 }) {
        Text(this.title)
          .fontWeight(700)
        Text(this.content)
          .fontSize(12)
          .fontColor('#888888')
      }
      .margin({ left: 10 })
      .alignItems(HorizontalAlign.Start)

      Blank()
      this.KeepTimeToggle()
    }
    .width('100%')
  }
}


@Entry
@Component
struct KeepTime {
  @Builder
  SettingType(txt: string) {
    Text(txt)
      .fontWeight(600)
      .width('100%')
      .fontSize(25)
      .fontColor('#ff847f')
  }

  @Builder
  TimeText(txt:string){
    Text(txt)
      .fontSize(15)
      .fontColor('#ff847f')
  }

  build() {
    Stack({alignContent:Alignment.Top}){
      Row(){
        Image($r('app.media.ic_close'))
          .fillColor('#fff')
          .width(30)
        Text('专注计时设置')
          .fontColor('#fff')
          .fontSize(20)
          .margin({left:15})
      }
      .padding(15)
      .zIndex(10)
      .backgroundColor('#fe7d78')
      .width('100%')
      .height(70)
      Column() {
        Scroll() {
          Column({ space: 30 }) {
            Column({ space: 10 }){
              this.SettingType('基础设置')
              KeepTimeDemo(){}
              KeepTimeDemo(){}
              KeepTimeDemo(){this.TimeText('5分钟')}
              KeepTimeDemo(){}
            }

            Column({ space: 10 }){
              this.SettingType('高级设置-番茄钟')
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo(){this.TimeText('3分钟')}
              KeepTimeDemo(){this.TimeText('2次')}
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo()
              KeepTimeDemo(){}
            }

            Column({ space: 10 }){
              this.SettingType('高级设置-锁机设置')
              KeepTimeDemo()
              KeepTimeDemo(){this.TimeText('3次')}
              KeepTimeDemo(){this.TimeText('距锁机1小时内')}
              KeepTimeDemo(){this.TimeText('1分钟')}
            }
          }
          .width('100%')
        }
        .scrollBar(BarState.Off)
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .margin({top:70})
    }
    .height('90%')
  }
}