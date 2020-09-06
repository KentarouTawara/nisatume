
$(function () {
    $(document).on('click','.js-button-choice-linking', function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')

        $('#linking_book_title').html($("#js-linking-title-" + isbn).text())
        $('#linking_book_author').html($("#js-linking-author-" + isbn).text())
        $('#linking_book_isbn').html($("#js-linking-isbn-" + isbn).text())
        $('#linking_book_publisher').html($("#js-linking-publisher-" + isbn).text())

        const book_image = $("#js-linking-image-" + isbn).attr('src')
        $("<img src = " + book_image + ">").appendTo('div#linking_book_image')
        $("#linking_default_image").remove()

        const book_url = $("#js-linking-url-" + isbn).attr('href')
        $('#linking_book_url a').attr("href", book_url)
        $('.results_search_linking').remove()
        $('#linking_book').show()


    })
});

$(function () {
    $(document).on('click','.js-button-choice-linked', function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')
        // const choiceBook = $('#id-linked-' + isbn);
        //
        // $(".list-item-linked").hide();
        // $(choiceBook).show()

        $('#linked_book_title').html($("#js-linked-title-" + isbn).text())
        $('#linked_book_author').html($("#js-linked-author-" + isbn).text())
        $('#linked_book_isbn').html($("#js-linked-isbn-" + isbn).text())
        $('#linked_book_publisher').html($("#js-linked-publisher-" + isbn).text())

        const book_image = $("#js-linked-image-" + isbn).attr('src')
        $("<img src = " + book_image + ">").appendTo('div#linked_book_image')
        $("#linked_default_image").remove()

        const book_url = $("#js-linked-url-" + isbn).attr('href')
        $('#linked_book_url a').attr("href", book_url)
        $('.results_search_linked').remove()
        $('#review_area').show()
    })
});

$(function () {
    $(document).on('click', '.submit-button', function (e) {
        e.preventDefault();
        const linkingTitle = $("#linking-title").text()
        const linkingAuthor = $("#linking-author").text()
        const linkingIsbn = $("#linking-isbn").text()
        const linkingPublisher = $("#linking-publisher").text()
        const linkingImage = $("#linking-image").attr('src')
        const linkingUrl = $("#linking-url").attr('href')
        const linkingContent = $("#linking_content").val()

        const linkedTitle = $("#linked-title").text()
        const linkedAuthor = $("#linked-author").text()
        const linkedIsbn = $("#linked-isbn").text()
        const linkedPublisher = $("#linked-publisher").text()
        const linkedImage = $("#linked-image").attr('src')
        const linkedUrl = $("#linked-url").attr('href')
        const linkedContent = $("#linked_content").val()

        // $.ajax({
        //     type: "POST",
        //     url: "/posts",
        //     data: {
        //         linking: {
        //             title: linkingTitle,
        //             author: linkingAuthor,
        //             isbn: linkingIsbn,
        //             publisher: linkingPublisher,
        //             book_image: linkingImage,
        //             book_url: linkingUrl,
        //             content: linkingContent
        //         },
        //         linked: {
        //             title: linkedTitle,
        //             author: linkedAuthor,
        //             isbn: linkedIsbn,
        //             publisher: linkedPublisher,
        //             book_image: linkedImage,
        //             book_url: linkedUrl,
        //             content: linkedContent
        //         }
        //     }
        // }).done(function (data) {
        //     console.log('ok')
        //     console.log(data)
        //     console.log(data.post)
        //     location.href= "/mypage"
        //
        // }).fail(function (data) {
        //     console.log('bad')
        //     console.log(data)
        // })
    });
});