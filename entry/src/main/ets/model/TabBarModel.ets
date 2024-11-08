export enum TabBarType {
  MESSAGE = 0,
  MAIN = 1,
  CONTACT = 2
}

export interface TabBarData {
  id: TabBarType;
  title: ResourceStr|null;
  activeIcon: ResourceStr;
  defaultIcon: ResourceStr
}

export const TabsInfo: TabBarData[] = [
  {
    id: TabBarType.MESSAGE,
    title: $r('app.string.tab_message'),
    defaultIcon: $r('app.media.ic_tab_news'),
    activeIcon: $r('app.media.ic_tab_news_on')
  },
  {
    id: TabBarType.MAIN,
    title: null,
    defaultIcon: $r('app.media.ic_tab_main'),
    activeIcon: $r('app.media.ic_tab_main_on')
  },
  {
    id: TabBarType.CONTACT,
    title: $r('app.string.tab_contact'),
    defaultIcon: $r('app.media.ic_tab_contact'),
    activeIcon: $r('app.media.ic_tab_contact_on')
  }
]