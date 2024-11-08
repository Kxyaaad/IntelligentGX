import { TabBarData, TabBarType, TabsInfo } from "../model/TabBarModel"
import { faceDetector } from "@kit.CoreVisionKit";
import { AppConstants } from "../constants/AppConstants";
import { BreakpointType, BreakpointTypeEnum } from "utils";

@Component
export struct CustomTabBar {
  @Link currentIndex: TabBarType
  @StorageLink('currentBreakpoint') currentBreakpoint: BreakpointTypeEnum = BreakpointTypeEnum.SM
  @StorageProp('naviIndicatorHeight') naviIndicatorHeight: number = 0

  onChange(index: TabBarType): void {
    this.currentIndex = index;
  }

  build() {
    Flex({
      direction: this.currentBreakpoint === BreakpointTypeEnum.LG ? FlexDirection.Column : FlexDirection.Row,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceAround
    }) {
      ForEach(TabsInfo, (item: TabBarData) => {
        TabItem({
          index: item.id,
          selectedIndex: this.currentIndex,
          onChange: (index: number) => this.onChange(index)
        })
      }, (item: TabBarData) => item.id.toString())
    }
    .backgroundColor(this.currentBreakpoint === BreakpointTypeEnum.LG && this.currentIndex === TabBarType.MAIN ?
    $r('sys.color.ohos_id_color_switch_bg_off') : $r('sys.color.ohos_id_color_sub_background'))
    .backgroundBlurStyle(this.currentBreakpoint === BreakpointTypeEnum.LG && this.currentIndex === TabBarType.MAIN ?
    BlurStyle.BACKGROUND_THIN : BlurStyle.NONE)
    .border({
      width: this.currentBreakpoint === BreakpointTypeEnum.LG ? { right: $r('app.float.tab_border_width') } :
        { top: $r('app.float.tab_border_width') },
      color: $r('sys.color.ohos_id_color_text_field_sub_bg')
    })
    .padding(this.currentBreakpoint === BreakpointTypeEnum.LG ?
      { top: AppConstants.TAB_PERCENT, bottom: this.naviIndicatorHeight }
      : { bottom: this.naviIndicatorHeight })
    .clip(false)
    .height(new BreakpointType<Length>({
      sm: AppConstants.TAB_HEIGHT + (this.naviIndicatorHeight || 0),
      md: AppConstants.TAB_HEIGHT + (this.naviIndicatorHeight || 0),
      lg: AppConstants.FULL_PERCENT
    }).getValue(this.currentBreakpoint))
    .width(new BreakpointType<Length> ({
      sm: AppConstants.FULL_PERCENT,
      md: AppConstants.FULL_PERCENT,
      lg: $r('app.float.tool_bar_width')
    }).getValue(this.currentBreakpoint))
  }
}

@Component
struct TabItem {
  @Prop index: number
  @Prop selectedIndex: number;
  onChange: (index: number) => void = () => {
  };

  build() {
    Column() {
      Image(this.selectedIndex === this.index ?
      TabsInfo[this.index].activeIcon : TabsInfo[this.index].defaultIcon)
        .size(this.index === TabBarType.MAIN ?
          { width: $r('app.float.tab_big_img_width'), height: $r('app.float.tab_big_img_height') } :
          { width: $r('app.float.tab_img_size'), height: $r('app.float.tab_img_size') })

      Text(TabsInfo[this.index].title)
        .fontSize($r('app.float.tab_font_size'))
        .margin($r('app.float.tab_title_margin'))
        .fontWeight(AppConstants.TAB_FONT_WEIGHT)
        .fontColor(this.index === this.selectedIndex ?
        Color.Red:
        $r('sys.color.ohos_id_color_bottom_tab_text_off'))
    }
    .clip(false)
    .padding({
      top: $r('app.float.sm_padding_margin'),
      bottom: $r('app.float.sm_padding_margin')
    })
    .layoutWeight(1)
    .size({ height: AppConstants.FULL_PERCENT })
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      if (this.selectedIndex !== this.index) {
        this.onChange(this.index)
      }
    })

  }
}