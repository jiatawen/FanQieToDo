import router from '@ohos.router';
import http from '@ohos.net.http'
import store from '../Store'

// 数据统计
@Entry
@Component
struct Login {


  @State email: string = '';
  @State password: string = '';

  login(){
    let httpRequest = http.createHttp()
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      "http://1.14.13.203:8888/api/user/login",
      {
        method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJGYW5RaWUiLCJpZCI6MSwibmFtZSI6ImN4eSIsImV4cCI6MTcyMDkyMjAxNX0.8AXQie4R94a52yOUGdyWbNtBmTPH_EfyZbLuvJn9Ui4'
        },
        // 当使用POST请求时此字段用于传递内容
        extraData: {
          "email": this.email,
          "password": this.password
        },
      }, (err, data) => {
      if (!err) {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        let resultObj = JSON.parse(data.result.toString());
        store.setToken(resultObj.data.token)
        store.setUser({
          UserId: resultObj.data.id.toString(),
          UserName: resultObj.data.username,
          UserEmail: resultObj.data.email,
          Password: '213',
          UserImage: $r('app.media.p_user')
        })
        router.replaceUrl({
          url:'pages/Index'
        })

        console.log(JSON.stringify(store.getUser()));
      } else {
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      }
    }
    );
  }
  build() {
    Column() {
      //导航栏
      Row() {
        Text('登录')
          .fontWeight(700)
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      Column({ space: 10 }){
        Row(){
          TextInput({placeholder: '请输入邮箱'})
            .onChange((email) => this.email = email)
            .backgroundColor('#FFF')
        }
        Row(){
          TextInput({placeholder: '请输入密码'})
            .type(InputType.Password)
            .onChange((password) => this.password = password)
            .backgroundColor('#FFF')
        }
        Row(){
          Button('登录')
            .width(200)
            .onClick(() => this.login())
        }
        Row(){
          Button('注册')
            .backgroundColor(Color.Gray)
            .width(200)
            .onClick(() => {
              router.pushUrl({
                url:'pages/Chang/Register'
              })
            })
        }
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
    }
    .backgroundImage($r('app.media.bg_5'))
    .backgroundImageSize(ImageSize.Cover)
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}