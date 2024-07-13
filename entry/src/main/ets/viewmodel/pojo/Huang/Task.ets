export class Task {
  TaskId: string//任务id
  UserId: string//用户id
  TaskTitle: string//任务名称
  TaskTypeId: string//任务类型:0为普通番茄钟，1为
  TaskTimeType: number
  TaskTime: string
  SignalTime: number
  TaskCycle: string
  TaskBegin: number
  TaskEnd: number

  constructor(TaskId: string,
              UserId: string,
              TaskTitle: string,
              TaskTypeId: string,
              TaskTimeType: number,
              SignalTime: number,
              TaskTime: string,
              TaskCycle: string,
              TaskBegin: number,
              TaskEnd: number) {
    this.TaskId = TaskId
    this.UserId = UserId
    this.TaskTitle = TaskTitle
    this.TaskTypeId = TaskTypeId
    this.SignalTime = SignalTime
    this.TaskTimeType = TaskTimeType
    this.TaskTime = TaskTime
    this.TaskCycle = TaskCycle
    this.TaskBegin = TaskBegin
    this.TaskEnd = TaskEnd
  }
}

export function taskTests() {

  return new Array<Task>(
    new Task('T001', 'U001',  '编写报告1', '0', 0,10, '120', '每周', new Date('2001-10-10').getTime(), new Date('2010-10-10').getTime()),
    new Task('T002', 'U002',  '编写报告2', '1', 1,30, '120', '每月', new Date('2000-01-10').getTime(), new Date('2000-01-20').getTime()))
}