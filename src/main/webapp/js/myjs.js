$(function () { $('#showComment').collapse({
    toggle: false
})});

function noImg(img) {
    if (img===null){
        $('#moment_img').remove();
    }
}

