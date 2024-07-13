@Extend(Text) function selectedTitle() {
  .height('100%')
  .layoutWeight(1)
  .textAlign(TextAlign.Center)
  .backgroundColor('#fff')
  .borderRadius(10)
}

@Extend(Text) function unselectedTitle() {
  .layoutWeight(1)
  .textAlign(TextAlign.Center)
}

@Entry
@Component
struct addToDo {
  @BuilderParam addType: () => void = this.muBiao
  @State jieZhiTime: string = '设定截止日期'

  @Builder xiGuan() {
    Column() {
      Row() {
        Text('我想')
        Select([{ value: '每天' }, { value: '每周' }, { value: '每月' }, { value: '每年' }])
          .selected(0)
          .value('每天')
          .colorBlend('#5b98c6')
      }
      .width('100%')

      Row() {
        Text('完成')
          .margin({ right: 5 })
        TextInput({ placeholder: '完成量', text: '' })
          .fontSize(12)
          .type(InputType.Number)
          .placeholderFont({ size: 12 })
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .borderWidth(1)
          .backgroundColor('#fff')
          .borderColor('#eee')
          .width(100)
          .height(30)
        Select([{ value: '分钟' }, { value: '小时' }])
          .selected(0)
          .value('分钟')
          .colorBlend('#5b98c6')
      }
      .width('100%')
    }
    .width('90%')
    .margin({ bottom: 10 })
  }

  @Builder muBiao() {
    Column() {
      Row({ space: 10 }) {
        Text('我想在')
        Text(`${this.jieZhiTime}`)
          .onClick(() => {
            DatePickerDialog.show({
              start: new Date('2000-1-1'),
              end: new Date('2100:12-31'),
              selected: new Date(Date.now()),
              onAccept: (value: DatePickerResult) => {
                this.jieZhiTime = `${value.year}-${value.month}-${value.day}`
              }
            })
          })
          .fontColor('#4f96cb')
        Text('之前')
      }
      .width('100%')

      Row() {
        Text('一共完成')
          .margin({ right: 5 })
        TextInput({ placeholder: '完成量', text: '' })
          .fontSize(12)
          .type(InputType.Number)
          .placeholderFont({ size: 12 })
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .borderWidth(1)
          .backgroundColor('#fff')
          .borderColor('#eee')
          .width(100)
          .height(30)
        Select([{ value: '分钟' }, { value: '小时' }])
          .selected(0)
          .value('分钟')
          .colorBlend('#5b98c6')
      }
      .width('100%')
    }
    .width('90%')
    .margin({ bottom: 10 })
  }

  @State selectedModel: number = 0

  build() {
    Column() {
      //表头
      Row() {
        Image($r('app.media.ic_close'))
          .width(25)
        Text('添加待办')
          .fontWeight(700)
          .fontSize(20)
        Image($r('app.media.ic_correct'))
          .width(25)
      }
      .backgroundColor('#eeeeee')
      .padding(8)
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ bottom: 10 })

      // 按钮
      Row() {
        if (this.selectedModel == 0) {
          Text('普通番茄钟')
            .selectedTitle()
            .onClick(() => {
              this.selectedModel = 0
            })
          Text('养习惯')
            .unselectedTitle()
            .borderWidth({ left: 1, right: 1 })
            .borderColor('#ffb1b1b1')
            .onClick(() => {
              this.selectedModel = 1
            })
          Text('定目标')
            .unselectedTitle()
            .onClick(() => {
              this.selectedModel = 2
            })
        }
        else if (this.selectedModel == 1) {
          Text('普通番茄钟')
            .unselectedTitle()
            .onClick(() => {
              this.selectedModel = 0
            })
          Text('养习惯')
            .selectedTitle()
            .borderWidth({ left: 1, right: 1 })
            .borderColor('#ffb1b1b1')
            .onClick(() => {
              this.selectedModel = 1
            })
          Text('定目标')
            .unselectedTitle()
            .onClick(() => {
              this.selectedModel = 2
            })
        } else if (this.selectedModel == 2) {
          Text('普通番茄钟')
            .unselectedTitle()
            .onClick(() => {
              this.selectedModel = 0
            })
          Text('养习惯')
            .unselectedTitle()
            .borderWidth({ left: 1, right: 1 })
            .borderColor('#ffb1b1b1')
            .onClick(() => {
              this.selectedModel = 1
            })
          Text('定目标')
            .selectedTitle()
            .onClick(() => {
              this.selectedModel = 2
            })
        }
      }
      .height(35)
      .padding(2)
      .backgroundColor('#eeeeee')
      .borderRadius(10)
      .width('90%')
      .margin({ bottom: 10 })

      //事项名称
      TextInput({ placeholder: '请输入事项名称', text: '' })
        .textAlign(TextAlign.Center)
        .borderRadius(2)
        .borderWidth(1)
        .backgroundColor('#fff')
        .borderColor('#eee')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })

      //中间部分

      if (this.selectedModel == 1) {
        this.xiGuan()
      }
      if (this.selectedModel == 2) {
        this.muBiao()
      }
      //计时
      Column() {
        Row({ space: 10 }) {
          Button('倒计时')
            .fontColor('#4a94ca')
            .backgroundColor('#f1f8fd')
          Button('正向计时')
            .fontColor('#000')
            .backgroundColor('#f2f2f2')
          Button('不计时')
            .fontColor('#000')
            .backgroundColor('#f2f2f2')
        }
        .margin({ bottom: 10 })

        Row() {
          Slider({ value: 25, min: 0, max: 180 })
            .width('70%')
            .showSteps(true)
          Button('25分钟')
            .fontColor('#4a94ca')
            .backgroundColor('#f1f8fd')
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('90%')
        .margin({ bottom: 10 })

        Text('更多设置')
          .fontColor('#4a94ca')
      }

    }
    .borderRadius(10)
  }
}