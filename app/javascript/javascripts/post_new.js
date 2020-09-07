
$(function () {
    $(document).on('click','.js-button-choice-linking', function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')

        // 一冊目の情報の取得

        const BookTitle = $("#js-linking-title-" + isbn).text()
        const BookAuthor = $("#js-linking-author-" + isbn).text()
        const BookIsbn = $("#js-linking-isbn-" + isbn).text()
        const BookPublisher = $("#js-linking-publisher-" + isbn).text()
        const BookImage = $("#js-linking-image-" + isbn).attr('src')
        const BookUrl = $("#js-linking-url-" + isbn).attr('href')

        // 選択した一冊目の表示
        $('#linking_book_title').html(BookTitle)
        $('#linking_book_author').html(BookAuthor)
        $('#linking_book_isbn').html(BookIsbn )
        $('#linking_book_publisher').html(BookPublisher )

        $("<img src = " + BookImage + ">").appendTo('div#linking_book_image')
        $("#linking_default_image").remove()

        $('#linking_book_url a').attr("href", BookUrl)
        $('.results_search_linking').remove()

        // hidden_fieldに格納
        $('#post_form_linking_title').val(BookTitle)
        $('#post_form_linking_author').val(BookAuthor)
        $('#post_form_linking_isbn').val(BookIsbn)
        $('#post_form_linking_publisher').val(BookPublisher)
        $('#post_form_linking_image').val(BookImage)
        $('#post_form_linking_url').val(BookUrl)

        $('#choiced_linking_book').show()

    })
});

$(function () {
    $(document).on('click','.js-button-choice-linked', function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')
        $('#review_area').show()
        // 二冊目の情報の取得

        const BookTitle = $("#js-linked-title-" + isbn).text()
        const BookAuthor = $("#js-linked-author-" + isbn).text()
        const BookIsbn = $("#js-linked-isbn-" + isbn).text()
        const BookPublisher = $("#js-linked-publisher-" + isbn).text()
        const BookImage = $("#js-linked-image-" + isbn).attr('src')
        const BookUrl = $("#js-linked-url-" + isbn).attr('href')

        // 選択した二冊目の表示
        $('#linked_book_title').html(BookTitle)
        $('#linked_book_author').html(BookAuthor)
        $('#linked_book_isbn').html(BookIsbn )
        $('#linked_book_publisher').html(BookPublisher )

        $("<img src = " + BookImage + ">").appendTo('div#linked_book_image')
        $("#linked_default_image").remove()

        $('#linked_book_url a').attr("href", BookUrl)
        $('.results_search_linked').remove()

        // hidden_fieldに格納
        $('#post_form_linked_title').val(BookTitle)
        $('#post_form_linked_author').val(BookAuthor)
        $('#post_form_linked_isbn').val(BookIsbn)
        $('#post_form_linked_publisher').val(BookPublisher)
        $('#post_form_linked_image').val(BookImage)
        $('#post_form_linked_url').val(BookUrl)

        $('#choiced_linked_book').show()
    })
});
