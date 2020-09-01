
$(function () {
    $(document).on('click','.js-button-choice-linking',function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')
        console.log(this)
        const choiceBook = $('#id-linking-' + isbn);

        $(".list-item-linking").hide();
        $(choiceBook).show()

        $("#post_form_linking_book_title").val($("#js-book-title-" + isbn).html());
        $("#post_form_linking_book_author").val($("#js-book-author-" + isbn).html());
        $("#post_form_linking_book_isbn").val($("#js-book-isbn-" + isbn).html());
        $("#post_form_linking_book_publisher").val($("#js-book-publisher-" + isbn).html());
        const image = $("#js-book-image-" + isbn).attr('src')
        console.log(image)
        $("#post_form_linking_book_image").val(image);
        $("#post_form_linking_book_url").val($("#js-book-url-" + isbn).html());

    })
});

$(function () {
    $(document).on('click','.js-button-choice-linked',function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')
        const choiceBook = $('#id-linked-' + isbn);

        $(".list-item-linked").hide();
        $(choiceBook).show()
    })
});