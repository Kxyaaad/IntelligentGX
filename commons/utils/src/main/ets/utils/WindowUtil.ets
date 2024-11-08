import { common, Context } from "@kit.AbilityKit";
import { App, window } from "@kit.ArkUI";
import Logger from './Logger';
import { BusinessError } from "@kit.BasicServicesKit";

const TAG: string = '[WindowUtil]'

export class WindowUtil {
  public static updateStatusBarColor(context: common.BaseContext, isDark: boolean) {
    window.getLastWindow(context).then((windowClass: window.Window) => {
      try {
        windowClass.setWindowSystemBarProperties({ statusBarContentColor: isDark ? '#FFFFFF' : '#000000' }, (err) => {
          if (err.code) {
            Logger.error(TAG, 'Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
            return;
          }
          Logger.info(TAG, 'Succeeded in setting the system bar properties.');
        })
      } catch (exception) {
        Logger.error(TAG, 'Failed to set the system bar properties. Cause: ' + JSON.stringify(exception))
      }
    })
  }

  public static requestFullScreen(windowStage: window.WindowStage, context: Context): void {
    windowStage.getMainWindow((err: BusinessError, data: window.Window) => {
      if (err.code) {
        Logger.error(TAG, 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        return;
      }
      let windowClass: window.Window = data;
      Logger.info(TAG, 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      let isLayoutFullScreen = true
      try {
        let area: window.AvoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
        let naviBarArea: window.AvoidArea =
          windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
        Logger.info(TAG,
          `Succeeded get the window navigation indicator HEIGHT: ${px2vp(naviBarArea.bottomRect.height)}`);
        AppStorage.setOrCreate<number>('statusBarHeight', px2vp(area.topRect.height))
        AppStorage.setOrCreate<number>('naviIndicatorHeight', px2vp(naviBarArea.bottomRect.height))
        WindowUtil.getDeviceSize(context)
        if (area.topRect.height > 0 ) {
          let promise: Promise<void> = windowClass.setWindowLayoutFullScreen(isLayoutFullScreen)
          promise.then(() => {
            promise.then(() => {
              Logger.info(TAG, 'Succeeded in setting the window layout to full-screen mode.');
            }).catch((err: BusinessError) => {
              Logger.error(TAG, 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            });
          })
        }
      }catch {
        Logger.error(TAG, 'Failed to set the window layout to full-screen mode. ');
      }
    })
  }

  static getDeviceSize(context: Context) :void {
    window.getLastWindow(context).then((data: window.Window) => {
      let properties = data.getWindowProperties()
      AppStorage.setOrCreate('deviceHeight', px2vp(properties.windowRect.height))
      AppStorage.setOrCreate('deviceWidth', px2vp(properties.windowRect.width))

    })
  }
}
