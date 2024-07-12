import * as User from '../../viewmodel/pojo/Chen/User'
import router from '@ohos.router';
/**
 * 字体样式
 */

@Extend(Text) function fontTab() {
  .fontColor('#c34a24')
  .fontSize(10)
  .backgroundColor('#ffe6df')
  .height(15)
  .padding({ left: 5, right: 5 })
  .textAlign(TextAlign.Center)
  .borderRadius(5)
}

/**
 * 我的页面盒子组件
 * 参数:img,txt1,txt2
 */

@Component
export struct box {
  i: number = 0
  img: ResourceStr[] = [$r('app.media.ic_vip_clock'), $r('app.media.ic_cloud'), $r('app.media.ic_time'), $r('app.media.ic_picture'), $r('app.media.ic_four_box'), $r('app.media.ic_theme'), $r('app.media.ic_widgets'), $r('app.media.ic_setting_green'), $r('app.media.ic_help_blue'), $r('app.media.ic_share')]
  txt1: string[] = ['季度卡', '备份|恢复|云同步', '专注计时核心设置', '海报背景和外观', '自定义底栏模块', '主题颜色搭配', '桌面小组件选项', '其他设置', '帮助|常见问题', '分享给朋友们']
  txt2: string[] = ['众多新颖高级功能，助你养成专注好习惯', '', '铃声震动|专注格言|休息时长', '主界面和计时页面海报|待办卡片背景', '选择要在主界面展示的功能', '主题色|专注分布图配色', '小组件功能|背景图等', '语言设置等', '常见的使用问题和解决方案|隐私政策', '']
  url: string[] = ['pages/Chen/Vip', 'pages/Chen/Cloud','pages/Chen/KeepTime']

  build() {
    Row() {
      //图标
      Image(this.img[this.i])
        .width(25)
      // 若有两段文本则第二段为小号灰色
      if (this.txt2[this.i] != '') {
        Column({ space: 5 }) {
          Text(this.txt1[this.i])
            .fontSize(15)
          Text(this.txt2[this.i])
            .fontColor('#ccc')
            .fontSize(10)
        }
        .width('90%')
        .margin({ left: 25 })
        .alignItems(HorizontalAlign.Start)
      }
      else {
        Text(this.txt1[this.i])
          .fontSize(15)
          .width('90%')
          .margin({ left: 25 })
      }

      //添加主题色块
      if (this.i == 5) {
        Text()
          .width(15)
          .height(15)
          .borderRadius(7.5)
          .backgroundColor('#ff726e')
          .position({
            x: 300,
            y: 15
          })
      }
    }
    .alignItems(VerticalAlign.Center)
    .padding(10)
    .width('100%')
    .height(60)
    .backgroundColor('#fff')
    .onClick(() => {
      router.pushUrl({
        url:this.url[this.i]
      })
    })
  }
}


/**
 * 用户展示栏
 */
@Builder
export function userTable(a: number = 11) {
  Column({ space: 5 }) {
    Row() {
      //用户头像
      Image(User.userTest().uPortraits)
        .width(56)
        .borderRadius(28)
      //皇冠
      Image($r('app.media.ic_crown'))
        .width(40)
        .fillColor('#ddd') //'#ddd'灰色或'#fbd451'金色
        .rotate({ angle: 45 })
        .position({
          x: 34,
          y: -15
        })
      //用户标签
      Row({ space: 5 }) {
        Text(`共专注${a}天`)
          .fontTab()
        Text(`连续专注${12}天`)
          .fontTab()
      }
      .margin({ left: 30 })
    }
    .alignItems(VerticalAlign.Bottom)
    .width('100%')

    //用户昵称
    Text(User.userTest().uName)
      .fontColor('#fff')
    //签名
    Text(User.userTest().uSignature)
      .fontColor('#fff')
      .fontSize(10)
  }
  .padding({
    left: 20,
    right: 20,
    top: 30
  })
  .alignItems(HorizontalAlign.Start)
  .backgroundImage($r('app.media.bg_user_title'))
  .backgroundImagePosition({
    x: -100,
    y: -140
  })
  .backgroundImageSize({ width: 400 })
  .width('100%')
  .height(140)
}

interface menuIconDemo {
  img: ResourceStr
  imgColor: ResourceColor
  txt: string
}

/**
 * menu菜单栏
 */
@Builder
export function menu() {
  Row() {
    menuIcon({ img: $r('app.media.ic_daojishi'), imgColor: '#5bc7a5', txt: '未来倒计时' })
    menuIcon({ img: $r('app.media.ic_history'), imgColor: '#49c4ff', txt: '专注历史记录' })
    menuIcon({ img: $r('app.media.ic_zixishi'), imgColor: '#fd8584', txt: '自习室|许愿墙' })
  }
  .padding(10)
  .height(65)
  .justifyContent(FlexAlign.SpaceAround)
  .width('100%')
  .alignItems(VerticalAlign.Center)
  .backgroundColor('#fff')
}

/**
 * menu菜单项
 */

@Builder
function menuIcon(demo: menuIconDemo) {
  Column({ space: 5 }) {
    Image(demo.img)
      .width(30)
      .fillColor(demo.imgColor)
    Text(demo.txt)
      .fontSize(10)
      .fontWeight(700)
  }
  .height('100%')
}


// 页面顶端导航栏部分
@Builder
export function Minetitle(color: ResourceColor = '#ff7a75') {
  Row() {
    Text('我的')
      .fontColor('#fff')
      .fontSize(20)
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
  .justifyContent(FlexAlign.SpaceBetween)
  .alignItems(VerticalAlign.Bottom)
  .padding({ bottom: 25, left: 20, right: 20 })
  .backgroundColor('#ff726e')
  .width('100%')
  .height(100)
}

