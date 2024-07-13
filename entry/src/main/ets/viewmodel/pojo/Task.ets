export class Task {
  TaskId: string
  UserId: string
  TotoId: string
  TaskTitle: string
  TaskTypeId: string
  TaskTimeType: number
  TaskTime: string
  TaskCycle: string
  TaskBegin: number
  TaskEnd: number

  constructor(TaskId: string,
              UserId: string,
              TotoId: string,
              TaskTitle: string,
              TaskTypeId: string,
              TaskTimeType: number,
              TaskTime: string,
              TaskCycle: string,
              TaskBegin: number,
              TaskEnd: number) {
    this.TaskId = TaskId
    this.UserId = UserId
    this.TotoId = TotoId
    this.TaskTitle = TaskTitle
    this.TaskTypeId = TaskTypeId
    this.TaskTimeType = TaskTimeType
    this.TaskTime = TaskTime
    this.TaskCycle = TaskCycle
    this.TaskBegin = TaskBegin
    this.TaskEnd = TaskEnd
  }
}

export function taskTests() {

  return new Array<Task>(new Task('T001', 'U001', 'TO001', '编写报告1', '0', 0, '120', '每周', new Date('2001-10-10').getTime(), new Date('2010-10-10').getTime()), new Task('T002', 'U002', 'TO002', '编写报告2', '1', 1, '120', '每月', new Date('2000-01-10').getTime(), new Date('2000-01-20').getTime()))
}