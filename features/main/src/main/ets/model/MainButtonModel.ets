export interface MainButtonData {
  id: MainButtonType,
  title: ResourceStr,
  icon: ResourceStr
}

export enum MainButtonType {
  TO_DO = 0,
  DONE = 1,
  TO_READ = 2,
  READ = 3,
  MY_POST = 4,
  FILE_MONITORING = 5,
  MY_ARCHIVE = 6,
  FILE_ARCHIVE = 7,
  FILE_MANAGE = 8,
  HISTORY_DATA = 9
}

export const MainButtonInfo: MainButtonData[] = [
  {
    id: MainButtonType.TO_DO,
    title: $r('app.string.to_do'),
    icon: $r('app.media.ic_todo_task')
  },
  {
    id: MainButtonType.DONE,
    title: $r('app.string.done'),
    icon: $r('app.media.ic_todo_task_completed')
  },
  {
    id: MainButtonType.TO_READ,
    title: $r('app.string.to_read'),
    icon: $r('app.media.ic_todo_read')
  },
  {
    id: MainButtonType.READ,
    title: $r('app.string.read'),
    icon: $r('app.media.ic_todo_read_completed')
  },
  {
    id: MainButtonType.MY_POST,
    title: $r('app.string.my_post'),
    icon: $r('app.media.ic_my_post')
  },
  {
    id: MainButtonType.MY_ARCHIVE,
    title: $r('app.string.my_archive'),
    icon: $r('app.media.ic_my_archive')
  },

  {
    id: MainButtonType.FILE_MONITORING,
    title: $r('app.string.file_monitoring'),
    icon: $r('app.media.ic_file_monitoring')
  },

  {
    id: MainButtonType.MY_ARCHIVE,
    title: $r('app.string.my_archive'),
    icon: $r('app.media.ic_my_archive')
  },
  {
    id: MainButtonType.FILE_ARCHIVE,
    title: $r('app.string.file_archive'),
    icon: $r('app.media.ic_file_archive')
  },
  {
    id: MainButtonType.FILE_MANAGE,
    title: $r('app.string.file_manage'),
    icon: $r('app.media.ic_file_manage')
  },
  {
    id: MainButtonType.HISTORY_DATA,
    title: $r('app.string.history_data'),
    icon: $r('app.media.ic_history_data')
  },
]