/**
 * 用户类
 */

export class User {
  UserId: string
  UserName: string
  UserEmail: string
  Password: string
  UserImage: ResourceStr

  constructor(UserId: string,
              UserName: string,
              UserEmail: string,
              Password: string,
              UserImage: ResourceStr) {
    this.UserId = UserId
    this.UserName=UserName
    this.UserEmail = UserEmail
    this.Password = Password
    this.UserImage = UserImage
  }
}
/**
 * 用户测试数据
 */
export function userTest() {
 return new User('U001','胖胖欢猪','abc@example.com','password1',$r('app.media.p_user'))
}