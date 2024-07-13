import router from '@ohos.router';
import http from '@ohos.net.http'
import store from '../Store'

// 数据统计
@Entry
@Component
struct Register {


  @State username: string = '';
  @State email: string = '';
  @State password: string = '';

  login(){
    let httpRequest = http.createHttp()
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      //"http://1.14.13.203:8888/api/user/register",
      "http://127.0.0.1:8888/api/user/register",
      {
        method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
        // 当使用POST请求时此字段用于传递内容
        extraData: {
          "username": this.username,
          "email": this.email,
          "password": this.password
        },
      }, (err, data) => {
      if (!err) {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        router.pushUrl({
          url:'pages/Chang/Login'
        })
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
        Text('注册')
          .fontWeight(700)
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      Column({ space: 10 }){
        Row(){
          TextInput({placeholder: '请输入用户名'})
            .onChange((username) => this.username = username)
            .backgroundColor('#FFF')
        }
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
          Button('注册')
            .width(200)
            .onClick(() => this.login())
        }
        Row(){
          Button('已有账号？登录')
            .backgroundColor(Color.Gray)
            .width(200)
            .onClick(() => {
              router.pushUrl({
                url:'pages/Chang/Login'
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