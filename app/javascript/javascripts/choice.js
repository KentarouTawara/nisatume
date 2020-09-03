
$(function () {
    $(document).on('click','.js-button-choice-linking', function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')
        const choiceBook = $('#id-linking-' + isbn).addClass('linking-book')

        $(".list-item-linking").hide();
        $(choiceBook).show()

        $('#linking_title').val($("#js-linking-title-" + isbn).html())

        $("#js-linking-title-" + isbn).attr('id', 'linking-title');
        $("#js-linking-author-" + isbn).attr('id', 'linking-author');
        $("#js-linking-isbn-" + isbn).attr('id', 'linking-isbn');
        $("#js-linking-publisher-" + isbn).attr('id', 'linking-publisher');
        $("#js-linking-image-" + isbn).attr('id', 'linking-image');
        $("#js-linking-url-" + isbn).attr('id', 'linking-url');
    })
});

$(function () {
    $(document).on('click','.js-button-choice-linked', function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')
        const choiceBook = $('#id-linked-' + isbn);

        $(".list-item-linked").hide();
        $(choiceBook).show()

        $("#js-linked-title-" + isbn).attr('id', 'linked-title');
        $("#js-linked-author-" + isbn).attr('id', 'linked-author');
        $("#js-linked-isbn-" + isbn).attr('id', 'linked-isbn');
        $("#js-linked-publisher-" + isbn).attr('id', 'linked-publisher');
        $("#js-linked-image-" + isbn).attr('id', 'linked-image');
        $("#js-linked-url-" + isbn).attr('id', 'linked-url');
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

        $.ajax({
            type: "POST",
            url: "/posts",
            data: {
                linking: {
                    title: linkingTitle,
                    author: linkingAuthor,
                    isbn: linkingIsbn,
                    publisher: linkingPublisher,
                    book_image: linkingImage,
                    book_url: linkingUrl,
                    content: linkingContent
                },
                linked: {
                    title: linkedTitle,
                    author: linkedAuthor,
                    isbn: linkedIsbn,
                    publisher: linkedPublisher,
                    book_image: linkedImage,
                    book_url: linkedUrl,
                    content: linkedContent
                }
            }
        }).done(function (data) {
            console.log('ok')
            console.log(data)
            console.log(data.post)
            location.href= "/posts/" + data.post

        }).fail(function (data) {
            console.log('bad')
            console.log(data)
        })
    });
});