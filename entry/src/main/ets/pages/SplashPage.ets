import { BreakpointSystem, Logger, BreakpointTypeEnum } from 'utils';
import { WindowUtil } from 'utils/src/main/ets/utils/WindowUtil';
import { AppConstants } from '../constants/AppConstants'

const TAG: string = '[SplashPage]';

@Entry
@Component
struct SplashPage {
  @State rotateValue: number = 0; // 组件一旋转角度
  @State animate: boolean = false;
  @StorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointTypeEnum.MD;
  private breakpointSystem: BreakpointSystem = new BreakpointSystem();

  aboutToAppear(): void {
    this.dynamicLoading()
    setTimeout(() => {
      this.checkAgreedPrivacy()
    }, 0)
    this.breakpointSystem.register();

  }

  onPageShow(): void {
    WindowUtil.updateStatusBarColor(getContext(this), true)
  }

  dynamicLoading(): void {
    try {
      // import('../../../../../features/Login/src/main/ets/pages/LoginPage')
    } catch (err) {
      Logger.error(TAG, 'dynamicLoading error:' + err);
    }
  }

  checkAgreedPrivacy(): void {
    //todo  检查权限
    this.init()
  }

  init(): void {
    this.LoadingResource()
  }

  /**
   * 加载用户资料
   */
  LoadingResource(): void {

  }

  build() {
    Stack({
      alignContent: Alignment.Center | Alignment.Bottom
    }) {
      Image($r('app.media.launch_background'))
      Image($r("app.media.img_wait"))
        .width(50)
        .height(50)
        .margin({
          bottom: 50
        })
        .rotate({ angle: this.rotateValue })
        .animation({
          curve: Curve.Linear, onFinish: () => {
            this.rotateValue = this.animate ? this.rotateValue += 90 : this.rotateValue
          }
        })
        .onAppear(() => {
          this.animate = true
          this.rotateValue = 90
        })
    }
    .width(AppConstants.FULL_PERCENT)
    .height(AppConstants.FULL_PERCENT)
  }
}