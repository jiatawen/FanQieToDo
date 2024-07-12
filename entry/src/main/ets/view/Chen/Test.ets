@Entry
@Component
struct Test {
  @State messages: Message[] = fn()

  build() {
    Column({ space: 5 }) {
      ForEach(this.messages, (item: Message, index) => {
        Row() {
          Text(`${item.time}`)
          Text(`${item.like}`)
        }
        .justifyContent(FlexAlign.SpaceAround)
        .width('50%')
        .height(30)
        .border({ width: 1 })
      })
      Button('按钮')
        .onClick(() => {
          this.messages.sort((a, b) => {
            return a.time - b.time
          })
        })
    }
    .width('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}

class Message {
  like: number
  time: number

  constructor(like: number, time: number) {
    this.like = like
    this.time = time
  }
}

const fn = () => {
  let messages: Message[] = new Array()
  messages = [
    new Message(Math.floor(Math.random() * 10), Math.floor(Math.random() * 10)),
    new Message(Math.floor(Math.random() * 10), Math.floor(Math.random() * 10)),
    new Message(Math.floor(Math.random() * 10), Math.floor(Math.random() * 10)),
    new Message(Math.floor(Math.random() * 10), Math.floor(Math.random() * 10)),
    new Message(Math.floor(Math.random() * 10), Math.floor(Math.random() * 10)),
    new Message(Math.floor(Math.random() * 10), Math.floor(Math.random() * 10)),
  ]
  console.log(JSON.stringify(messages));
  return messages
}