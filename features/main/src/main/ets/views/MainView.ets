import { CommonConstants } from "utils"
import { MainButtonData, MainButtonInfo } from "../model/MainButtonModel"
import App from "@system.app"
import { print } from "@kit.BasicServicesKit"

@Component
@Preview
export struct MainView {
  // @Consume('appPathStack') appPathStack: NavPathStack

  build() {
    Column() {
      Row() {
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Column() {
            Image($r('app.media.ic_scan_qrcode'))
              .width($r('app.float.button_image_height'))
              .height($r('app.float.button_image_height'))
            Text($r('app.string.scan_qrcode'))
              .fontColor(Color.White)
              .fontSize($r('app.float.button_text_size'))
          }
        }
        .width($r('app.float.button_width'))
        .padding($r('app.float.button_padding'))
        .backgroundColor(Color.Transparent)

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Column() {
            Image($r('app.media.ic_setting'))
              .width($r('app.float.button_image_height'))
              .height($r('app.float.button_image_height'))
            Text($r('app.string.setting'))
              .fontColor(Color.White)
              .fontSize($r('app.float.button_text_size'))
          }
        }
        .width($r('app.float.button_width'))
        .padding($r('app.float.button_padding'))
        .backgroundColor(Color.Transparent)

        Search({ placeholder: '请输入搜索关键字' })
          .focusable(false)
          .textFont({ size: $r('app.float.large_text_size') })
          .fontColor(Color.White)
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .onClick(() => {
            //TODO  跳转搜索页面
          })


        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Column() {
            Text($r('app.string.new_item'))
              .fontColor(Color.White)
              .fontSize($r('app.float.large_text_size'))
          }
        }
        .width($r('app.float.button_width'))
        .padding($r('app.float.button_padding'))
        .backgroundColor(Color.Transparent)
      }
      .margin({
        left: CommonConstants.SPACE_12,
        right: CommonConstants.SPACE_12
      })
      .width(CommonConstants.FULL_PERCENT)
      .backgroundColor(Color.Red)
      .padding({
        top: AppStorage.get<number>('statusBarHeight')
      })

      Grid() {
        ForEach(MainButtonInfo, (item: MainButtonData) => {
          GridItem() {
            ItemButton({
              index: item.id
            })
          }
        }, (button: MainButtonData) => button.id.toString())
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(8)
      .height(160)
      .padding(10)
      .backgroundColor(Color.White)

      Text($r('app.string.your_work_finished'))
        .margin(CommonConstants.SPACE_16)
        // .visibility(Visibility.Hidden)
      List()
        .layoutWeight(1)
    }
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)

  }
}

@Component
struct ItemButton {
  @Prop index: number

  build() {
    Column() {
      Image(MainButtonInfo[this.index].icon)
        .size({
          width: $r('app.float.main_view_button_image_width'),
          height: $r('app.float.main_view_button_image_width')
        })
      Text(MainButtonInfo[this.index].title)
        .fontSize($r('app.float.small_text_size'))
        .margin({top: 5})
    }
  }
}