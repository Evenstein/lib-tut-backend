import $ from 'jquery'

import 'chosen-js/chosen.css'
import 'chosen-js'

window.addEventListener('turbolinks:load', () => {
  $('#book_tag_ids').chosen({
    allow_single_deselect: true,
    width: '100%'
  });

  $(".books-table tr[data-link]").on('click', (e) => {
    e.preventDefault();
    let target = e.target.parentElement;
    if (!target.classList.contains('book-row')) {
      target = target.parentElement;
    }
    window.location = $(target).data('link')
  });
});
