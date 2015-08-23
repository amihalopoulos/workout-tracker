$ ->
  $('.mini').click ->
    $(this.children[1]).slideToggle("slow");
    $(this.children[1]).toggleClass 'hide'
    $(this.children[0].children[0]).toggleClass 'arrow-down arrow-up'
