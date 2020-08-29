
$(function () {
    $(document).on('click','.js-button-choice-linking',function (e) {
        e.preventDefault();
        const isbn = $(this).data('book-id')
        const choiceBook = $('#id-linking-' + isbn);

        $(".list-item-linking").hide();
        $(choiceBook).show()
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