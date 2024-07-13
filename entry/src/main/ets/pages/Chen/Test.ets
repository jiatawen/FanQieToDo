@Entry
@Component
struct Test {
  build() {
    Column(){
    }
    .width('100%')
    .height('100%')

    .backgroundImage($r('app.media.bg_classroom'))
    .backgroundImageSize({
      height:100,
      width:200
    })
  }
}