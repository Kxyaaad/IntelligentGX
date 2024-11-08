import { TabComponent } from '@cornflower/tabslayout'
import { TabBarType } from '../model/TabBarModel';
import { MainView } from 'main';
import { AppConstants } from '../constants/AppConstants';
import { CustomTabBar } from '../components/CustomTabBar';
import { MessageView } from 'message';
import { ContactView } from 'contacts';
import { BreakpointSystem, BreakpointTypeEnum } from 'utils';
import { WindowUtil } from 'utils/src/main/ets/utils/WindowUtil';

@Entry
@Component
struct MainPage {
  @State currentIndex: TabBarType = TabBarType.MAIN
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointTypeEnum.SM
  private breakpointSystem: BreakpointSystem = new BreakpointSystem()
  @Provide('appPathStack') appPathStack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    this.breakpointSystem.register()
  }

  aboutToDisappear(): void {
    this.breakpointSystem.unregister()
  }

  build() {
    Navigation(this.appPathStack) {
      Flex({
        direction: FlexDirection.Column
      }) {
        Tabs({
          index: this.currentIndex
        }) {
          TabContent() {
            MessageView()
          }

          TabContent() {
            MainView()
          }

          TabContent() {
            ContactView()
          }
        }
        .layoutWeight(1)
        .barHeight(0)
        .scrollable(true)
        .onChange((index) => {
          this.currentIndex = index
        })

        CustomTabBar({ currentIndex: this.currentIndex })
      }

      .width(AppConstants.FULL_PERCENT)
      .height(AppConstants.FULL_PERCENT)
      .backgroundColor((this.currentBreakpoint === BreakpointTypeEnum.LG && this.currentIndex === TabBarType.MAIN) ?
      $r('app.color.clear_color') : $r('sys.color.ohos_id_color_sub_background'))
    }
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}