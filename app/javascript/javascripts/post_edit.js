$(function () {
    $(document).on('click', '.update-button', function (e) {
        e.preventDefault();
        const post_id = $(this).data('post-id')
        const linkingContent = $("#linking_content").val()
        const linkedContent = $("#linked_content").val()

        $.ajax({
            type: "PUT",
            url: "/posts/" + post_id,
            data: {
                linking: {
                    content: linkingContent
                },
                linked: {
                    content: linkedContent
                }
            }
        }).done(function (data) {
            console.log('ok')
            console.log(data)
            console.log(data.post)
            const post_id = data.post
            location.href= "/posts/"+ post_id

        }).fail(function (data) {
            console.log('bad')
            console.log(data)
        })
    });
});
