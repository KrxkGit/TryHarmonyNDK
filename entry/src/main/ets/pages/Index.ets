import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi, { add } from 'libentry.so';
import { StaticInputComponent } from './StaticInputComponent';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State firstNum: number = 0
  @State secondNum: number = 0
  @State thirdNum : number = 0
  @State result : number = 0

  build() {
    Column({ space: 10 }) {
      StaticInputComponent({promptText : '第一个数: ', inputValue : this.firstNum})
      StaticInputComponent({promptText : '第二个数: ', inputValue : this.secondNum})
      StaticInputComponent({promptText : '第三个数', inputValue : this.thirdNum})
      StaticInputComponent({promptText : '结果 ', inputValue : this.result})

      Image('https://iwiki.woa.com/tencent/api/attachments/s3/url?attachmentid=22050879')
        .width('20%')

      Button('计算')
        .onClick(() => {
          this.result = add(this.firstNum, this.secondNum, this.thirdNum)
          promptAction.showToast({message : `结果是: ${this.result}`})
        })
    }
    .width('90%')
  }
}
