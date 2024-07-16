import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi, { add } from 'libentry.so';
import { StaticInputComponent } from './StaticInputComponent';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State firstNum: number = 0
  @State secondNum: number = 0
  @State thirdNum: number = 0
  @State result: number = 0

  AlignRus: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
    'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
    'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
  }

  AlignRue: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
    'top': { 'anchor': 'row1', 'align': VerticalAlign.Bottom },
    'right': { 'anchor': 'row1', 'align': HorizontalAlign.End }
  }

  build() {
    RelativeContainer() {
      Row().width(100).height(100)
        .backgroundColor("#FF3333")
        .alignRules(this.AlignRus)
        .id("row1")

      Row().width(100).height(100)
        .backgroundColor("#FFCC00")
        .alignRules(this.AlignRue)
        .id("row2")
        .offset({x : 0, y : 10})
    }.width(300).height(300)
  }
}
