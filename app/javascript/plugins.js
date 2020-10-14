import $ from 'jquery'

import 'chosen-js/chosen.css'
import 'chosen-js'

window.addEventListener('turbolinks:load', () => {
  $('#book_tag_ids').chosen({
    allow_single_deselect: true,
    width: '100%'
  })
});
