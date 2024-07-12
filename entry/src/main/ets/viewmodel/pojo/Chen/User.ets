/**
 * 用户类
 */

export class User {
  uId: string
  uName: string
  uPortraits: ResourceStr
  uSignature: string

  constructor(uId: string,
              uName: string,
              uPortraits: ResourceStr,
              uSignature: string) {
    this.uId = uId
    this.uName = uName
    this.uPortraits = uPortraits
    this.uSignature = uSignature
  }
}
/**
 * 用户测试数据
 */
export function userTest(){
  return new User('abcdefghijklmnopq','认养一头猪',$r('app.media.p_user'),'千里之行始于足下')
}