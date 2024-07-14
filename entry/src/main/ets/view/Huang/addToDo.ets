import { Task } from '../../viewmodel/pojo/Task'


/*
 * 添加任务弹窗
 *
*/

// 番茄钟类型tab选中时字体样式
@Extend(Text) function selectedTitle() {
  .height('100%')
  .layoutWeight(1)
  .textAlign(TextAlign.Center)
  .backgroundColor('#fff')
  .borderRadius(10)
}

//番茄钟类型tab未选中时字体样式
@Extend(Text) function unselectedTitle() {
  .layoutWeight(1)
  .textAlign(TextAlign.Center)
}


//创建添加任务弹窗
@CustomDialog
export default struct addToDo {
  controller:CustomDialogController
  @Link tasks:Task[];
  @State task:Task = new Task('T001', 'U001',  '编写报告1', '0', '0',10, 25, '每周', new Date('2001-10-10').getTime(), new Date('2010-10-10').getTime())
  @BuilderParam addType: () => void = this.muBiao
  @State jieZhiTime: string = '设定截止日期'
  @State setMin: number = 25


  //构建养习惯设置组件
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

  //构建定目标页面时间选择组件
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
                this.jieZhiTime = `${value.year}-${value.month + 1}-${value.day}`
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
      //顶部
      Row() {
        Image($r('app.media.ic_close'))
          .width(25)
        Text('添加待办')
          .fontWeight(700)
          .fontSize(20)
        Image($r('app.media.ic_correct'))
          .width(25)
          //点击事件：添加任务对象到任务数组
          .onClick(()=>{
            this.tasks.push(this.task)
            this.task.TaskTime = Math.floor(this.task.TaskTime)
            console.log(JSON.stringify(this.tasks));
            this.controller.close()//关闭弹窗
          })
      }
      .backgroundColor('#eeeeee')
      .padding(8)
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ bottom: 10 })

      // if else 实现tab切换样式
      // 选中普通番茄钟
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
        // 选中定时番茄钟
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
        }
        // 选中定目标番茄钟
        else if (this.selectedModel == 2) {
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
        .onChange((value: string) => {
          console.log(value);
          this.task.TaskTitle = value
          console.log(JSON.stringify(this.task));
        })

      //中间部分

      if (this.selectedModel == 1) {
        this.xiGuan()
      }
      if (this.selectedModel == 2) {
        this.muBiao()
      }
      //计时番茄钟
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
          //进度条滑动：默认值25，最大值180
          Slider({ value: 25, min: 0, max: 180, step: 1 })
            .width('70%')
            .showSteps(true)
            //数据更新事件
            .onChange((value: number) => {
              this.setMin = value
              this.task.TaskTime = value
            })
          Button(`${this.setMin}分钟`)
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

@Component
struct Test {
  // dialogController: CustomDialogController = new CustomDialogController({
  //   builder: addToDo()
  // })

  build() {
    Button('点击按钮')
      .onClick(() => {
        // this.dialogController.open()
      })
  }
}