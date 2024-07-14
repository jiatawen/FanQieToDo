import router from '@ohos.router';
import http from '@ohos.net.http'
import store from '../Store'


// 数据统计
@Entry
@Component
export default struct Statistics {


  @State totalTask: number = 0;
  @State totalDesire: number = 0;
  @State totalCheck: number = 0;
  @State totalUpcoming: number = 0;
  @State totalCreateRoom: number = 0;
  @State totalJoinRoom: number = 0;

  getData(){
    store.setToken('123')
    console.log('Token' + store.getToken());
    let httpRequest = http.createHttp()
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      "http://127.0.0.1:8888/api/user/statistics",
      {
        method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Authorization': 'Bearer ' + store.getToken()
        },
      }, (err, data) => {
      if (!err) {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + JSON.stringify(data.result));
        console.info('Result:' + data.result);
        let resultObj = JSON.parse(data.result.toString());
        this.totalTask = resultObj.data.totalTask
        this.totalDesire = resultObj.data.totalDesire
        this.totalCheck = resultObj.data.totalCheck
        this.totalUpcoming = resultObj.data.totalUpcoming
        this.totalCreateRoom = resultObj.data.totalCreateRoom
        this.totalJoinRoom = resultObj.data.totalJoinRoom
        console.info('code:' + JSON.stringify(data.responseCode));
      } else {
        console.info('error:' + JSON.stringify(err));
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      }
    }
    );
  }

  onPageShow(){
    this.getData()
  }

  @Builder
  StatisticsTab() {
    Column({ space: 5 }) {
      Text('任务总数')
        .fontSize(15)
        .fontWeight(700)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Clip })
      Text(`${this.totalTask}`)
        .fontColor('#929292')
        .fontSize(11)
      Text('继续加油哦')
        .fontColor('#929292')
        .fontSize(11)
    }
    .alignItems(HorizontalAlign.Start)
    .width('90%')
    .margin({ bottom: 20 })
  }

  build() {
    Column({ space: 10 }) {
      //导航栏
      Row() {
        Image($r('app.media.ic_close'))
          .width(25)
          .onClick(() => {
            router.back()
          })
        Text('数据统计')
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
          Text(`${store.getUser().UserName}`)
            .fontColor('#fff')
          Image($r('app.media.ic_picture'))
            .fillColor('#fff')
            .width(25)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(HorizontalAlign.Start)
      .padding(25)
      .width('95%')
      .height(180)
      .linearGradient({ angle: 90, colors: [['#ff797979', 0], ['#353c42', 1]] })
      .borderRadius(20)

      Text('看看你用番茄实现了哪些心愿')
        .fontSize(12)
        .fontColor('#2ba6dc')
        .backgroundColor('#e9f6fe')
        .width('80%')
        .height(30)
        .padding(2)
        .textAlign(TextAlign.Center)
        .borderRadius(15)
        .margin({ top: 5 })

      //滚动区
      Scroll() {
        Column() {
          Row(){
            Column({ space: 5 }) {
              Text('任务总数')
                .fontSize(15)
                .fontWeight(700)
              Text(`${this.totalTask}`)
                .fontColor('#929292')
                .fontSize(11)
              Text('继续加油哦')
                .fontColor('#929292')
                .fontSize(11)
            }
            .alignItems(HorizontalAlign.Center)
            .width('90%')
            .margin({ bottom: 20 })
          }
          Row(){
            Column({ space: 5 }) {
              Text('愿望总数')
                .fontSize(15)
                .fontWeight(700)
              Text(`${this.totalDesire}`)
                .fontColor('#929292')
                .fontSize(11)
              Text('继续加油哦')
                .fontColor('#929292')
                .fontSize(11)
            }
            .alignItems(HorizontalAlign.Center)
            .width('90%')
            .margin({ bottom: 20 })
          }
          Row(){
            Column({ space: 5 }) {
              Text('打卡总数')
                .fontSize(15)
                .fontWeight(700)
              Text(`${this.totalCheck}`)
                .fontColor('#929292')
                .fontSize(11)
              Text('继续加油哦')
                .fontColor('#929292')
                .fontSize(11)
            }
            .alignItems(HorizontalAlign.Center)
            .width('90%')
            .margin({ bottom: 20 })
          }
          Row(){
            Column({ space: 5 }) {
              Text('代办集总数')
                .fontSize(15)
                .fontWeight(700)
              Text(`${this.totalUpcoming}`)
                .fontColor('#929292')
                .fontSize(11)
              Text('继续加油哦')
                .fontColor('#929292')
                .fontSize(11)
            }
            .alignItems(HorizontalAlign.Center)
            .width('90%')
            .margin({ bottom: 20 })
          }
          Row(){
            Column({ space: 5 }) {
              Text('创建自习室总数')
                .fontSize(15)
                .fontWeight(700)
              Text(`${this.totalCreateRoom}`)
                .fontColor('#929292')
                .fontSize(11)
              Text('继续加油哦')
                .fontColor('#929292')
                .fontSize(11)
            }
            .alignItems(HorizontalAlign.Center)
            .width('90%')
            .margin({ bottom: 20 })
          }
          Row(){
            Column({ space: 5 }) {
              Text('加入自习室总数')
                .fontSize(15)
                .fontWeight(700)
              Text(`${this.totalJoinRoom}`)
                .fontColor('#929292')
                .fontSize(11)
              Text('继续加油哦')
                .fontColor('#929292')
                .fontSize(11)
            }
            .alignItems(HorizontalAlign.Center)
            .width('90%')
            .margin({ bottom: 20 })
          }
        }
      }
      .scrollBar(BarState.Off)
      .height('50%')
    }
    .padding(20)
  }
}