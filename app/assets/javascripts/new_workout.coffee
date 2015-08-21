$ ->
  $('.mini').click ->
    console.log(this.children[1])
    $(this.children[1]).toggleClass 'hide'
    $(this.children[0].children[0]).toggleClass 'arrow-down arrow-up'
