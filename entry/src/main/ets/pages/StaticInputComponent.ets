@Component
export  struct StaticInputComponent {
  promptText? : string
  @Link inputValue : number

  build() {
    Row() {
      Text(this.promptText)
      TextInput({placeholder : this.getPlaceholder()})
        .placeholderColor(Color.Green)
        .type(InputType.Number)
        .onChange((value) => {
          this.inputValue = parseInt(value)
        })
    }
  }

  getPlaceholder() : undefined | string {
    if (this.inputValue === 0) {
      return this.promptText
    } else {
      return this.inputValue.toString()
    }
  }
}